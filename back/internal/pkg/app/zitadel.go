package app

import (
	appZitadel "back/internal/pkg/app/zitadel"
	"context"
	"fmt"

	zitadelAdmin "github.com/zitadel/zitadel-go/v2/pkg/client/admin"
	zitadelAuth "github.com/zitadel/zitadel-go/v2/pkg/client/auth"
	zitadelManagement "github.com/zitadel/zitadel-go/v2/pkg/client/management"
	zAdminPb "github.com/zitadel/zitadel-go/v2/pkg/client/zitadel/admin"
	zManagementPb "github.com/zitadel/zitadel-go/v2/pkg/client/zitadel/management"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

type ZitadelService struct {
	zitadelAdmin               *zitadelAdmin.Client
	zitadelManagement          *zitadelManagement.Client
	zitadelGrantedProjectID    string
	zitadelGrantedProjectOrgID string
	zitadelAutoApprove         bool
	zitadelAuth                *zitadelAuth.Client
}

func NewZitadelService(
	adminClient *zitadelAdmin.Client,
	managementClient *zitadelManagement.Client,
	authClient *zitadelAuth.Client,
	grantedProjectID string,
	grantedProjectOrgID string,
	autoApprove bool,
) *ZitadelService {
	return &ZitadelService{
		zitadelAdmin:               adminClient,
		zitadelManagement:          managementClient,
		zitadelGrantedProjectID:    grantedProjectID,
		zitadelGrantedProjectOrgID: grantedProjectOrgID,
		zitadelAutoApprove:         autoApprove,
		zitadelAuth:                authClient,
	}
}

type SetupResult struct {
	UserID string
	OrgID  string
}

func (z *ZitadelService) GiveRoleToUser(ctx context.Context, userID, roleKey string) error {
	grantRequest := zManagementPb.AddUserGrantRequest{
		ProjectId: z.zitadelGrantedProjectID,
		UserId:    userID,
		RoleKeys:  []string{roleKey},
	}

	_, err := z.zitadelManagement.AddUserGrant(
		metadata.NewOutgoingContext(ctx, metadata.Pairs("x-zitadel-orgid", z.zitadelGrantedProjectOrgID)),
		&grantRequest)

	if statusErr := status.Convert(err); statusErr != nil {
		switch statusErr.Code() { //nolint:exhaustive
		case codes.AlreadyExists:
			return nil
		}
	}

	if err != nil {
		return fmt.Errorf("GiveRoleToUser zitadel add user grant: %w", err)
	}

	return nil
}
func (z *ZitadelService) CreateOrg(ctx context.Context, data CreateWorkspaceData) (SetupResult, error) {
	var result SetupResult
	setUpOrgRequest := zAdminPb.SetUpOrgRequest{
		Org: &zAdminPb.SetUpOrgRequest_Org{ //nolint:exhaustruct
			Name: data.Name,
		},
		User: &zAdminPb.SetUpOrgRequest_Human_{
			Human: &zAdminPb.SetUpOrgRequest_Human{ //nolint:exhaustruct
				UserName: data.Email,
				Profile: &zAdminPb.SetUpOrgRequest_Human_Profile{ //nolint:exhaustruct
					FirstName:         data.FirstName,
					LastName:          data.LastName,
					PreferredLanguage: "fr",
				},
				Email: &zAdminPb.SetUpOrgRequest_Human_Email{
					Email:           data.Email,
					IsEmailVerified: z.zitadelAutoApprove,
				},
				// TODO: do we want a phone number?
				//Phone: &zAdminPb.SetUpOrgRequest_Human_Phone{
				//	Phone:           "",
				//	IsPhoneVerified: false,
				// },
				Password: data.Password,
			},
		},
		//https://zitadel.com/docs/guides/manage/console/managers
		//Roles: []string{"ORG_OWNER_VIEWER", "ORG_USER_MANAGER", "ORG_USER_PERMISSION_EDITOR"},
		Roles: []string{"ORG_OWNER"},
	}

	setupResult, err := z.zitadelAdmin.SetUpOrg(ctx, &setUpOrgRequest)

	if statusErr := status.Convert(err); statusErr != nil {
		switch statusErr.Code() { //nolint:exhaustive
		case codes.InvalidArgument:
			return result, appZitadel.NewInvalidRequestError(statusErr)
		case codes.AlreadyExists:
			return result, ErrZitadelWorkspaceExists
		}
	}

	if err != nil {
		return result, fmt.Errorf("CreateWorkspace zitadel set up org: %w", err)
	}

	grantRequest := zManagementPb.AddProjectGrantRequest{
		ProjectId:    z.zitadelGrantedProjectID,
		GrantedOrgId: setupResult.OrgId,
		RoleKeys:     []string{ZitadelAppProjectGrantRoleWkspAdmin, ZitadelAppProjectGrantRoleUser},
	}

	grantResponse, err := z.zitadelManagement.AddProjectGrant(
		metadata.NewOutgoingContext(ctx, metadata.Pairs("x-zitadel-orgid", z.zitadelGrantedProjectOrgID)),
		&grantRequest,
	)

	if err != nil {
		return result, fmt.Errorf("CreateWorkspace zitadel add project grant: %w", err)
	}

	addUserGrantRequest := zManagementPb.AddUserGrantRequest{
		ProjectId:      z.zitadelGrantedProjectID,
		UserId:         setupResult.UserId,
		ProjectGrantId: grantResponse.GrantId,
		RoleKeys:       []string{ZitadelAppProjectGrantRoleWkspAdmin},
	}

	_, err = z.zitadelManagement.AddUserGrant(
		metadata.NewOutgoingContext(ctx, metadata.Pairs("x-zitadel-orgid", setupResult.OrgId)),
		&addUserGrantRequest)

	if err != nil {
		return result, fmt.Errorf("CreateWorkspace zitadel add user grant: %w", err)
	}
	result.UserID = setupResult.UserId
	result.OrgID = setupResult.OrgId

	return result, nil
}

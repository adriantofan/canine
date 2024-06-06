package api

import (
	"back/internal/pkg/auth/zitadel"
	"net/http"

	"github.com/gin-gonic/gin"
)

const kDefaultFileUploadSize = 10 << 20 // 10 MiB
func ConfigureRouter(
	router *gin.Engine,
	handlers *ChatHandlers,
	authMiddleware gin.HandlerFunc,
	identityMiddleware gin.HandlerFunc,
	apiLogger gin.HandlerFunc,
) {
	router.MaxMultipartMemory = 8 << 20 // 8 MiB
	router.GET("/healthz", func(c *gin.Context) { c.String(http.StatusOK, "") })

	apiRoutes := router.Group("/api/v1")
	apiRoutes.Use(apiLogger) // Order matters, this should be the first middleware on the group
	apiRoutes.GET("/healthz", func(c *gin.Context) { c.String(http.StatusOK, "") })
	apiRoutes.Use(gin.Recovery())

	authRoutes := apiRoutes.Group("/auth")
	authRoutes.Use(authMiddleware)

	authRoutes.GET("/info", handlers.GetAuthInfo)

	apiRoutes.GET("/workspaces", handlers.CreateWorkspace)
	// ATTENTION: This is a security check to ensure that the user is only allowed to access their own workspace
	// it MUST match the workspace_id param as defined in the identity middleware
	workspaceGroup := apiRoutes.Group("/:" + zitadel.WorkspaceIDParam)

	// TODO: write a firebase middleware
	workspaceGroup.Use(authMiddleware)
	workspaceGroup.GET("/authz/check", handlers.CheckAuthorization)

	workspaceGroup.Use(identityMiddleware)
	workspaceGroup.GET("/me", handlers.GetAuthInfo)

	workspaceGroup.POST("/users", handlers.CreateUser)

	usersGroup := workspaceGroup.Group("/users/:user_id")

	usersGroup.GET("", handlers.GetUser)

	// on the users group in order to be able to count how many connections a user has
	usersGroup.GET("/rtc/connect", handlers.RTCConnect)
	usersGroup.POST("/rtc/session", handlers.RTCStartSession)

	workspaceGroup.POST("/conversations", handlers.CreateConversation)
	workspaceGroup.GET("/conversations", handlers.GetConversations)

	conversationGroup := workspaceGroup.Group("/conversations/:conversation_id")
	conversationGroup.POST("/messages", handlers.CreateMessage)
	conversationGroup.GET("/messages", handlers.GetConversationMessages)
}

//
// Code generated by go-jet DO NOT EDIT.
//
// WARNING: Changes to this file may cause incorrect behavior
// and will be lost if the code is regenerated
//

package table

import (
	"github.com/go-jet/jet/v2/postgres"
)

var User = newUserTable("public", "user", "")

type userTable struct {
	postgres.Table

	// Columns
	ID          postgres.ColumnInteger
	WorkspaceID postgres.ColumnInteger
	Email       postgres.ColumnString
	Type        postgres.ColumnString
	CreatedAt   postgres.ColumnTimestamp
	UpdatedAt   postgres.ColumnTimestamp
	AuthID      postgres.ColumnString
	Phone       postgres.ColumnString

	AllColumns     postgres.ColumnList
	MutableColumns postgres.ColumnList
}

type UserTable struct {
	userTable

	EXCLUDED userTable
}

// AS creates new UserTable with assigned alias
func (a UserTable) AS(alias string) *UserTable {
	return newUserTable(a.SchemaName(), a.TableName(), alias)
}

// Schema creates new UserTable with assigned schema name
func (a UserTable) FromSchema(schemaName string) *UserTable {
	return newUserTable(schemaName, a.TableName(), a.Alias())
}

// WithPrefix creates new UserTable with assigned table prefix
func (a UserTable) WithPrefix(prefix string) *UserTable {
	return newUserTable(a.SchemaName(), prefix+a.TableName(), a.TableName())
}

// WithSuffix creates new UserTable with assigned table suffix
func (a UserTable) WithSuffix(suffix string) *UserTable {
	return newUserTable(a.SchemaName(), a.TableName()+suffix, a.TableName())
}

func newUserTable(schemaName, tableName, alias string) *UserTable {
	return &UserTable{
		userTable: newUserTableImpl(schemaName, tableName, alias),
		EXCLUDED:  newUserTableImpl("", "excluded", ""),
	}
}

func newUserTableImpl(schemaName, tableName, alias string) userTable {
	var (
		IDColumn          = postgres.IntegerColumn("id")
		WorkspaceIDColumn = postgres.IntegerColumn("workspace_id")
		EmailColumn       = postgres.StringColumn("email")
		TypeColumn        = postgres.StringColumn("type")
		CreatedAtColumn   = postgres.TimestampColumn("created_at")
		UpdatedAtColumn   = postgres.TimestampColumn("updated_at")
		AuthIDColumn      = postgres.StringColumn("auth_id")
		PhoneColumn       = postgres.StringColumn("phone")
		allColumns        = postgres.ColumnList{IDColumn, WorkspaceIDColumn, EmailColumn, TypeColumn, CreatedAtColumn, UpdatedAtColumn, AuthIDColumn, PhoneColumn}
		mutableColumns    = postgres.ColumnList{WorkspaceIDColumn, EmailColumn, TypeColumn, CreatedAtColumn, UpdatedAtColumn, AuthIDColumn, PhoneColumn}
	)

	return userTable{
		Table: postgres.NewTable(schemaName, tableName, alias, allColumns...),

		//Columns
		ID:          IDColumn,
		WorkspaceID: WorkspaceIDColumn,
		Email:       EmailColumn,
		Type:        TypeColumn,
		CreatedAt:   CreatedAtColumn,
		UpdatedAt:   UpdatedAtColumn,
		AuthID:      AuthIDColumn,
		Phone:       PhoneColumn,

		AllColumns:     allColumns,
		MutableColumns: mutableColumns,
	}
}

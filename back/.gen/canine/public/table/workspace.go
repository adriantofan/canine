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

var Workspace = newWorkspaceTable("public", "workspace", "")

type workspaceTable struct {
	postgres.Table

	// Columns
	ID        postgres.ColumnInteger
	Name      postgres.ColumnString
	CreatedAt postgres.ColumnTimestamp
	UpdatedAt postgres.ColumnTimestamp

	AllColumns     postgres.ColumnList
	MutableColumns postgres.ColumnList
}

type WorkspaceTable struct {
	workspaceTable

	EXCLUDED workspaceTable
}

// AS creates new WorkspaceTable with assigned alias
func (a WorkspaceTable) AS(alias string) *WorkspaceTable {
	return newWorkspaceTable(a.SchemaName(), a.TableName(), alias)
}

// Schema creates new WorkspaceTable with assigned schema name
func (a WorkspaceTable) FromSchema(schemaName string) *WorkspaceTable {
	return newWorkspaceTable(schemaName, a.TableName(), a.Alias())
}

// WithPrefix creates new WorkspaceTable with assigned table prefix
func (a WorkspaceTable) WithPrefix(prefix string) *WorkspaceTable {
	return newWorkspaceTable(a.SchemaName(), prefix+a.TableName(), a.TableName())
}

// WithSuffix creates new WorkspaceTable with assigned table suffix
func (a WorkspaceTable) WithSuffix(suffix string) *WorkspaceTable {
	return newWorkspaceTable(a.SchemaName(), a.TableName()+suffix, a.TableName())
}

func newWorkspaceTable(schemaName, tableName, alias string) *WorkspaceTable {
	return &WorkspaceTable{
		workspaceTable: newWorkspaceTableImpl(schemaName, tableName, alias),
		EXCLUDED:       newWorkspaceTableImpl("", "excluded", ""),
	}
}

func newWorkspaceTableImpl(schemaName, tableName, alias string) workspaceTable {
	var (
		IDColumn        = postgres.IntegerColumn("id")
		NameColumn      = postgres.StringColumn("name")
		CreatedAtColumn = postgres.TimestampColumn("created_at")
		UpdatedAtColumn = postgres.TimestampColumn("updated_at")
		allColumns      = postgres.ColumnList{IDColumn, NameColumn, CreatedAtColumn, UpdatedAtColumn}
		mutableColumns  = postgres.ColumnList{NameColumn, CreatedAtColumn, UpdatedAtColumn}
	)

	return workspaceTable{
		Table: postgres.NewTable(schemaName, tableName, alias, allColumns...),

		//Columns
		ID:        IDColumn,
		Name:      NameColumn,
		CreatedAt: CreatedAtColumn,
		UpdatedAt: UpdatedAtColumn,

		AllColumns:     allColumns,
		MutableColumns: mutableColumns,
	}
}

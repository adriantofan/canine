package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

const kDefaultFileUploadSize = 10 << 20 // 10 MiB
func ConfigureRouter(router *gin.Engine, handlers *ChatHandlers, authMiddleware gin.HandlerFunc, apiLogger gin.HandlerFunc) {
	router.MaxMultipartMemory = 8 << 20 // 8 MiB
	router.GET("/healthz", func(c *gin.Context) { c.String(http.StatusOK, "") })

	apiRoutes := router.Group("/api/v1")
	apiRoutes.Use(apiLogger) // Order matters, this should be the first middleware on the group
	apiRoutes.GET("/healthz", func(c *gin.Context) { c.String(http.StatusOK, "") })
	apiRoutes.Use(gin.Recovery())

	authRoutes := apiRoutes.Group("/auth")
	authRoutes.Use(authMiddleware)
	authRoutes.GET("/me", handlers.GetMe)

	apiRoutes.POST("/workspaces", handlers.CreateWorkspace)
	workspaceGroup := apiRoutes.Group("/:workspace_id")

	// TODO: write a firebase middleware
	workspaceGroup.Use(authMiddleware)

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

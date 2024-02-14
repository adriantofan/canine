package api

import (
	jwt "github.com/appleboy/gin-jwt/v2"

	"github.com/gin-gonic/gin"
)

func ConfigureRouter(router *gin.Engine, handlers *ChatHandlers, authMiddleware *jwt.GinJWTMiddleware) {
	router.Use(gin.Logger())
	router.Use(gin.Recovery())
	router.POST("/login", authMiddleware.LoginHandler)
	router.POST("/workspace", handlers.CreateWorkspace)
	workspaceGroup := router.Group("/:workspace_id")
	workspaceGroup.GET("/refresh_token", authMiddleware.RefreshHandler)

	workspaceGroup.Use(authMiddleware.MiddlewareFunc())

	workspaceGroup.POST("/users", handlers.CreateUser)

	usersGroup := workspaceGroup.Group("/users/:user_id")

	usersGroup.GET("", handlers.GetUser)

	workspaceGroup.POST("/conversations", handlers.CreateConversation)
	workspaceGroup.GET("/conversations", handlers.GetConversations)

	conversationGroup := workspaceGroup.Group("/conversations/:conversation_id")
	conversationGroup.POST("/messages", handlers.CreateMessage)
	conversationGroup.GET("/messages", handlers.GetConversationMessages)
}

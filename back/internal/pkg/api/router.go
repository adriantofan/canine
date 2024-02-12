package api

import (
	"github.com/gin-gonic/gin"
)

func ConfigureRouter(router *gin.Engine, handlers *ChatHandlers, middleware *ChatMiddleware) {
	router.Use(gin.Logger())
	router.Use(gin.Recovery())

	router.POST("/users", handlers.CreateUser)

	usersGroup := router.Group("/users/:user_id")
	usersGroup.Use(middleware.UserMiddleware)
	usersGroup.GET("", handlers.GetUser)

	router.POST("/conversations", handlers.CreateConversation)
	router.GET("/conversations", handlers.GetConversations)

	conversationGroup := router.Group("/conversations/:conversation_id")
	conversationGroup.POST("/messages", handlers.CreateMessage)
	conversationGroup.GET("/messages", handlers.GetConversationMessages)
}

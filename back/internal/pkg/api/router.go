package api

import (
	"github.com/gin-gonic/gin"
	"time"
)

func ConfigureRouter(router *gin.Engine, handlers *ChatHandlers, middleware *ChatMiddleware) {

	router.Use(gin.Logger())
	router.Use(gin.Recovery())
	router.GET("/notifications", SSEMiddleware(), handlers.ServerSideEventsHandler)

	router.POST("/users", handlers.CreateUser)

	usersGroup := router.Group("/users/:user_id")
	usersGroup.Use(middleware.UserMiddleware)
	usersGroup.GET("", handlers.GetUser)

	router.POST("/conversations", handlers.CreateConversation)
	router.GET("/conversations", handlers.GetConversations)

	conversationGroup := router.Group("/conversations/:conversation_id")
	conversationGroup.POST("/messages", handlers.CreateMessage)
	conversationGroup.GET("/messages", handlers.GetConversationMessages)

	router.GET("/tmp-conversations", func(ctx *gin.Context) {
		results := make([]interface{}, 0)
		time.Sleep(1 * time.Second)
		for i := 0; i < 20; i++ {
			results = append(results, gin.H{
				"id":   i,
				"name": "tmp-conversation",
			},
			)
		}
		ctx.JSON(200, results)
	})
}

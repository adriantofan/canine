package model

import "back/internal/pkg/domain/model/primitive"

type UserVersion struct {
	MaxUpdateTime primitive.MillisecondsTime `json:"max_update_time"`
}

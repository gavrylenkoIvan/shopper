package handler

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

type userId struct {
	Id int `json:"id"`
}

func (h *Handler) setUserId(c *gin.Context) {
	isAdmin, err := getAdminCtx(c)
	fmt.Println(isAdmin)
	if err != nil {
		newErrorResponse(c, http.StatusUnauthorized, err.Error())
		return
	}

	if !isAdmin {
		newErrorResponse(c, http.StatusUnauthorized, "you don`t have permission to perform this action")
		return
	}

	var id userId

	if err := c.BindJSON(&id); err != nil {
		newErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.Set(userCtx, id.Id)
	c.JSON(http.StatusOK, status{
		Ok: true,
	})
}
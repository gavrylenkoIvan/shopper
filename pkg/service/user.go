package service

import (
	"shopper"
	"shopper/pkg/repo"
)

type UserService struct {
	repo repo.User
}

func NewUserService(repo repo.User) *UserService {
	return &UserService{
		repo: repo,
	}
}

func (s *UserService) DeleteUser(userId int) error {
	return s.repo.DeleteUser(userId)
}

func (s *UserService) GetUserNotifications(userId int) ([]shopper.Notification, error) {
	return s.repo.GetUserNotifications(userId)
}

func (s *UserService) GetUserHistory(userId int) ([]shopper.Item, error) {
	return s.repo.GetUserHistory(userId)
}

func (s *UserService) UpdateUser(userId int, input shopper.UpdateUserInput) error {
	return s.repo.UpdateUser(userId, input)
}

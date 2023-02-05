package baitap.ss12_user.service;

import baitap.ss12_user.model.User;
import baitap.ss12_user.repository.IUserRepository;
import baitap.ss12_user.repository.UserRepositoryImpl;

import java.sql.*;
import java.util.List;

public class UserServiceImpl implements IUserService{
    private IUserRepository repository = new UserRepositoryImpl();

    @Override
    public void insertUser(User user) throws SQLException {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }
}

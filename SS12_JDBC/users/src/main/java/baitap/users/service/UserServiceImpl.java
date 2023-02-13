package baitap.users.service;

import baitap.users.model.User;
import baitap.users.repository.UserRepository;
import baitap.users.repository.UserRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    private UserRepository repository = new UserRepositoryImpl();

    @Override
    public void insertUser(User user) throws SQLException {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return repository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return repository.updateUser(user);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return repository.selectUserByCountry(country);
    }

    @Override
    public List<User> sortUserByName() {
        return repository.sortUserByName();
    }

    @Override
    public User getUserById(int id) {
        return repository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        repository.insertUserStore(user);
    }

    @Override
    public List<User> getAllUsersStore() {
        return repository.getAllUsersStore();
    }

    @Override
    public boolean updateUserStore(User user) throws SQLException {
        return repository.updateUserStore(user);
    }

    @Override
    public boolean deleteUserStore(int id) throws SQLException {
        return repository.deleteUserStore(id);
    }
}


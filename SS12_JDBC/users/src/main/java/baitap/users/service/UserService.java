package baitap.users.service;

import baitap.users.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> selectUserByCountry(String country);

    public List<User> sortUserByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    public List<User> getAllUsersStore();

    public boolean updateUserStore(User user) throws SQLException;
    public boolean deleteUserStore(int id) throws SQLException;


}

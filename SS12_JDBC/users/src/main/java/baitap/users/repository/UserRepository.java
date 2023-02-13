package baitap.users.repository;

import baitap.users.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> selectUserByCountry(String country);

    public List<User> sortUserByName();

    public List<User> selectAllUsersByStored();
    public boolean updateUserByStored(User user) throws SQLException;
    public boolean deleteUserByStored(int id) throws SQLException;


}

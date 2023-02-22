package com.example.accounts.repository;

import com.example.accounts.model.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountRepositoryImpl implements AccountRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/account?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    private static final String INSERT_ACC_SQL = "INSERT INTO saving_account " +
            "(account_code," +
            "account_name," +
            "account_create_date," +
            "saving_amount," +
            "saving_deposit_date," +
            "saving_interest_rate,term_id) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ACC_SQL = "SELECT * FROM saving_account";
    private static final String SELECT_BY_ID = "select * from saving_account where account_id =?";
    private static final String UPDATE_BY_ID = "update saving_account set " +
            "account_code = ?, " +
            "account_name = ?, " +
            "account_create_date = ?, " +
            "saving_amount = ?, " +
            "saving_deposit_date = ?, " +
            "saving_interest_rate = ?, " +
            "term_id = ?  " +
            "where account_id =?";
    private static final String DELETE_BY_ID = "delete from saving_account where account_id = ?;";
    private static final String SEARCH = "SELECT \n" +
            "    *\n" +
            "FROM\n" +
            "    saving_account\n" +
            "WHERE\n" +
            "    account_code LIKE '%?%'\n" +
            "        OR account_name LIKE '%?%'";

    public AccountRepositoryImpl() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public List<Account> selectAll() {
        List<Account> list = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACC_SQL);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String accountCode = rs.getString("account_code");
                String accountName = rs.getString("account_name");
                Date createDate = rs.getDate("account_create_date");
                int amount = rs.getInt("saving_amount");
                Date depositDate = rs.getDate("saving_deposit_date");
                int interestRate = rs.getInt("saving_interest_rate");
                int termId = rs.getInt("term_id");
                list.add(new Account(accountId, accountCode, accountName, createDate, amount, depositDate, interestRate, termId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }

    @Override
    public void insert(Account account) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACC_SQL);) {
            preparedStatement.setString(1, account.getAccountCode());
            preparedStatement.setString(2, account.getAccountName());
            preparedStatement.setDate(3, account.getCreateDate());
            preparedStatement.setInt(4, account.getAmount());
            preparedStatement.setDate(5, account.getDepositDate());
            preparedStatement.setInt(6, account.getInterestRate());
            preparedStatement.setInt(7, account.getTermId());
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Account select(int accountId) {
        Account account = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);) {
            preparedStatement.setInt(1, accountId);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String accountCode = rs.getString("account_code");
                String accountName = rs.getString("account_name");
                Date createDate = rs.getDate("account_create_date");
                int amount = rs.getInt("saving_amount");
                Date depositDate = rs.getDate("saving_deposit_date");
                int interestRate = rs.getInt("saving_interest_rate");
                int termId = rs.getInt("term_id");
                account = new Account(accountId, accountCode, accountName, createDate, amount, depositDate, interestRate, termId);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return account;
    }

    @Override
    public boolean update(Account account) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);) {
            preparedStatement.setString(1, account.getAccountCode());
            preparedStatement.setString(2, account.getAccountName());
            preparedStatement.setDate(3, account.getCreateDate());
            preparedStatement.setInt(4, account.getAmount());
            preparedStatement.setDate(5, account.getDepositDate());
            preparedStatement.setInt(6, account.getInterestRate());
            preparedStatement.setInt(7, account.getTermId());
            preparedStatement.setInt(8, account.getAccountId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }

    @Override
    public boolean delete(int accountId) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BY_ID);) {
            statement.setInt(1, accountId);

            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    @Override
    public List<Account> search(String strSearch) {
        List<Account> accounts = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH.replace("?", strSearch));) {
//            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);){
//                preparedStatement.setString(1, "%" + strSearch + "%");
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String accountCode = rs.getString("account_code");
                String accountName = rs.getString("account_name");
                Date createDate = rs.getDate("account_create_date");
                int amount = rs.getInt("saving_amount");
                Date depositDate = rs.getDate("saving_deposit_date");
                int interestRate = rs.getInt("saving_interest_rate");
                int termId = rs.getInt("term_id");
                accounts.add(new Account(accountId, accountCode, accountName, createDate, amount, depositDate, interestRate, termId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return accounts;
    }
}

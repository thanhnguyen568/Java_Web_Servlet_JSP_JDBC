package example.account.repository;

import example.account.model.SavingAccount;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SavingAccRepositoryImpl implements SavingAccRepository {
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

    public SavingAccRepositoryImpl() {
    }

    //connection
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

    //print
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

    //Select
    @Override
    public List<SavingAccount> selectAll() {
        List<SavingAccount> accounts = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACC_SQL);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String accountCode = rs.getString("account_code");
                String accountName = rs.getString("account_name");
                Date accountCreateDate = rs.getDate("account_create_date");
                int savingAmount = rs.getInt("saving_amount");
                Date savingDepositDate = rs.getDate("saving_deposit_date");
                int savingInterestRate = rs.getInt("saving_interest_rate");
                int termId = rs.getInt("term_id");
                accounts.add(new SavingAccount(accountId, accountCode, accountName, accountCreateDate, savingAmount, savingDepositDate, savingInterestRate, termId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return accounts;
    }

    //Insert
    @Override
    public void insert(SavingAccount savingAccount) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACC_SQL);) {
            preparedStatement.setString(1, savingAccount.getAccountCode());
            preparedStatement.setString(2, savingAccount.getAccountName());
            preparedStatement.setDate(3, savingAccount.getAccountCreateDate());
            preparedStatement.setInt(4, savingAccount.getSavingAmount());
            preparedStatement.setDate(5, savingAccount.getSavingDepositDate());
            preparedStatement.setInt(6, savingAccount.getSavingInterestRate());
            preparedStatement.setInt(7, savingAccount.getTermId());
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //select by id
    @Override
    public SavingAccount select(int accountId) {
        SavingAccount savingAccount = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);) {
            preparedStatement.setInt(1, accountId);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String accountCode = rs.getString("account_code");
                String accountName = rs.getString("account_name");
                Date accountCreateDate = rs.getDate("account_create_date");
                int savingAmount = rs.getInt("saving_amount");
                Date savingDepositDate = rs.getDate("saving_deposit_date");
                int savingInterestRate = rs.getInt("saving_interest_rate");
                int termId = rs.getInt("term_id");
                savingAccount = new SavingAccount(accountId, accountCode, accountName, accountCreateDate, savingAmount, savingDepositDate, savingInterestRate, termId);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return savingAccount;
    }

    //Update
    @Override
    public boolean update(SavingAccount savingAccount) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);) {
            preparedStatement.setString(1, savingAccount.getAccountCode());
            preparedStatement.setString(2, savingAccount.getAccountName());
            preparedStatement.setDate(3, savingAccount.getAccountCreateDate());
            preparedStatement.setInt(4, savingAccount.getSavingAmount());
            preparedStatement.setDate(5, savingAccount.getSavingDepositDate());
            preparedStatement.setInt(6, savingAccount.getSavingInterestRate());
            preparedStatement.setInt(7, savingAccount.getTermId());
            preparedStatement.setInt(8, savingAccount.getAccountId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }

    //Delete
    @Override
    public boolean delete(int accountId) {
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

    //Search
    @Override
    public List<SavingAccount> search(String strSearch) {
        List<SavingAccount> accounts = new ArrayList<>();

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
                    Date accountCreateDate = rs.getDate("account_create_date");
                    int savingAmount = rs.getInt("saving_amount");
                    Date savingDepositDate = rs.getDate("saving_deposit_date");
                    int savingInterestRate = rs.getInt("saving_interest_rate");
                    int termId = rs.getInt("term_id");
                    accounts.add(new SavingAccount(accountId, accountCode, accountName, accountCreateDate, savingAmount, savingDepositDate, savingInterestRate, termId));
                }
            } catch(SQLException e){
                printSQLException(e);
            }
            return accounts;
        }

    }

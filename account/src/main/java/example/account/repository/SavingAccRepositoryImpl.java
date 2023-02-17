package example.account.repository;

import example.account.model.SavingAccount;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class SavingAccRepositoryImpl implements SavingAccRepository {
    private static DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

    private static final String INSERT_SAVING_ACC_SQL = "INSERT INTO saving_account (account_code,account_name,account_create_date,saving_amount,saving_deposit_date,saving_interest_rate,term_id) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_SAVING_ACC = "SELECT * FROM saving_account";

    private String jdbcURL = "jdbc:mysql://localhost:3306/account?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";

    public SavingAccRepositoryImpl() {
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
    public void insertSavingAcc(SavingAccount savingAccount) throws SQLException {
        System.out.println(INSERT_SAVING_ACC_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SAVING_ACC_SQL);) {
            preparedStatement.setString(1, savingAccount.getAccountCode());
            preparedStatement.setString(2, savingAccount.getAccountName());
            preparedStatement.setDate(3, (Date) savingAccount.getAccountCreateDate());
            preparedStatement.setInt(4, savingAccount.getSavingAmount());
            preparedStatement.setDate(5, (Date) savingAccount.getSavingDepositDate());
            preparedStatement.setInt(6, savingAccount.getSavingInterestRate());
            preparedStatement.setInt(7, savingAccount.getTermId());
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<SavingAccount> selectAllAcc() {
        List<SavingAccount> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SAVING_ACC);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");;
                String accountCode = rs.getString("account_code");
                String accountName = rs.getString("account_name");
                Date accountCreateDate = rs.getDate("account_create_date");
                int savingAmount = rs.getInt("saving_amount");
                Date savingDepositDate = rs.getDate("saving_deposit_date");
                int savingInterestRate = rs.getInt("saving_interest_rate");
                int termId = rs.getInt("term_id");;
                accounts.add(new SavingAccount(accountId, accountCode,accountName,accountCreateDate,savingAmount,savingDepositDate,savingInterestRate,termId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return accounts;
    }

    @Override
    public boolean updateSavingAcc(SavingAccount savingAccount) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteSavingAcc(int accountId) throws SQLException {
        return false;
    }

    @Override
    public SavingAccount selectSavingAccount(int accountId) {
        return null;
    }
}

package example.account.repository;

import example.account.model.SavingAccount;
import example.account.model.Term;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TermRepositoryImpl implements TermRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/account?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    private static final String SELECT_TERM_LIST = "SELECT * FROM term";


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

    @Override
    public List<Term> listTerm() {
        List<Term> termList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TERM_LIST);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int termId = rs.getInt("term_id");
                String termName = rs.getString("term_name");
                termList.add(new Term(termId, termName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return termList;
    }
}

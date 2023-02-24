package exam.exam.repository;

import exam.exam.model.House;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HouseRepositoryImpl implements HouseRepository {
    private static final String SELECT_HOUSE_SQL = "SELECT * FROM house order by house_area asc";
    private static final String INSERT_HOUSE_SQL = "insert into house(house_code, house_area, house_status,house_flour," +
            "house_type,house_des,house_price,house_start_date,house_end_date) \n" +
            "\tvalues(?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_BY_CODE = "select * from house where house_code =?";
    private static final String DELETE_BY_CODE = "delete from house where house_code = ?;";
    private String jdbcURL = "jdbc:mysql://localhost:3306/complex?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";

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
    public List<House> selectAll() {
        List<House> list = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOUSE_SQL);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String houseCode = rs.getString("house_code");
                int houseArea = rs.getInt("house_area");
                String houseStatus = rs.getString("house_status");
                int houseFlour = rs.getInt("house_flour");
                String houseType = rs.getString("house_type");
                String houseDes = rs.getString("house_des");
                int housePrice = rs.getInt("house_price");
                Date houseStart = rs.getDate("house_start_date");
                Date houseEnd = rs.getDate("house_end_date");
                list.add(new House(houseCode, houseArea, houseStatus, houseFlour, houseType, houseDes, housePrice, houseStart, houseEnd));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }

    @Override
    public void insert(House house) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_HOUSE_SQL);) {
            preparedStatement.setString(1, house.getHouseCode());
            preparedStatement.setInt(2, house.getHouseArea());
            preparedStatement.setString(3, house.getHouseStatus());
            preparedStatement.setInt(4, house.getHouseFlour());
            preparedStatement.setString(5, house.getHouseType());
            preparedStatement.setString(6, house.getHouseDes());
            preparedStatement.setInt(7, house.getHousePrice());
            preparedStatement.setDate(8, house.getHouseStart());
            preparedStatement.setDate(9, house.getHouseEnd());
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public House select(String Code) {
        House house = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_CODE);) {
            preparedStatement.setString(1,Code);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String houseCode = rs.getString("house_code");
                int houseArea = rs.getInt("house_area");
                String houseStatus = rs.getString("house_status");
                int houseFlour = rs.getInt("house_flour");
                String houseType = rs.getString("house_type");
                String houseDes = rs.getString("house_des");
                int housePrice = rs.getInt("house_price");
                Date houseStart = rs.getDate("house_start_date");
                Date houseEnd = rs.getDate("house_end_date");
                house = new House(houseCode, houseArea, houseStatus, houseFlour, houseType, houseDes, housePrice,
                        houseStart, houseEnd);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return house;
    }

    @Override
    public boolean delete(String houseCode) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BY_CODE);) {
            statement.setString(1, houseCode);

            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    @Override
    public List<House> search(String strSearch) {
        return null;
    }
}

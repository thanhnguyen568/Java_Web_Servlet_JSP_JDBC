package exam.exam.repository;

import exam.exam.model.House;

import java.sql.SQLException;
import java.util.List;

public interface HouseRepository {
    List<House> selectAll();

    void insert(House house) throws SQLException;

    House select(String code);

    boolean delete(String houseCode) throws SQLException;

    List<House> search(String strSearch);
}

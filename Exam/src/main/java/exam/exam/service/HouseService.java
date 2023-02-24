package exam.exam.service;

import exam.exam.model.House;

import java.sql.SQLException;
import java.util.List;

public interface HouseService {
    List<House> selectAll();

    void insert(House house) throws SQLException;

    House select(String houseCode);

    boolean delete(String houseCode) throws SQLException;

    List<House> search(String strSearch);
}

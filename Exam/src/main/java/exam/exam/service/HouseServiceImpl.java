package exam.exam.service;

import exam.exam.model.House;
import exam.exam.repository.HouseRepository;
import exam.exam.repository.HouseRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class HouseServiceImpl implements HouseService {
    HouseRepository repository = new HouseRepositoryImpl();

    @Override
    public List<House> selectAll() {
        return repository.selectAll();
    }

    @Override
    public void insert(House house) throws SQLException {
    repository.insert(house);
    }

    @Override
    public House select(String houseCode) {
        return repository.select(houseCode);
    }

    @Override
    public boolean delete(String houseCode) throws SQLException {
        return repository.delete(houseCode);
    }

    @Override
    public List<House> search(String strSearch) {
        return null;
    }
}

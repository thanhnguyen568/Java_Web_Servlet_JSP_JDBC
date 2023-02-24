package exam.exam.controller;

import exam.exam.model.House;
import exam.exam.repository.HouseRepository;
import exam.exam.repository.HouseRepositoryImpl;

import java.util.List;

public class test {
    public static void main(String[] args) {
        HouseRepository repository = new HouseRepositoryImpl();
        List<House> list = repository.selectAll();
        for (House o : list) {
            System.out.println(o);
        }
    }
}

package example.account.model;

import example.account.repository.SavingAccRepository;
import example.account.repository.SavingAccRepositoryImpl;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        SavingAccRepository repository =new SavingAccRepositoryImpl();
        List<SavingAccount> list = repository.selectAll();
        for ( SavingAccount o: list){
            System.out.println(o);
        }
    }
}

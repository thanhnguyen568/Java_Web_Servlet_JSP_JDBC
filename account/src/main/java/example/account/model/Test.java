package example.account.model;

import example.account.repository.SavingAccRepository;
import example.account.repository.SavingAccRepositoryImpl;
import example.account.repository.TermRepository;
import example.account.repository.TermRepositoryImpl;

import java.util.List;

public class Test {
    public static void main(String[] args) {
//        SavingAccRepository repository = new SavingAccRepositoryImpl();
//        List<SavingAccount> list = repository.selectAll();
//        for (SavingAccount o : list) {
//            System.out.println(o);
//        }

        TermRepository repository1 = new TermRepositoryImpl();
        List<Term> list1 = repository1.listTerm();
        for (Term a : list1) {
            System.out.println(a);
        }
    }
}

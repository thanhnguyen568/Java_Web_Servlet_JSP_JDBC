package example.account.repository;

import example.account.model.SavingAccount;

import java.sql.SQLException;
import java.util.List;

public interface SavingAccRepository {

    List<SavingAccount> selectAll();

    void insert(SavingAccount savingAccount);

    SavingAccount select(int accountId);

    boolean update(SavingAccount savingAccount);

    boolean delete(int accountId);

    List<SavingAccount> search(String str);

}

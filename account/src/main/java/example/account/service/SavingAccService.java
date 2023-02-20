package example.account.service;

import example.account.model.SavingAccount;

import java.sql.SQLException;
import java.util.List;

public interface SavingAccService {
    List<SavingAccount> selectAllAcc();

    void insert(SavingAccount savingAccount) throws SQLException;

    boolean update(SavingAccount savingAccount) throws SQLException;

    boolean delete(int accountId) throws SQLException;

    SavingAccount select(int accountId);

}

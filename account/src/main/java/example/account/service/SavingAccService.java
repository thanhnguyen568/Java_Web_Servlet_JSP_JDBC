package example.account.service;

import example.account.model.SavingAccount;

import java.sql.SQLException;
import java.util.List;

public interface SavingAccService {
    void insertSavingAcc(SavingAccount savingAccount) throws SQLException;

    List<SavingAccount> selectAllAcc();

    boolean updateSavingAcc(SavingAccount savingAccount) throws SQLException;

    boolean deleteSavingAcc(int accountId) throws SQLException;

    SavingAccount selectSavingAccount(int accountId);

}

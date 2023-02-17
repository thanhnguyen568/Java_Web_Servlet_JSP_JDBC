package example.account.service;

import example.account.model.SavingAccount;
import example.account.repository.SavingAccRepository;
import example.account.repository.SavingAccRepositoryImpl;


import java.sql.SQLException;
import java.util.List;

public class SavingAccServiceImpl implements SavingAccService {
    private SavingAccRepository repository = new SavingAccRepositoryImpl();

    @Override
    public void insertSavingAcc(SavingAccount savingAccount) throws SQLException {
        repository.insertSavingAcc(savingAccount);
    }

    @Override
    public List<SavingAccount> selectAllAcc() {
        return repository.selectAllAcc();
    }

    @Override
    public boolean updateSavingAcc(SavingAccount savingAccount) throws SQLException {
        return repository.updateSavingAcc(savingAccount);
    }

    @Override
    public boolean deleteSavingAcc(int accountId) throws SQLException {
        return repository.deleteSavingAcc(accountId);
    }

    @Override
    public SavingAccount selectSavingAccount(int accountId) {
        return repository.selectSavingAccount(accountId);
    }
}

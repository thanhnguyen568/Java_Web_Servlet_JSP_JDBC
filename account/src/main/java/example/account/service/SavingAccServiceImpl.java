package example.account.service;

import example.account.model.SavingAccount;
import example.account.repository.SavingAccRepository;
import example.account.repository.SavingAccRepositoryImpl;
import example.account.util.RegexPattern;


import java.sql.SQLException;
import java.util.List;

public class SavingAccServiceImpl implements SavingAccService, RegexPattern {
    private SavingAccRepository repository = new SavingAccRepositoryImpl();

    @Override
    public List<SavingAccount> selectAllAcc() {
        return repository.selectAll();
    }

    @Override
    public void insert(SavingAccount savingAccount) throws SQLException {
        repository.insert(savingAccount);
    }

    @Override
    public SavingAccount select(int accountId) {
        return repository.select(accountId);
    }

    @Override
    public boolean update(SavingAccount savingAccount) throws SQLException {
        return repository.update(savingAccount);
    }

    @Override
    public boolean delete(int accountId) throws SQLException {
        return repository.delete(accountId);
    }


    @Override
    public List<SavingAccount> search(String strSearch) {
        return repository.search(strSearch);
    }

    public boolean validationCode(String input) {
        return input.matches(REGEX_CODE_ACC);
    }

    public boolean validationName(String input) {
        return input.matches(REGEX_NAME_ACC);
    }

    public boolean validationDate(String input) {
        return input.matches(REGEX_DATE_ACC);
    }

    public boolean validationNum(String input) {
        return input.matches(REGEX_NUMBER_ACC);
    }
}

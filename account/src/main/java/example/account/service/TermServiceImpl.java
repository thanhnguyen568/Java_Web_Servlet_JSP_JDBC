package example.account.service;

import example.account.model.Term;
import example.account.repository.TermRepository;
import example.account.repository.TermRepositoryImpl;

import java.util.List;

public class TermServiceImpl implements TermService {
    TermRepository repository = new TermRepositoryImpl();

    @Override
    public List<Term> listTerm() {
        return repository.listTerm();
    }
}

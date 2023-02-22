package example.account.util;

public interface RegexPattern {
    String REGEX_CODE_ACC = "SA-[0-9]";
    String REGEX_NAME_ACC = "^[A-Z][a-z]{50}$";
    String REGEX_DATE_ACC = "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$";
    String REGEX_NUMBER_ACC = "[0-9]*";

    String REGEX_BIRTH_DAY = "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$";
    String REGEX_NAME = "^[A-Z][a-z]+(\\s[A-Z][a-z]*)*$";
    String REGEX_EMAIL = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
    String REGEX_GENDER = "Male|Female|Unknown";
    String REGEX_PHONE = "(84|0[3|5|7|8|9])+([0-9]{8})\\b";
    String REGEX_LEVEL = "Intermediate|College|University|AfterUniversity";
    String REGEX_POSITION = "Receptionist|Staff|Experts|Monitoring|Manage|Director";
    String REGEX_CUSTOMER_TYPE = "Member|Silver|Gold|Platinum|Diamond";
}

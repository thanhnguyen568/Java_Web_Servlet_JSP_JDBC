package codegym.baitap.ss10.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Customer {
    private String name;
    private Date birthday;
    private String address;
    private String photo;

    private static final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    public Customer() {
    }

    public Customer(String name, String birthday, String address, String photo) {
        this.name = name;
        try {
            this.birthday = df.parse(birthday);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        this.address = address;
        this.photo = photo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "name='" + name + '\'' +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }

}

package codegym.baitap.ss10;

import codegym.baitap.ss10.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class DBUtil {
    private static final List<Customer> CUSTOMERS = new ArrayList<>();

    static {
        initData();
    }

    // Mô phỏng dữ liệu trong Database.
    private static void initData(){
        Customer customerA = new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg");
        Customer customerB = new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://media.istockphoto.com/id/1128925057/fr/photo/taille-du-corps-pleine-longueur-d%C3%A9couvre-delle-elle-assez-attrayante-joyeuse-joyeuse.jpg?s=612x612&w=0&k=20&c=bHzjqWnBWitx_hb9mZAm8Cui0k3ep5O0L8PYQ_JiCNg=");
        Customer customerC = new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://media.istockphoto.com/id/956432910/fr/photo/pleine-longueur-pleine-grandeur-fullbody-portrait-de-fou-ludique-et-enfantin-dr%C3%B4le-jolie.jpg?s=612x612&w=0&k=20&c=ZrvCzb1XZg9C5dcllJWQuZGmNSsnbvexc9uEok1SzE8=");
        Customer customerD = new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://media.istockphoto.com/id/1092712040/fr/photo/jambes-enti%C3%A8res-du-corps-taille-belle-dame-deux-adorables-magnifique-isol%C3%A9-sur-fond-jaune.jpg?s=612x612&w=0&k=20&c=F2swrdJWZmIROqRsdmxqM8133zsYzfUIoqCcYVtRD5s=");
        Customer customerE = new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Hà Nội", "https://www.shutterstock.com/image-photo/fashionable-woman-stylish-hairstyle-makeup-260nw-1563483592.jpg");
        CUSTOMERS.add(customerA);
        CUSTOMERS.add(customerB);
        CUSTOMERS.add(customerC);
        CUSTOMERS.add(customerD);
        CUSTOMERS.add(customerE);
    }

    // Truy vấn bảng Customer.
    public static List<Customer> queryCustomer(){
        return CUSTOMERS;
    }

}

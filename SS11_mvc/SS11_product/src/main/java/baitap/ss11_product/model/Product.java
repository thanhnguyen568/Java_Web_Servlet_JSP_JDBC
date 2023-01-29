package baitap.ss11_product.model;

public class Product {
    private int id;
    private String nameProduct;
    private double price;
    private String description;
    private String manufacturer;

    public Product() {
    }

    public Product(int id, String nameProduct, double price, String description, String manufacturer) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", nameProduct='" + nameProduct + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                '}';
    }
}

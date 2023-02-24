package exam.exam.model;

import java.sql.Date;

public class House {
    private String houseCode;
    private int houseArea;
    private String houseStatus;
    private int houseFlour;
    private String houseType;
    private String houseDes;
    private int housePrice;
    private Date houseStart;
    private Date houseEnd;

    public House() {
    }

    public House(String houseCode, int houseArea, String houseStatus, int houseFlour, String houseType, String houseDes, int housePrice, Date houseStart, Date houseEnd) {
        this.houseCode = houseCode;
        this.houseArea = houseArea;
        this.houseStatus = houseStatus;
        this.houseFlour = houseFlour;
        this.houseType = houseType;
        this.houseDes = houseDes;
        this.housePrice = housePrice;
        this.houseStart = houseStart;
        this.houseEnd = houseEnd;
    }

    public String getHouseCode() {
        return houseCode;
    }

    public void setHouseCode(String houseCode) {
        this.houseCode = houseCode;
    }

    public int getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(int houseArea) {
        this.houseArea = houseArea;
    }

    public String getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(String houseStatus) {
        this.houseStatus = houseStatus;
    }

    public int getHouseFlour() {
        return houseFlour;
    }

    public void setHouseFlour(int houseFlour) {
        this.houseFlour = houseFlour;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getHouseDes() {
        return houseDes;
    }

    public void setHouseDes(String houseDes) {
        this.houseDes = houseDes;
    }

    public int getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(int housePrice) {
        this.housePrice = housePrice;
    }

    public Date getHouseStart() {
        return houseStart;
    }

    public void setHouseStart(Date houseStart) {
        this.houseStart = houseStart;
    }

    public Date getHouseEnd() {
        return houseEnd;
    }

    public void setHouseEnd(Date houseEnd) {
        this.houseEnd = houseEnd;
    }

    @Override
    public String toString() {
        return "House{" +
                "houseCode='" + houseCode + '\'' +
                ", houseArea=" + houseArea +
                ", houseStatus='" + houseStatus + '\'' +
                ", houseFlour=" + houseFlour +
                ", houseType='" + houseType + '\'' +
                ", houseDes='" + houseDes + '\'' +
                ", housePrice=" + housePrice +
                ", houseStart=" + houseStart +
                ", houseEnd=" + houseEnd +
                '}';
    }
}

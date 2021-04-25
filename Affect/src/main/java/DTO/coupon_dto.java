package DTO;

public class coupon_dto {
    private int cpNumber;
    private float cpPercent;
    private String cpName;

    public int getCpNumber() {
        return cpNumber;
    }

    public void setCpNumber(int cpNumber) {
        this.cpNumber = cpNumber;
    }

    public float getCpPercent() {
        return cpPercent;
    }

    public void setCpPercent(float cpPercent) {
        this.cpPercent = cpPercent;
    }

    public String getCpName() {
        return cpName;
    }

    public void setCpName(String cpName) {
        this.cpName = cpName;
    }
}

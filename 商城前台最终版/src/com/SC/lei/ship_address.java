package com.SC.lei;

public class ship_address {
    private int ship_id;
    private String ship_name;
    private String ship_num;
    private String ship_address;
    private String ship_da;
    private String ship_code;
    private int u_id;

    public ship_address() {
    }

    public ship_address(int ship_id) {
        this.ship_id = ship_id;
    }

    public ship_address(String ship_name, String ship_num, String ship_address, String ship_da, String ship_code, int u_id) {
        this.ship_name = ship_name;
        this.ship_num = ship_num;
        this.ship_address = ship_address;
        this.ship_da = ship_da;
        this.ship_code = ship_code;
        this.u_id = u_id;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public String getShip_name() {
        return ship_name;
    }

    public void setShip_name(String ship_name) {
        this.ship_name = ship_name;
    }

    public String getShip_num() {
        return ship_num;
    }

    public void setShip_num(String ship_num) {
        this.ship_num = ship_num;
    }

    public String getShip_address() {
        return ship_address;
    }

    public void setShip_address(String ship_address) {
        this.ship_address = ship_address;
    }

    public String getShip_da() {
        return ship_da;
    }

    public void setShip_da(String ship_da) {
        this.ship_da = ship_da;
    }

    public String getShip_code() {
        return ship_code;
    }

    public void setShip_code(String ship_code) {
        this.ship_code = ship_code;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }
}

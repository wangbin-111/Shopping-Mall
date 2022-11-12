package com.ttsxht.vo;

public class OrderSystemVO {
    private int order_id;
    private String ship_name;
    private String ship_num;
    private String date;
    private String ship_address;
    private String g_name;
    private String type;//商品规格
    private String count;//数量
    private Double allmoney;
    private String fastmail;
    private String paytype;
    private String state;

    public OrderSystemVO() {
    }

    public OrderSystemVO(int order_id) {
        this.order_id = order_id;
    }

    public OrderSystemVO(int order_id, String ship_name, String ship_num, String date, String ship_address, String g_name, String type, String count, Double allmoney, String fastmail, String paytype, String state) {
        this.order_id = order_id;
        this.ship_name = ship_name;
        this.ship_num = ship_num;
        this.date = date;
        this.ship_address = ship_address;
        this.g_name = g_name;
        this.type = type;
        this.count = count;
        this.allmoney = allmoney;
        this.fastmail = fastmail;
        this.paytype = paytype;
        this.state = state;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getShip_address() {
        return ship_address;
    }

    public void setShip_address(String ship_address) {
        this.ship_address = ship_address;
    }

    public String getG_name() {
        return g_name;
    }

    public void setG_name(String g_name) {
        this.g_name = g_name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public Double getAllmoney() {
        return allmoney;
    }

    public void setAllmoney(Double allmoney) {
        this.allmoney = allmoney;
    }

    public String getFastmail() {
        return fastmail;
    }

    public void setFastmail(String fastmail) {
        this.fastmail = fastmail;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}

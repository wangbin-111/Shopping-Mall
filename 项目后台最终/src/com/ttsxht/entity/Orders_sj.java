package com.ttsxht.entity;

public class Orders_sj {
    private int order_id;
    private int u_id;
    private String g_id;
    private String date;
    private String ordernum;
    private String state;
    private int ship_id;
    private String fastmail;
    private String paytype;
    private String count;
    private double allmoney;
    private String type;
    public Orders_sj() {
    }

    public Orders_sj(int order_id) {
        this.order_id = order_id;
    }

    public Orders_sj(int u_id, String g_id, String date, String ordernum, String state, int ship_id, String fastmail, String paytype, String count, double allmoney, String type) {

        this.u_id = u_id;
        this.g_id = g_id;
        this.date = date;
        this.ordernum = ordernum;
        this.state = state;
        this.ship_id = ship_id;
        this.fastmail = fastmail;
        this.paytype = paytype;
        this.count = count;
        this.allmoney = allmoney;
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getG_id() {
        return g_id;
    }

    public void setG_id(String g_id) {
        this.g_id = g_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
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

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public double getAllmoney() {
        return allmoney;
    }

    public void setAllmoney(double allmoney) {
        this.allmoney = allmoney;
    }
}

package com.ttsxht.entity;

public class OrderInfo {
    private int order_id;
    private String ordernum;
    private String name;
    private String phoneNum;
    private String date;
    private String address;
    private  String state;

    public OrderInfo(int order_id) {
        this.order_id = order_id;
    }

    public OrderInfo() {

    }

    public OrderInfo(int order_id, String ordernum, String name, String phoneNum, String date, String address, String state) {
        this.order_id = order_id;
        this.ordernum = ordernum;
        this.name = name;
        this.phoneNum = phoneNum;
        this.date = date;
        this.address = address;
        this.state = state;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "orderInfo{" +
                "order_id=" + order_id +
                ", ordernum='" + ordernum + '\'' +
                ", name='" + name + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", date='" + date + '\'' +
                ", address='" + address + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}

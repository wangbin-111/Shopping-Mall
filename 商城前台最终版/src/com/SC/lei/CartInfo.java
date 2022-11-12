package com.SC.lei;


//订单页面表
public class CartInfo {
    private Integer c_id;
    private String c_type;
    private int c_count;
    private Goods goods;


    public CartInfo(Integer c_id, String c_type, int c_count, Goods goods) {
        this.c_id = c_id;
        this.c_type = c_type;
        this.c_count = c_count;
        this.goods = goods;
    }

    public String getC_type() {
        return c_type;
    }

    public void setC_type(String c_type) {
        this.c_type = c_type;
    }

    public int getC_count() {
        return c_count;
    }

    public void setC_count(int c_count) {
        this.c_count = c_count;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}

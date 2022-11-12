package com.ttsxht.entity;

import java.util.Date;

public class Cart {
    private Integer id;
    private String username;
    private String goods;
    private Integer num;
    private Date date;

    public Cart() {
    }

    public Cart(Integer id) {
        this.id = id;
    }

    public Cart(Integer id, String username, String goods, Integer num, Date date) {
        this.id = id;
        this.username = username;
        this.goods = goods;
        this.num = num;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

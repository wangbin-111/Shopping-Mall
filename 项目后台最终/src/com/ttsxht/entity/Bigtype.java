package com.ttsxht.entity;

public class Bigtype {
    private Integer bt_id;
    private String bt_name;

    public Bigtype(Integer bt_id, String bt_name) {
        this.bt_id = bt_id;
        this.bt_name = bt_name;
    }

    public Bigtype(Integer bt_id) {
        this.bt_id = bt_id;
    }

    public Bigtype(String bt_name) {
        this.bt_name = bt_name;
    }

    public Bigtype() {
    }

    public Integer getBt_id() {
        return bt_id;
    }

    public void setBt_id(Integer bt_id) {
        this.bt_id = bt_id;
    }

    public String getBt_name() {
        return bt_name;
    }

    public void setBt_name(String bt_name) {
        this.bt_name = bt_name;
    }

    @Override
    public String toString() {
        return "Bigtype{" +
                "bt_id=" + bt_id +
                ", bt_name='" + bt_name + '\'' +
                '}';
    }
}

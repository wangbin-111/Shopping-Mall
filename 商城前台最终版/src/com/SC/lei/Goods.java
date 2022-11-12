package com.SC.lei;

public class Goods {
    private Integer g_id;
    private String g_name;
    private String g_smalltype;
    private String g_bigtype;
    private String g_url;
    private String g_typeurl;
    private String g_url2;
    private double g_price;
    private int g_hot;
    private String g_remark;
    private String g_date;
    private int g_num;
    public Goods() {
    }

    public Goods(Integer g_id) {
        this.g_id = g_id;
    }

    public Goods(Integer g_id, String g_name, String g_smalltype, String g_bigtype, String g_url, String g_typeurl, String g_url2, double g_price, int g_hot, String g_remark, String g_date, int g_num) {
        this.g_id = g_id;
        this.g_name = g_name;
        this.g_smalltype = g_smalltype;
        this.g_bigtype = g_bigtype;
        this.g_url = g_url;
        this.g_typeurl = g_typeurl;
        this.g_url2 = g_url2;
        this.g_price = g_price;
        this.g_hot = g_hot;
        this.g_remark = g_remark;
        this.g_date = g_date;
        this.g_num = g_num;
    }

    public int getG_num() {
        return g_num;
    }

    public void setG_num(int g_num) {
        this.g_num = g_num;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public String getG_name() {
        return g_name;
    }

    public void setG_name(String g_name) {
        this.g_name = g_name;
    }

    public String getG_smalltype() {
        return g_smalltype;
    }

    public void setG_smalltype(String g_smalltype) {
        this.g_smalltype = g_smalltype;
    }

    public String getG_bigtype() {
        return g_bigtype;
    }

    public void setG_bigtype(String g_bigtype) {
        this.g_bigtype = g_bigtype;
    }

    public String getG_url() {
        return g_url;
    }

    public void setG_url(String g_url) {
        this.g_url = g_url;
    }

    public String getG_typeurl() {
        return g_typeurl;
    }

    public void setG_typeurl(String g_typeurl) {
        this.g_typeurl = g_typeurl;
    }

    public String getG_url2() {
        return g_url2;
    }

    public void setG_url2(String g_url2) {
        this.g_url2 = g_url2;
    }

    public double getG_price() {
        return g_price;
    }

    public void setG_price(double g_price) {
        this.g_price = g_price;
    }

    public int getG_hot() {
        return g_hot;
    }

    public void setG_hot(int g_hot) {
        this.g_hot = g_hot;
    }

    public String getG_remark() {
        return g_remark;
    }

    public void setG_remark(String g_remark) {
        this.g_remark = g_remark;
    }

    public String getG_date() {
        return g_date;
    }

    public void setG_date(String g_date) {
        this.g_date = g_date;
    }
}

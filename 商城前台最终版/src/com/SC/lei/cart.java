package com.SC.lei;

public class cart {
    private int c_id;
    private int c_count;
    private  int g_id;
    private int  u_id;
    private String c_type;
    public cart() {
    }

    public cart(int c_id) {
        this.c_id = c_id;
    }

    public cart( int c_count, int g_id, int u_id, String c_type) {
        this.c_count = c_count;
        this.g_id = g_id;
        this.u_id = u_id;
        this.c_type = c_type;
    }

    public String getC_type() {
        return c_type;
    }

    public void setC_type(String c_type) {
        this.c_type = c_type;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public int getC_count() {
        return c_count;
    }

    public void setC_count(int c_count) {
        this.c_count = c_count;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }
}

package com.SC.lei;

public class evaluates {
    private int e_id;
    private int order_id;
    private String evaluate;
    private int u_id;
    private String e_url;
    private String grade;
    private String g_id;

    public evaluates() {
    }

    public evaluates(int e_id) {
        this.e_id = e_id;
    }

    public evaluates(int order_id, String evaluate, int u_id, String e_url, String grade, String g_id) {
        this.order_id = order_id;
        this.evaluate = evaluate;
        this.u_id = u_id;
        this.e_url = e_url;
        this.grade = grade;
        this.g_id = g_id;
    }

    public String getG_id() {
        return g_id;
    }

    public void setG_id(String g_id) {
        this.g_id = g_id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getE_url() {
        return e_url;
    }

    public void setE_url(String e_url) {
        this.e_url = e_url;
    }
}

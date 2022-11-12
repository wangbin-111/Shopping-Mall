package com.SC.lei;

public class showSPPJ {
    private  String g_id;
    private  String evaluate;
    private  String e_url;
    private  String grade;
    private  String headimg;
    private  String name;

    public showSPPJ() {
    }

    public showSPPJ(String g_id) {
        this.g_id = g_id;
    }

    public showSPPJ( String evaluate, String e_url, String grade, String headimg, String name) {

        this.evaluate = evaluate;
        this.e_url = e_url;
        this.grade = grade;
        this.headimg = headimg;
        this.name = name;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public String getE_url() {
        return e_url;
    }

    public void setE_url(String e_url) {
        this.e_url = e_url;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

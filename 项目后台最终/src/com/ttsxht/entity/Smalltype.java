package com.ttsxht.entity;

public class Smalltype {
    private Integer st_id;
    private String st_name;

    public Smalltype(Integer st_id) {
        this.st_id = st_id;
    }

    public Smalltype() {
    }

    public Smalltype(String st_name) {
        this.st_name = st_name;
    }

    public Integer getSt_id() {
        return st_id;
    }

    public void setSt_id(Integer st_id) {
        this.st_id = st_id;
    }

    public String getSt_name() {
        return st_name;
    }

    public void setSt_name(String st_name) {
        this.st_name = st_name;
    }

    @Override
    public String toString() {
        return "Smalltype{" +
                "st_id=" + st_id +
                ", st_name='" + st_name + '\'' +
                '}';
    }
}

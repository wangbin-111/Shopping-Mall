package com.ttsxht.entity;

public class State {
    private Integer state;
    private String s_name;

    public State(Integer state, String s_name) {
        this.state = state;
        this.s_name = s_name;
    }

    public State() {
    }

    public State(Integer state) {
        this.state = state;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }
}

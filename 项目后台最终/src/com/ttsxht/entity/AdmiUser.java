package com.ttsxht.entity;

public class AdmiUser {
    private String admiusername;
    private String admipassword;

    public AdmiUser() {
    }

    public AdmiUser(String admiusername, String admipassword) {
        this.admiusername = admiusername;
        this.admipassword = admipassword;
    }

    public AdmiUser(String admiusername) {
        this.admiusername = admiusername;
    }

    public String getAdmiusername() {
        return admiusername;
    }

    public void setAdmiusername(String admiusername) {
        this.admiusername = admiusername;
    }

    public String getAdmipassword() {
        return admipassword;
    }

    public void setAdmipassword(String admipassword) {
        this.admipassword = admipassword;
    }
}

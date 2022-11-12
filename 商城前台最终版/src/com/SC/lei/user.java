package com.SC.lei;

public class user {
    private int u_id;
    private String email;
    private String password;
    private String name;
    private String birthday;
    private String gender;
    private String address;
    private String headimg;

    public user() {
    }

    public user(int u_id) {
        this.u_id = u_id;
    }

    public user(String email, String password, String name, String birthday, String gender, String address, String headimg) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.address = address;
        this.headimg = headimg;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    @Override
    public String toString() {
        return "user{" +
                "u_id=" + u_id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", birthday='" + birthday + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", headimg='" + headimg + '\'' +
                '}';
    }
}

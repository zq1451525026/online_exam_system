package com.lanqiao.vo;

import java.io.Serializable;

/**
 * Created by 王良 on 2018/9/27 on ${Time}.
 */
public class UsersInfo implements Serializable {
    private Integer userId;
    private String userName;
    private String password;
    private String tel;
    private String email;

    public UsersInfo() {
    }

    public UsersInfo(Integer userId, String userName, String password, String tel, String email) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.tel = tel;
        this.email = email;
    }

    public Integer getUserId() {

        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "UsersInfo{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}

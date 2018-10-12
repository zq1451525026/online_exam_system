package com.lanqiao.vo;

public class Student {
	private Integer stuNo;
	private String stuName;
	private String idCard;
	private String eduction;
	private String profession;
	private int phoneNumber;
	private int qqNumber;
	private String city;

    public Student() {
    }

    public Student(Integer stuNo, String stuName, String idCard, String eduction, String profession, int phoneNumber, int qqNumber, String city) {
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.idCard = idCard;
        this.eduction = eduction;
        this.profession = profession;
        this.phoneNumber = phoneNumber;
        this.qqNumber = qqNumber;
        this.city = city;
    }

    public Integer getStuNo() {
        return stuNo;
    }

    public void setStuNo(Integer stuNo) {
        this.stuNo = stuNo;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getEduction() {
        return eduction;
    }

    public void setEduction(String eduction) {
        this.eduction = eduction;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getQqNumber() {
        return qqNumber;
    }

    public void setQqNumber(int qqNumber) {
        this.qqNumber = qqNumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stuNo=" + stuNo +
                ", stuName='" + stuName + '\'' +
                ", idCard='" + idCard + '\'' +
                ", eduction='" + eduction + '\'' +
                ", profession='" + profession + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", qqNumber=" + qqNumber +
                ", city='" + city + '\'' +
                '}';
    }
}

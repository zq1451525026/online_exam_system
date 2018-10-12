package com.lanqiao.vo;

import java.util.List;

/**
 * Created by XWPC on 2018/10/6.
 */
public class Courses {
    private Integer id;
    private String course_name;
    private List<Tech_category> techCategoryList;

    public Courses() {
    }

    public Courses(Integer id, String course_name) {
        this.id = id;
        this.course_name = course_name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public List<Tech_category> getTechCategoryList() {
        return techCategoryList;
    }

    public void setTechCategoryList(List<Tech_category> techCategoryList) {
        this.techCategoryList = techCategoryList;
    }

    @Override
    public String toString() {
        return "Courses{" +
                "id=" + id +
                ", course_name='" + course_name + '\'' +
                ", techCategoryList=" + techCategoryList +
                '}';
    }
}

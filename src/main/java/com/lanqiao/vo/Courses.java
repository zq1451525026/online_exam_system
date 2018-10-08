package com.lanqiao.vo;

/**
 * Created by Administrator on 2018/10/4.
 */
public class Courses {
   /* create table Courses(
            id integer not null primary key,
            course_name varchar2(20) not null
            )*/

    private Integer id;
    private String course_name;

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

    @Override
    public String toString() {
        return "Courses{" +
                "id=" + id +
                ", course_name='" + course_name + '\'' +
                '}';
    }
}

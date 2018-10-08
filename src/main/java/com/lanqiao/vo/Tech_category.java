package com.lanqiao.vo;

/**
 * Created by Administrator on 2018/10/4.
 */
public class Tech_category {
    /*create table Tech_category(
            id integer not null primary key,
            tech_ctgr varchar2(100) not null,
    course_id references Courses(id)
)*/

    private Integer id;
    private String tech_ctgr;
    private Integer course_id;
    private Courses courses;

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public Tech_category() {
    }

    public Tech_category(Integer id, String tech_ctgr, Integer course_id) {
        this.id = id;
        this.tech_ctgr = tech_ctgr;
        this.course_id = course_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTech_ctgr() {
        return tech_ctgr;
    }

    public void setTech_ctgr(String tech_ctgr) {
        this.tech_ctgr = tech_ctgr;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }


    @Override
    public String toString() {
        return "Tech_category{" +
                "id=" + id +
                ", tech_ctgr='" + tech_ctgr + '\'' +
                ", course_id=" + course_id +
                '}';
    }
}

package com.lanqiao.vo;

import java.util.Date;

/**
 * Created by 王良 on 2018/10/10 on ${Time}.
 */

public class Olts_score {
    private Integer id;
    private Integer score;
    private Integer fsp_score;
    private Date test_date;
    private String descrpt;
    private Integer user_id;
    private String exam_no;
    private Integer allScore;
    private String lvl;

    public Olts_score() {
    }

    public Olts_score(Integer id, Integer score, Integer fsp_score, Date test_date, String descrpt) {

        this.id = id;
        this.score = score;
        this.fsp_score = fsp_score;
        this.test_date = test_date;
        this.descrpt = descrpt;
    }

    public String getLvl() {
        return lvl;
    }

    public void setLvl(String lvl) {
        this.lvl = lvl;
    }

    public Integer getAllScore() {
        return allScore;
    }

    public void setAllScore(Integer allScore) {
        this.allScore = allScore;
    }

    public Integer getId() {
        return id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getExam_no() {
        return exam_no;
    }

    public void setExam_no(String exam_no) {
        this.exam_no = exam_no;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getFsp_score() {
        return fsp_score;
    }

    public void setFsp_score(Integer fsp_score) {
        this.fsp_score = fsp_score;
    }

    public Date getTest_date() {
        return test_date;
    }

    public void setTest_date(Date test_date) {
        this.test_date = test_date;
    }

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt;
    }

    @Override
    public String toString() {
        return "Olts_score{" +
                "id=" + id +
                ", score=" + score +
                ", fsp_score=" + fsp_score +
                ", test_date=" + test_date +
                ", descrpt='" + descrpt + '\'' +
                ", user_id=" + user_id +
                ", exam_no='" + exam_no + '\'' +
                ", allScore=" + allScore +
                '}';
    }
}

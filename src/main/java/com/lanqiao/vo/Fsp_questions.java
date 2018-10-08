package com.lanqiao.vo;

import java.util.Date;

/**
 * Created by Administrator on 2018/10/7.
 */
public class Fsp_questions {
   /* id integer not null primary key,  	--主键
    question varchar2(3000) not null,  --题干
    std_answer clob, 	--标准答案
    question_type integer not null check(question_type in(4,5,6)), --考题类型：4.填空  5.简答   6.编程题
     tech_cate_id references tech_category(id),--考题知识点分类
    pubdate date default sysdate, 	--出题时间
    descrpt varchar(500)  			--考题说明信息*/

    private Integer id;
    private String question;
    private String std_answer;
    private Integer question_type;
    private Integer tech_cate_id;
    private Date pubdate;
    private String descrpt;

    public Fsp_questions() {
    }

    public Fsp_questions(Integer id, String question, String std_answer, Integer question_type, Integer tech_cate_id, Date pubdate, String descrpt) {
        this.id = id;
        this.question = question;
        this.std_answer = std_answer;
        this.question_type = question_type;
        this.tech_cate_id = tech_cate_id;
        this.pubdate = pubdate;
        this.descrpt = descrpt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getStd_answer() {
        return std_answer;
    }

    public void setStd_answer(String std_answer) {
        this.std_answer = std_answer;
    }

    public Integer getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(Integer question_type) {
        this.question_type = question_type;
    }

    public Integer getTech_cate_id() {
        return tech_cate_id;
    }

    public void setTech_cate_id(Integer tech_cate_id) {
        this.tech_cate_id = tech_cate_id;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt;
    }

    @Override
    public String toString() {
        return "Fsp_questions{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", std_answer=" + std_answer +
                ", question_type=" + question_type +
                ", tech_cate_id=" + tech_cate_id +
                ", pubdate=" + pubdate +
                ", descrpt='" + descrpt + '\'' +
                '}';
    }
}

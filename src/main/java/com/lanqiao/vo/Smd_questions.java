package com.lanqiao.vo;

import java.util.Date;

/**
 * Created by Administrator on 2018/10/4.
 */
public class Smd_questions {
    /*create table Smd_questions(
            id integer not null primary key,  --主键
            question varchar2(2000) not null,  --题干
    correct VARCHAR2(5) not null,  --考题答案
    question_type integer not null check(question_type in(1,2,3)), --考题类型：1.单选  2.多选  3.判断
    tech_cate_id references Tech_category(id), --考题知识点分类
    descrpt varchar(100),  --考题说明信息
    pubdate date default sysdate --出题时间
    --code_body  VARCHAR2(1000)*/
    private Integer id;
    private String question;
    private String correct;
    private Integer question_type;
    private Integer tech_cate_id;
    private String descrpt;
    private Date pubdate;

    private Smd_options options;
    private Tech_category category;

    //试卷的选项
    private String option_A;
    private String option_B;
    private String option_C;
    private String option_D;
    private String option_E;



    public Smd_questions() {
    }
    public Smd_questions(Integer id,String question) {
        this.question = question;
        this.id=id;
    }
    public Smd_questions(Integer id, String question, String correct, Integer question_type, Integer tech_cate_id, String descrpt, Date pubdate) {
        this.id = id;
        this.question = question;
        this.correct = correct;
        this.question_type = question_type;
        this.tech_cate_id = tech_cate_id;
        this.descrpt = descrpt;
        this.pubdate = pubdate;
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

    public String getCorrect() {
        return correct;
    }

    public void setCorrect(String correct) {
        this.correct = correct;
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

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }


    public Smd_options getOptions() {
        return options;
    }

    public void setOptions(Smd_options options) {
        this.options = options;
    }

    public Tech_category getCategory() {
        return category;
    }

    public void setCategory(Tech_category category) {
        this.category = category;
    }

    public String getOption_A() {
        return option_A;
    }

    public void setOption_A(String option_A) {
        this.option_A = option_A;
    }

    public String getOption_B() {
        return option_B;
    }

    public void setOption_B(String option_B) {
        this.option_B = option_B;
    }

    public String getOption_C() {
        return option_C;
    }

    public void setOption_C(String option_C) {
        this.option_C = option_C;
    }

    public String getOption_D() {
        return option_D;
    }

    public void setOption_D(String option_D) {
        this.option_D = option_D;
    }

    public String getOption_E() {
        return option_E;
    }

    public void setOption_E(String option_E) {
        this.option_E = option_E;
    }


    @Override
    public String toString() {
        return "Smd_questions{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", correct='" + correct + '\'' +
                ", question_type=" + question_type +
                ", tech_cate_id=" + tech_cate_id +
                ", descrpt='" + descrpt + '\'' +
                ", pubdate=" + pubdate +
                '}';
    }
}

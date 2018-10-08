package com.lanqiao.vo;

/**
 * Created by Administrator on 2018/10/6.
 */
public class Smd_options {
    private String id;
    private String option_A;
    private String option_B;
    private String option_C;
    private String option_D;
    private String option_E;
    private Integer question_id;

    public Smd_options() {
    }

    public Smd_options(String id, String option_A, String option_B, String option_C, String option_D, String option_E, Integer question_id) {
        this.id = id;
        this.option_A = option_A;
        this.option_B = option_B;
        this.option_C = option_C;
        this.option_D = option_D;
        this.option_E = option_E;
        this.question_id = question_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    @Override
    public String toString() {
        return "Smd_options{" +
                "id='" + id + '\'' +
                ", option_A='" + option_A + '\'' +
                ", option_B='" + option_B + '\'' +
                ", option_C='" + option_C + '\'' +
                ", option_D='" + option_D + '\'' +
                ", option_E='" + option_E + '\'' +
                ", question_id=" + question_id +
                '}';
    }
}

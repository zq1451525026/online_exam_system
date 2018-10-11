package com.lanqiao.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2018/10/4.
 */

/*
create table Examination(
   exam_no varchar(20) not null primary key, --考试编号系统生成（考点简称+YYYYMMDD+班级号）
   user_id references olts_users(id),        --出题老师的编号
   exam_date date, --考试时间
   single_id varchar2(500),           --所有单选题答题的题号，逗号分隔 1,2,5,9,
   multiple_id varchar2(500),         --所有多选题答题的题号，逗号分隔
   true_false_id varchar2(500),       --所有判断题答题的题号，逗号分隔
   --以下几题为主观题，不能系统打分
   fill_in_gaps_id varchar2(100),   --所有填空题答题的题号，逗号分隔
   simple_anwser_id varchar2(100),  --所有简答题答题的题号，逗号分隔
   program_id varchar2(100),        --所有编程题答题的题号，逗号分隔
   descrpt varchar(100),
   valid_flag integer --试卷有效状态标识：1有效，0/空无效
)
*/
public class Examination implements Serializable{
    private String exam_no;
    private Integer user_id;
    private Date exam_date;
    private String single_id;
    private String multiple_id;
    private String true_false_id;
    private String fill_in_gaps_id;
    private String simple_anwser_id;
    private String program_id;
    private String descrpt;
    private String valid_flag;
    private Smd_questions smd_questions;
    private Fsp_questions fsp_questions;

    public Fsp_questions getFsp_questions() {
        return fsp_questions;
    }

    public void setFsp_questions(Fsp_questions fsp_questions) {
        this.fsp_questions = fsp_questions;
    }

    public Examination() {
    }

    public Smd_questions getSmd_questions() {
        return smd_questions;
    }

    public void setSmd_questions(Smd_questions smd_questions) {
        this.smd_questions = smd_questions;
    }

    public Examination(String exam_no, Integer user_id, Date exam_date, String single_id, String multiple_id, String true_false_id, String fill_in_gaps_id, String simple_anwser_id, String program_id, String descrpt, String valid_flag) {
        this.exam_no = exam_no;
        this.user_id = user_id;
        this.exam_date = exam_date;
        this.single_id = single_id;
        this.multiple_id = multiple_id;
        this.true_false_id = true_false_id;
        this.fill_in_gaps_id = fill_in_gaps_id;
        this.simple_anwser_id = simple_anwser_id;
        this.program_id = program_id;
        this.descrpt = descrpt;
        this.valid_flag = valid_flag;
    }

    public String getExam_no() {
        return exam_no;
    }

    public void setExam_no(String exam_no) {
        this.exam_no = exam_no;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Date getExam_date() {
        return exam_date;
    }

    public void setExam_date(Date exam_date) {
        this.exam_date = exam_date;
    }

    public String getSingle_id() {
        return single_id;
    }

    public void setSingle_id(String single_id) {
        this.single_id = single_id;
    }

    public String getMultiple_id() {
        return multiple_id;
    }

    public void setMultiple_id(String multiple_id) {
        this.multiple_id = multiple_id;
    }

    public String getTrue_false_id() {
        return true_false_id;
    }

    public void setTrue_false_id(String true_false_id) {
        this.true_false_id = true_false_id;
    }

    public String getFill_in_gaps_id() {
        return fill_in_gaps_id;
    }

    public void setFill_in_gaps_id(String fill_in_gaps_id) {
        this.fill_in_gaps_id = fill_in_gaps_id;
    }

    public String getSimple_anwser_id() {
        return simple_anwser_id;
    }

    public void setSimple_anwser_id(String simple_anwser_id) {
        this.simple_anwser_id = simple_anwser_id;
    }

    public String getProgram_id() {
        return program_id;
    }

    public void setProgram_id(String program_id) {
        this.program_id = program_id;
    }

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt;
    }

    public String getValid_flag() {
        return valid_flag;
    }

    public void setValid_flag(String valid_flag) {
        this.valid_flag = valid_flag;
    }

    @Override
    public String toString() {
        return "Examination{" +
                "exam_no='" + exam_no + '\'' +
                ", user_id=" + user_id +
                ", exam_date=" + exam_date +
                ", single_id='" + single_id + '\'' +
                ", multiple_id='" + multiple_id + '\'' +
                ", true_false_id='" + true_false_id + '\'' +
                ", fill_in_gaps_id='" + fill_in_gaps_id + '\'' +
                ", simple_anwser_id='" + simple_anwser_id + '\'' +
                ", program_id='" + program_id + '\'' +
                ", descrpt='" + descrpt + '\'' +
                ", valid_flag='" + valid_flag + '\'' +
                ", smd_questions=" + smd_questions +
                ", fsp_questions=" + fsp_questions +
                '}';
    }
}

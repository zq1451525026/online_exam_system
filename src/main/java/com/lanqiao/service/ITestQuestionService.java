package com.lanqiao.service;

import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Fsp_questions;
import com.lanqiao.vo.Smd_options;
import com.lanqiao.vo.Smd_questions;

import java.util.List;

/**
 * Created by ASUS on 2018/10/7.
 */
public interface ITestQuestionService {

    List<Smd_options> selectTestQuestion(Smd_questions smd_questions, int pageNum, int pageSize);

    /*Smd_options selectOption(int type,int num);*/

    List<Smd_questions> contactquestion(Integer categoryId);

    Smd_options selectOptionByQuestionId(Integer questionId);

    int updateSmd_Option(Smd_options smd_options);

    int updateSmd_Question(Smd_questions smd_questions);

    int deleteSmd_Question(Smd_questions smd_questions);

    int deleteSmd_Option(Smd_options smd_options);

    /*编程，简答*/
    List<Fsp_questions> selectFspTestQuestion(Fsp_questions fsp_questions, Integer pageNum, int i);

    /*判断*/
    List<Smd_questions> selectTf(Smd_questions smd_questions, Integer pageNum, int i);

    int updateSmd_Question1(Smd_questions smd_questions);

    int updateSmd_Question2(Smd_questions smd_questions);

    List<Examination> selectAllExamination();

    void updatetExam(String examNo, String examid);

    void updateTrueFalse(String examno, String examid);

    void updateMultiple(String examno, String examid);

    void updateSimpleAnswer(String examno, String examid);

    void updateFillInGaps(String examno, String examid);

    void updateProgram(String examno, String examid);

}


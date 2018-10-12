package com.lanqiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.lanqiao.mapper.TestQuestionMapper;
import com.lanqiao.service.ITestQuestionService;
import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Fsp_questions;
import com.lanqiao.vo.Smd_options;
import com.lanqiao.vo.Smd_questions;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ASUS on 2018/10/7.
 */
@Service("testQuestionService")
public class TestQuestionServiceImpl implements ITestQuestionService {

    @Resource
    private TestQuestionMapper testQuestionMapper;

    @Override
    public List<Smd_options> selectTestQuestion(Smd_questions smd_questions, int pageNum, int pageSize) {

        PageHelper.startPage(pageNum,pageSize);

        return testQuestionMapper.selectTestQuestion(smd_questions,pageNum,pageSize);
    }


    /**
     * @题目类型 type
     * @第几题 num
     * @return 完整试题
     */
    /*@Override
    public Smd_options selectOption(int type,int num) {
        return testQuestionMapper.selectOption(type,num);
    }
*/
    @Override
    public List<Smd_questions> contactquestion(Integer categoryId) {
        return null;
    }

    @Override
    public Smd_options selectOptionByQuestionId(Integer questionId) {
        return testQuestionMapper.selectOptionByQuestionId(questionId);
    }
       /*编程题，简答题*/
    @Override
    public List<Fsp_questions> selectFspTestQuestion(Fsp_questions fsp_questions, Integer pageNum, int pageSize2) {
        PageHelper.startPage(pageNum,pageSize2);

        return testQuestionMapper.selectFspTestQuestion(fsp_questions,pageNum,pageSize2);
    }


    /*判断*/
    @Override
    public List<Smd_questions> selectTf(Smd_questions smd_questions, Integer pageNum, int i) {
        PageHelper.startPage(pageNum,i);
        return testQuestionMapper.selectTf(smd_questions,pageNum,i);
    }

    @Override
    public int updateSmd_Question1(Smd_questions smd_questions) {
        return testQuestionMapper.updateSmd_Question1(smd_questions);
    }

    @Override
    public int updateSmd_Question2(Smd_questions smd_questions) {
        return testQuestionMapper.updateSmd_Question2(smd_questions);
    }

    @Override
    public int updateSmd_Option(Smd_options smd_options) {
        return testQuestionMapper.updateSmd_Option(smd_options);
    }

    @Override
    public int updateSmd_Question(Smd_questions smd_questions) {
        return testQuestionMapper.updateSmd_Question(smd_questions);
    }

    @Override
    public int deleteSmd_Question(Smd_questions smd_questions) {
        return testQuestionMapper.deleteSmd_Question(smd_questions);
    }

    @Override
    public int deleteSmd_Option(Smd_options smd_options) {
        return testQuestionMapper.deleteSmd_Option(smd_options);
    }


    @Override
    public List<Examination> selectAllExamination()
    {
        return testQuestionMapper.selectAllExamination();
    }

    @Override
    public void updatetExam(String examNo,String examid)
    {
        testQuestionMapper.updatetExam(examNo,examid);
    }

    @Override
    public void updateTrueFalse(String examno, String examid) {
        testQuestionMapper.updateTrueFalse(examno,examid);
    }

    @Override
    public void updateMultiple(String examno, String examid) {
        testQuestionMapper.updateMultiple(examno,examid);
    }

    @Override
    public void updateSimpleAnswer(String examno, String examid) {
        testQuestionMapper.updateSimpleAnswer(examno, examid);
    }

    @Override
    public void updateFillInGaps(String examno, String examid) {
        testQuestionMapper.updateFillInGaps(examno, examid);
    }
    @Override
    public void updateProgram(String examno, String examid) {
        testQuestionMapper.updateProgram(examno, examid);
    }

}

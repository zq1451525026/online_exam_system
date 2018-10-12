package com.lanqiao.service;

import com.lanqiao.vo.Smd_options;
import com.lanqiao.vo.Smd_questions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by XWPC on 2018/10/9.
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class questionServiceTest2 {
    @Resource
    ITestQuestionService testQuestionService;

    @Test
    public void questionTest() throws Exception {
        Smd_questions smdQuestions = new Smd_questions();
        smdQuestions.setQuestion_type(1);
        List<Smd_options> smd_options = testQuestionService.selectTestQuestion(smdQuestions, 1, 5);
        for (Smd_options smd_option : smd_options) {
            System.out.println(smd_option);
        }
    }

    @Test
    public void testUpdateSmd_Option() throws Exception {
        int i = testQuestionService.updateSmd_Question(new Smd_questions(1,"下列选项错误的是"));
        System.out.println(i);
        int i1 = testQuestionService.updateSmd_Option(new Smd_options(null, "update user hr account unlock;", "update user hr account unlock;", "update user hr account unlock;", "update user hr account unlock;", 1));
        System.out.println(i1);
    }



   /* @Test
    public void oppionTest() throws Exception
    {Smd_questions smdQuestions = new Smd_questions();
        smdQuestions.setQuestion_type(1);

        List<Smd_questions> smd_questions = testQuestionService.selectTestQuestion(smdQuestions, 1, 5);
        for (Smd_questions smd_question : smd_questions) {
            System.out.println(smd_question);
        }
    }*/

    @Test
    public void updateExamTest() throws Exception {
        testQuestionService.updatetExam("123456789","4");
    }

    @Test
    public void trueFalseExamInsert() throws Exception {
        testQuestionService.updateTrueFalse("123456789","3");
    }

    @Test
    public void multipleTest() throws Exception {
        testQuestionService.updateMultiple("123456789","9");
    }

    @Test
    public void simpleAnswerTest() throws Exception {
        testQuestionService.updateSimpleAnswer("123456789","8");
    }

    @Test
    public void GapsTest() throws Exception {
        testQuestionService.updateFillInGaps("123456789","5");
    }

    @Test
    public void program() throws Exception {
        testQuestionService.updateProgram("123456789","5");
    }
}


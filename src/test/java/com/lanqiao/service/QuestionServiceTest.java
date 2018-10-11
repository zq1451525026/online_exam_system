package com.lanqiao.service;

import com.lanqiao.vo.Courses;
import com.lanqiao.vo.Smd_questions;
import com.lanqiao.vo.Tech_category;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/10/6.
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class QuestionServiceTest {
    @Resource
    IQuestionService questionService;

    @Test
    public void insertsQuestion() throws Exception {
        int b = questionService.insertSmd(new Smd_questions(99,"在Java语言中，不允许使用指针体现出的Java特性是（）","D",1,1,null,null));
        System.out.println(b);
    }



    @Test
    public void selectCourse() throws Exception {
        List<Courses> courses = questionService.selectCourses();
        System.out.println(courses);
        List<Tech_category> tech_categories = questionService.selectTech(1);
        System.out.println(tech_categories);
    }


}

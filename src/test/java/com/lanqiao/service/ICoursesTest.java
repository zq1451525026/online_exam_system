package com.lanqiao.service;

import com.lanqiao.vo.Courses;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by XWPC on 2018/10/6.
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ICoursesTest {

    @Resource
    private ICoursesService coursesService;

    @Test
    public void coursesServiceTest() throws Exception {
        List<Courses> courses = coursesService.selectCourses();
        for (Courses cours : courses) {
            System.out.println(cours);
        }
    }


}

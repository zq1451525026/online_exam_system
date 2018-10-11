package com.lanqiao.service;

import com.github.pagehelper.Page;
import com.lanqiao.vo.Courses;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by Nymph on 2018/10/4 15:39
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class CategoryTest {

    @Resource
    private ICoursesService categoryService;

    @Test
    public void testSelectAllCourses() throws Exception {
        Page<Courses> courses = (Page<Courses>)categoryService.selectAllCourses(null, 1, 10);
        for (Courses cours : courses) {
            System.out.println(cours);
        }
    }

    @Test
    public void testInsertCourse(){
        int i = categoryService.insertCourse(new Courses(1,"Gitee"));
        System.out.println(i);
    }

    @Test
    public void testUpdateCourse(){
        int i = categoryService.updateCourse(new Courses(31,"MY/SQL"));
        System.out.println(i);
    }

    @Test
    public void testSelectById(){
        Courses course = categoryService.selectById(31);
        System.out.println(course);
    }

    @Test
    public void testSelectByName(){
        Courses course = categoryService.selectByName("Java基础");
        System.out.println(course);
    }
}

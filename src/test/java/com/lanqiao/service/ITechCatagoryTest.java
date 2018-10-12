package com.lanqiao.service;

import com.lanqiao.vo.Tech_category;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by XWPC on 2018/10/7.
 */

@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ITechCatagoryTest {

   /* @Resource
    private ICoursesService coursesService;

    @Test
    public void coursesServiceTest() throws Exception {
        List<Courses> courses = coursesService.selectAllCourses();
        for (Courses cours : courses) {
            System.out.println(cours);
        }
    }*/

   @Resource
    private ITech_categoryService techCatagoryService;

   @Test
    public void techServiceTest() throws Exception {
       List<Tech_category> techCategories = techCatagoryService.selectCategoryById(1);
       for (Tech_category techCategory : techCategories) {
           System.out.println(techCategory);
       }
   }

}


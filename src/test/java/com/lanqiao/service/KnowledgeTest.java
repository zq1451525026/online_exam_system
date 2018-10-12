package com.lanqiao.service;

import com.github.pagehelper.Page;
import com.lanqiao.vo.Tech_category;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by Nymph on 2018/10/5 14:27
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class KnowledgeTest {
    @Resource
    private ITech_categoryService techCategoryService;

    @Test
    public void testSelectAllKnowledge(){
        Page<Tech_category> knowledge = (Page<Tech_category>) techCategoryService.selectAllKnowledge(null, 1, 10);
        for (Tech_category techCategory : knowledge) {
            System.out.println(techCategory);
        }
    }

    @Test
    public void testSelectKnowledge(){
        Page<Tech_category> techCategorys = (Page<Tech_category>) techCategoryService.selectKnowledge(null, 1, 10);
        for (Tech_category techCategory : techCategorys) {
            System.out.println(techCategory);
        }
        Page<Tech_category> techCategory1 = (Page<Tech_category>) techCategoryService.selectKnowledge(new Tech_category(1,"数据"), 1, 10);
        for (Tech_category tech_category : techCategory1) {
            System.out.println(tech_category);
        }

        Page<Tech_category> techCategory2 = (Page<Tech_category>) techCategoryService.selectKnowledge(new Tech_category(1,"数据",62), 1, 10);
        for (Tech_category tech_category : techCategory2) {
            System.out.println(tech_category);
        }
    }

    @Test
    public void testSelectById(){
        Tech_category techCategory = techCategoryService.selectById(44);
        System.out.println(techCategory);
    }

    @Test
    public void testUpdateKnowledge(){
        int techCategory = techCategoryService.updateKnowledge(new Tech_category(1,"数据类型",62));
        System.out.println(techCategory);
    }

}

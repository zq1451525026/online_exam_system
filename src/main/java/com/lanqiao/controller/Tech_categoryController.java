package com.lanqiao.controller;

import com.github.pagehelper.Page;
import com.lanqiao.service.ICoursesService;
import com.lanqiao.service.ITech_categoryService;
import com.lanqiao.vo.Courses;
import com.lanqiao.vo.Tech_category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nymph on 2018/10/5 13:45
 */
@Controller
@RequestMapping("/knowledge")
@SessionAttributes({"techCategory","course_name","tech_ctgr"})
public class Tech_categoryController {

    @Resource
    private ITech_categoryService techCategoryService;

    @Resource
    private ICoursesService categoryService;

    List<Courses> courses = categoryService != null ? categoryService.selectAllCourses(null, 1, 100) : null;

    /*查询所有*/
    @RequestMapping("/selectAllKnowledge")
    public String selectAll(Tech_category techCategory, Integer pageNum, ModelMap modelMap) {
        Page<Tech_category> page = null;
        if (pageNum == null) {
            pageNum = 1;
        }
        List<Courses> courses = categoryService.selectAllCourses(null, pageNum, 100);
        modelMap.addAttribute("coursesList", courses);
        page = (Page<Tech_category>) techCategoryService.selectAllKnowledge(techCategory,pageNum,10);
        modelMap.addAttribute("knowledgeList", page);
        return "category_manage/knowledge_point";
    }

    /*查询或保存，模糊查询*/
    @RequestMapping("/selectKnowledge")
    public String select(String course_name, @RequestParam String tech_ctgr, Integer pageNum, ModelMap modelMap) {
        Page<Tech_category> page = null;
        if (pageNum == null) {
            pageNum = 1;
        }
        List<Courses> courses = categoryService.selectAllCourses(null, pageNum, 100);
        modelMap.addAttribute("coursesList",courses);
        /*如果课程未选择*/
        if ("".equals(course_name)) {
            /*如果课程未选择，且只输入了知识点，进行所有课程的中知识点的模糊查询*/
            if (tech_ctgr != null) {
                Tech_category techCategory = new Tech_category(null,tech_ctgr,null);
                modelMap.addAttribute("selectCategory",techCategory);
                page = (Page<Tech_category>) techCategoryService.selectKnowledge(new Tech_category(null,tech_ctgr,null),pageNum,10);
                modelMap.addAttribute("selectKnowledgeList", page);
                return "category_manage/selectKnowledge";
            } else {
                /*若课程未选择，且知识点未输入，则进行全表查询*/
                return "redirect:/knowledge/selectAllKnowledge";
            }
        /*如果选择了课程，且知识点为空，则进行课程查询*/
        }else if ("".equals(tech_ctgr)){
                Courses courses3 = categoryService.selectByName(course_name);
                page = (Page<Tech_category>) techCategoryService.selectKnowledge(new Tech_category(null,null,courses3.getId()),pageNum,10);
                modelMap.addAttribute("selectKnowledgeList", page);
                return "category_manage/selectKnowledge";
            }else{
                Courses courses3 = categoryService.selectByName(course_name);
                Tech_category techCategory = techCategoryService.selectByTech_ctgr(tech_ctgr);
                if(techCategory == null){
                    techCategoryService.insertKnowledge(new Tech_category(1, tech_ctgr,courses3.getId()));
                    return "redirect:/knowledge/selectAllKnowledge";
                }else {
                    page = (Page<Tech_category>) techCategoryService.selectKnowledge(new Tech_category(null, tech_ctgr, courses3.getId()), pageNum, 10);
                    modelMap.addAttribute("selectKnowledgeList", page);
                    return "category_manage/selectKnowledge";
                }
        }
    }

    /*更新按钮*/
    @RequestMapping("/updateKnowledge/{knowledge_id}")
    public String updateKnowledge(@PathVariable Integer knowledge_id, ModelMap modelMap) {
        List<Courses> upCourse = categoryService.selectAllCourses(null, 1, 100);
        modelMap.addAttribute("upCourseList", upCourse);
        Tech_category tech_category = techCategoryService.selectById(knowledge_id);
        modelMap.addAttribute("upKnowledge",tech_category);
        return "category_manage/updateTechForm";
    }

    /*确定更新按钮*/
    @RequestMapping("/saveUpdateKnowledge")
    public String saveUpdateKnowledge(Integer knowledge_id, String tech_ctgr, Integer course_id) {
        int i = techCategoryService.updateKnowledge(new Tech_category(knowledge_id,tech_ctgr,course_id));
        return "redirect:/knowledge/selectAllKnowledge";
    }

    /*删除按钮*/
    @RequestMapping("/deleteKnowledge/{knowledge_id}")
    public String deleteKnowledge(@PathVariable Integer knowledge_id, ModelMap modelMap) {
        Tech_category techCategory = techCategoryService.selectById(knowledge_id);
        modelMap.addAttribute("deKnowledge",techCategory);
        return "category_manage/deleteTechForm";
    }

    /*确定删除按钮*/
    @RequestMapping("/doDeleteKnowledge")
    public String doDeleteKnowledge(@RequestParam Integer knowledge_id) {
        int i = techCategoryService.deleteKnowledge(knowledge_id);
        return (i == 1? "redirect:/knowledge/selectAllKnowledge":"category_manage/deleteTechForm");
    }
}

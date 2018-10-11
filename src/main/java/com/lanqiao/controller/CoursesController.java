package com.lanqiao.controller;

import com.github.pagehelper.Page;
import com.lanqiao.service.ICoursesService;
import com.lanqiao.vo.Courses;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;

/**
 * Created by Nymph on 2018/10/4 16:14
 */
@Controller
@RequestMapping("/category")
@SessionAttributes({"courses"})
public class CoursesController {

    @Resource
    private ICoursesService categoryService;

    @RequestMapping("/selectAllCourses")
    public String select(Courses courses, Integer pageNum, ModelMap modelMap) {
        Page<Courses> page = null;
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<Courses>) categoryService.selectAllCourses(courses,pageNum,10);
        modelMap.addAttribute("coursesList", page);
        return "category_manage/course_name";
    }

    @RequestMapping("/insertCourse")
    public String insertCourse(@RequestParam String course_name) {
        int i = categoryService.insertCourse(new Courses(1,course_name));
        return "redirect:/category/selectAllCourses";
    }

    @RequestMapping("/updateCourse/{course_id}")
    public String updateCourse(@PathVariable Integer course_id, ModelMap modelMap) {
        Courses courses = categoryService.selectById(course_id);
        modelMap.addAttribute("upCourse",courses);
        return "category_manage/updateForm";
    }

    @RequestMapping("/saveUpdateCourse")
    public String saveUpdateCourse(@RequestParam Integer course_id, @RequestParam String course_name) {
        int i = categoryService.updateCourse(new Courses(course_id,course_name));
        return "redirect:/category/selectAllCourses";
    }

    @RequestMapping("/deleteCourse/{course_id}")
    public String deleteCourse(@PathVariable Integer course_id, ModelMap modelMap) {
        Courses courses = categoryService.selectById(course_id);
        modelMap.addAttribute("deCourse",courses);
        return "category_manage/deleteForm";
    }

    @RequestMapping("/doDeleteCourse")
    public String doDeleteCourse(@RequestParam Integer course_id) {
        int i = categoryService.deleteCourse(course_id);
        return (i == 1? "redirect:/category/selectAllCourses":"category_manage/deleteForm");
    }
}

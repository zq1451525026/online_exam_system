package com.lanqiao.controller;

import com.lanqiao.service.ICoursesService;
import com.lanqiao.vo.Courses;
import com.lanqiao.vo.Tech_category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 *
 * @author XWPC
 * @date 2018/10/6
 */

@Controller
@RequestMapping("/courses")
@SessionAttributes("courses")
public class SelectCoursesController {

    @Resource
    ICoursesService coursesService;

    @RequestMapping("/selectAllCourses")
    public String selectAllCourses(ModelMap modelMap) {
        List<Courses> courses = coursesService.selectCourses();
        modelMap.addAttribute("coursesList", courses);
        return "query_item/radio_list";
    }

    @RequestMapping(value ={"/load_course"},method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<Courses> loadDistrict(){
        return coursesService.selectCourses();
    }

    @RequestMapping(value = {"/load_tech_by_id"},method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<Tech_category> selectAllCategory(@RequestParam("knowledgeId")Integer courseId){
        return coursesService.coursesContactCategory(courseId);
    }
}

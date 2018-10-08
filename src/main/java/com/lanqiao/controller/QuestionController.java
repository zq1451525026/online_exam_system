package com.lanqiao.controller;

import com.lanqiao.service.IQuestionService;
import com.lanqiao.vo.Courses;
import com.lanqiao.vo.Fsp_questions;
import com.lanqiao.vo.Smd_questions;
import com.lanqiao.vo.Tech_category;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/10/4.
 */
@Controller
@RequestMapping("/question")
@SessionAttributes({"question"})
public class QuestionController {
    static Logger logger = Logger.getLogger(QuestionController.class);

    @Autowired
    IQuestionService questionService;

    @RequestMapping(value ={"/load_course"},method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<Courses> loadDistrict(){
        return questionService.selectCourses();
    }

    @RequestMapping(value = {"/load_tech_by_id"},method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<Tech_category> loadStreetByTechId(@RequestParam("id") Integer id){
        return questionService.selectTech(id);
    }

    @RequestMapping(value="/insert_smd", method = RequestMethod.POST)
    public String insertSmd(Smd_questions smd_questions, HttpServletRequest request, ModelMap modelMap) throws Exception {
        int i =questionService.insertSmd(smd_questions);
        if ((i==1)) {
            return "redirect:/welcome.jsp";
        }else {
            return "redirect:"+request.getHeader("Referer");
        }

    }

    @RequestMapping(value="/insert2", method = RequestMethod.POST)
    public String insertSmd2(Smd_questions questions, HttpServletRequest request, ModelMap modelMap) throws Exception {
        int i =questionService.insertSmd2(questions);
        if ((i==1)) {
            return "redirect:/welcome.jsp";
        }else {
            return "redirect:"+request.getHeader("Referer");
        }

    }


    @RequestMapping(value="/insert_fsp",method = RequestMethod.POST)
    public String insertFsp(Fsp_questions fsp_questions, HttpServletRequest request, ModelMap modelMap) {
        int i = questionService.insertFsp(fsp_questions);

        String referer = request.getHeader("Referer");
        if ((i==1)) {
            return "redirect:/welcome.jsp";
        }else {

            return "redirect:"+referer;
        }

    }


}

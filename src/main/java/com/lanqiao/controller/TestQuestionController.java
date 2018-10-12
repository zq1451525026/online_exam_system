package com.lanqiao.controller;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.Page;
import com.lanqiao.service.ITestQuestionService;
import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Fsp_questions;
import com.lanqiao.vo.Smd_options;
import com.lanqiao.vo.Smd_questions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by ASUS on 2018/10/6.
 */

@Controller
@RequestMapping("/testquestion")
@SessionAttributes({"smd_questions"})
public class TestQuestionController {

    @Resource
    private ITestQuestionService testQuestionService;

    /*单选*/
    @RequestMapping("/select")
    public String select(Smd_questions smd_questions, Integer pageNum, ModelMap modelMap, HttpSession session) {
        Page<Smd_options> page=null;

        if (pageNum == null){
            pageNum = 1;
        }
         /* Smd_questions  smd=(Smd_questions)session.getAttribute("smd_questions");*/
          page= (Page<Smd_options>)testQuestionService.selectTestQuestion(smd_questions, pageNum, 5);

        modelMap.addAttribute("page",page.getResult());
        return "query_item/radio_list";
    }

    /*多选*/
    @RequestMapping("/multselect")
    public String mutlselect(Smd_questions smd_questions, Integer pageNum, ModelMap modelMap, HttpSession session) {
        Page<Smd_options> page=null;

        if (pageNum == null){
            pageNum = 1;
        }
         /* Smd_questions  smd=(Smd_questions)session.getAttribute("smd_questions");*/
        page= (Page<Smd_options>)testQuestionService.selectTestQuestion(smd_questions, pageNum, 5);

        modelMap.addAttribute("page",page.getResult());
        return "query_item/mul_list";
    }


    @RequestMapping("/contantquestion")
    public List<Smd_questions> contactquestion(Integer categoryId)
    {
        return  testQuestionService.contactquestion(categoryId);
    }

    /*编程题*/
    @RequestMapping("/searchFsp")
    public String selectFsp(Fsp_questions fsp_questions, Integer pageNum, ModelMap modelMap, HttpSession session){
        Page<Fsp_questions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }

        page = (Page<Fsp_questions>)testQuestionService.selectFspTestQuestion(fsp_questions, pageNum, 5);

        modelMap.addAttribute("page", page.getResult());

        return "query_item/pro_list"; // /views/list.jsp
    }


    /*简答题*/
    @RequestMapping("/searchFSP")
    public String selectFSP(Fsp_questions fsp_questions, Integer pageNum, ModelMap modelMap, HttpSession session){
        Page<Fsp_questions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }

        page = (Page<Fsp_questions>)testQuestionService.selectFspTestQuestion(fsp_questions, pageNum, 5);

        modelMap.addAttribute("page", page.getResult());

        return "query_item/simple_list"; // /views/list.jsp
    }

    /*判断题*/
    @RequestMapping("/selectTf")
    public String selectTf(Smd_questions smd_questions, Integer pageNum, ModelMap modelMap, HttpSession session) {
        Page<Smd_questions> page=null;

        if (pageNum == null){
            pageNum = 1;
        }
        Smd_questions smd=(Smd_questions)session.getAttribute("smd_questions");
        page= (Page<Smd_questions>)testQuestionService.selectTf(smd_questions, pageNum, 5);

        modelMap.addAttribute("page",page.getResult());
        return "query_item/tf_list";
    }



    /*单选，多选更新，*/
    @RequestMapping("/update/{question_id}")
    public String updateSmdOption(@PathVariable Integer question_id,ModelMap modelMap)
    {
        Smd_options smd_options = testQuestionService.selectOptionByQuestionId(question_id);
        modelMap.addAttribute("smdOptions",smd_options);
        modelMap.addAttribute("question_id",question_id);
        return  "query_item/updateForm";
    }

    @RequestMapping("/update")
    public String updateSmd(HttpServletRequest request)
    {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Smd_options smd_options = new Smd_options();
        Smd_questions smd_questions = new Smd_questions();
        for (String s : parameterMap.keySet()) {
            String[] values = parameterMap.get(s);
                if ("question_id".equals(s)){
                    Integer id = StringUtils.stringToInteger(values[0]);
                    smd_questions.setId(id);
                    smd_options.setQuestion_id(id);
                }else if ("question".equals(s)) {
                    smd_questions.setQuestion(values[0]);
                }else if ("option_A".equals(s)) {
                    smd_options.setOption_A(values[0]);
                }else if ("option_B".equals(s)) {
                    smd_options.setOption_B(values[0]);
                }else if ("option_C".equals(s)) {
                    smd_options.setOption_C(values[0]);
                }else if ("option_D".equals(s)) {
                    smd_options.setOption_D(values[0]);
                }else if ("option_E".equals(s)) {
                    smd_options.setOption_E(values[0]);
                }
            }
        testQuestionService.updateSmd_Option(smd_options);
        testQuestionService.updateSmd_Question(smd_questions);
        return "redirect:/testquestion/select";
    }

    /*单选，多选删除*/
    @RequestMapping("/update1/{question_id}")
    public String updatetf(@PathVariable Integer question_id,ModelMap modelMap)
    {
        Smd_options smd_options = testQuestionService.selectOptionByQuestionId(question_id);
        modelMap.addAttribute("smdOptions",smd_options);
        return  "query_item/updateForm_tf";
    }


    @RequestMapping("/update2/{fsp_id}")
    public String updatefsp(@PathVariable Integer fsp_id,ModelMap modelMap)
    {
        Smd_options smd_options = testQuestionService.selectOptionByQuestionId(fsp_id);
        modelMap.addAttribute("smdOptions",smd_options);
        return  "query_item/updateForm_fsp";
    }


    /*删除*/
    @RequestMapping("/delete/{question_id}")
    public String deleteSmdOption(@PathVariable Integer question_id,ModelMap modelMap)
    {
        Smd_options smd_options = testQuestionService.selectOptionByQuestionId(question_id);
        modelMap.addAttribute("question_id",question_id);
        return  "query_item/deleteForm";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam Integer question_id)
    {
        Smd_options smd_options = new Smd_options();
        smd_options.setQuestion_id(question_id);
        Smd_questions smd_questions = new Smd_questions();
        smd_questions.setId(question_id);
        testQuestionService.deleteSmd_Option(smd_options);
        testQuestionService.deleteSmd_Question(smd_questions);
        return  "redirect:/testquestion/select";
    }


    @RequestMapping("/selectAllExamination")
    public String selectAllExamination(ModelMap modelMap) {
        List<Examination> examinations = testQuestionService.selectAllExamination();
        modelMap.addAttribute("examinationList", examinations);
        return "query_item/radio_list";
    }

    @RequestMapping(value ={"/load_examination"},method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<Examination> loadDistrict(){
        return testQuestionService.selectAllExamination();
    }

    @RequestMapping(value ={"/insert"},method = {RequestMethod.GET,RequestMethod.POST})
    public String updatetExam(@RequestParam("selects") String[] examNo,@RequestParam("selecttest") String selecttest) {
        for (String s : examNo) {
            System.out.println(s);
            System.out.println(selecttest);
            testQuestionService.updatetExam(selecttest,s);
        }
        return "query_item/testquestion/select";
    }

}


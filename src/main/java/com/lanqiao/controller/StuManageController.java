package com.lanqiao.controller;

import com.github.pagehelper.Page;
import com.lanqiao.service.IStuManageService;
import com.lanqiao.vo.Olts_users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by 王良 on 2018/10/4 on ${Time}.
 */
@Controller
@RequestMapping("/stuManage")
@SessionAttributes({"olts_users"})
public class StuManageController {
    @Resource
    private IStuManageService stuManage;

    /**
     * 查询所有学生用户信息
     */
    @RequestMapping("/select")
    public String selectStudents(Olts_users condition, ModelMap modelMap, @RequestParam Integer pageNum, @RequestParam Integer clear, HttpSession session) {
        Page<Olts_users> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        if (clear == 1) {
            condition=new Olts_users();
        }
        page = (Page<Olts_users>) stuManage.selectAllUsers(condition, pageNum, 10);
        modelMap.addAttribute("students", page);
        session.setAttribute("pageNum", pageNum);
        return "forward:/views/user_manage/stu_operation.jsp?id=3";
    }

    @RequestMapping("/uploadFile")

    public String uploadStudents(@RequestParam("upload") CommonsMultipartFile file, Olts_users user) {
        try {
            String graduate = user.getGraduate_School();
            InputStream inputStream = file.getInputStream();
            List<Olts_users> students = stuManage.selectStu(inputStream,graduate);
            for (Olts_users student : students) {
                student.setPass_word("123");//设置初始密码
                stuManage.insertUser(student);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/stuManage/select?pageNum=1&clear=0";
    }

    @RequestMapping("/delete")
    public String deleteStudents(@RequestParam int[] line) {
        for (int i : line) {
            stuManage.deleteStuById(i);
        }
        return "redirect:/stuManage/select?pageNum=1&clear=0";
    }

    @RequestMapping("/update/{num}")
    public String update(@PathVariable Integer num, ModelMap modelMap) {
        Olts_users olts_users = stuManage.selectUserById(num);
        modelMap.addAttribute("stu",olts_users);
        return "forward:/views/user_manage/updateModel.jsp";
    }

    @RequestMapping("/update_student")
    public String updateStudent(Olts_users user, HttpSession session) {
        stuManage.updateStu(user);
        return "forward:/stuManage/select?pageNum=1&clear=1";
    }
    @RequestMapping("/update_OLTS_USERS")
    public String updateOLTS_USERS(Olts_users user, HttpSession sessions) {
        stuManage.updateStu(user);
        return "redirect:/stuManage/select?pageNum=1&clear=1";
    }



}

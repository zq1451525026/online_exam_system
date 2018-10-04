package com.lanqiao.controller;

import com.lanqiao.service.IUserService;
import com.lanqiao.vo.Olts_users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 王良 on 2018/9/26 on ${Time}.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @RequestMapping("/login")
    public String login(Olts_users user, HttpSession session) {
        Olts_users oltsusers = userService.selectByLogin(user);
        session.setAttribute("logUser", oltsusers);
        if (oltsusers == null) {
            return "redirect:/login.jsp";
        } else if (oltsusers.getUser_type() == null) {
            return "redirect:/exam.jsp";
        }else {
            return "redirect:/welcome.jsp";
        }
    }

    @RequestMapping("/reg")
    public String reg(Olts_users user, HttpSession session) {
        boolean b = userService.insertUser(user);
        if (b) {
            return "redirect:/login_form.jsp";
        }
        return "redirect:/reg.jsp";
    }
}

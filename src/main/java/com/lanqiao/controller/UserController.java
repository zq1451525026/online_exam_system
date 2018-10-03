package com.lanqiao.controller;

import com.lanqiao.service.IUserService;
import com.lanqiao.vo.UsersInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 王良 on 2018/9/26 on ${Time}.
 */
/*  只要返回的字符串带有前缀：forward: 或 redirect: 视图解析器失效（不解析）
    所以此时返回的字符必须是一个从WEB ROOT开始的一个完整路径
    return "forward:/views/test.jsp";                    //转发到页面
    return "forward:/user/login";                        //转发到控制器方法
    return "redirect:/views/test.jsp?paramName=james";   //重定向到页
    return "redirect:/user/login?paramName=james";       //重定向的控制器的方法
*/

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @RequestMapping("/login")
    public String login(UsersInfo user, HttpSession session) {
        UsersInfo usersInfo = userService.selectByLogin(user);
        if (usersInfo == null) {
            return "redirect:/login.jsp";
        }
        session.setAttribute("user",usersInfo);
        return "redirect:/welcome.jsp";
    }

    @RequestMapping("/reg")
    public String reg(UsersInfo user, HttpSession session) {
        boolean b = userService.insertUser(user);
        if (b) {
            return "redirect:/login_form.jsp";
        }
        return "redirect:/reg.jsp";
    }
}

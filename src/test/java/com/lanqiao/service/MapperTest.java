package com.lanqiao.service;

import com.lanqiao.vo.UsersInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by 王良 on 2018/9/27 on ${Time}.
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {

    @Resource
    private IUserService userService;
    @Test
    public void loginTest() throws Exception {
        UsersInfo usersInfo = userService.selectByLogin(new UsersInfo(null, "manager", "manager",null,null));
        System.out.println(usersInfo);
    }

    /** 添加新用户测试*/
    @Test
    public void insertUser() throws Exception {
        boolean b = userService.insertUser(new UsersInfo(null,"w12","11k1",null,null));
    }
}
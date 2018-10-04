package com.lanqiao.service;

import com.lanqiao.vo.Olts_users;
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
        Olts_users oltsusers = userService.selectByLogin(new Olts_users("烧脑分队", "brain"));
        System.out.println(oltsusers);
    }

    /** 添加新用户测试*/
    @Test
    public void insertUser() throws Exception {
        boolean b = userService.insertUser(new Olts_users("milk","milk"));
    }
}
package com.lanqiao.service;

import com.github.pagehelper.Page;
import com.lanqiao.vo.Olts_users;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;


/**
 * Created by 王良 on 2018/10/4 on ${Time}.
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class selectStuManageTest {
    @Resource
    private IStuManageService stuManage;

    @Test
    public void updateStuTest() throws Exception {
        Olts_users olts_users = new Olts_users();
        olts_users.setId("27");
        olts_users.setBirthday(new Date());
        olts_users.setQq("330612187");
        stuManage.updateStu(olts_users);
    }

    @Test
    public void selectUserTest() throws Exception {
        Olts_users olts_users = stuManage.selectUserById(27);
        System.out.println(olts_users);
    }

    @Test
    public void insertTest() throws Exception {
        Olts_users olts_users = new Olts_users(null, "999", "89f8989898f2382", "大鹏22", "dfdf", "15666666661", null, null, null, "2222222", null, null, null,null, "成都", "汽车服务", "研究生", "四川工商");
        stuManage.insertUser(olts_users);
    }

    @Test
    public void selectAllUsersTest() throws Exception {
        Olts_users users1 = new Olts_users();
        Page<Olts_users> page = (Page<Olts_users>) stuManage.selectAllUsers(users1, 1, 10);
        for (Olts_users users : page) {
            System.out.println(users);
        }

    }

    @Test
    public void deleteStuTest() throws Exception {
       stuManage.deleteStuById(104);
    }
}

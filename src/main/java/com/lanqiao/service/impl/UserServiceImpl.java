package com.lanqiao.service.impl;

import com.lanqiao.mapper.UserMapper;
import com.lanqiao.service.IUserService;
import com.lanqiao.vo.Olts_users;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 王良 on 2018/9/27 on ${Time}.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private UserMapper userMapper;
    @Override
    public Olts_users selectByLogin(Olts_users user) {
        return userMapper.selectByLogin(user);
    }

    @Override
    public boolean insertUser(Olts_users user) {
        return userMapper.insertUser(user);
    }
}

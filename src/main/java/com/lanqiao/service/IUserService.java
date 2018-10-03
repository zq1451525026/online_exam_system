package com.lanqiao.service;

import com.lanqiao.vo.UsersInfo;

/**
 * Created by 王良 on 2018/9/27 on ${Time}.
 */
public interface IUserService {
    /**
     * 查询用户
     * @return 返回用户
     */
    public UsersInfo selectByLogin(UsersInfo user);

    /**加用户*/
    public boolean insertUser(UsersInfo user);
}
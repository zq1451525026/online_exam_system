package com.lanqiao.service;

import com.lanqiao.vo.Olts_users;

/**
 * Created by 王良 on 2018/9/27 on ${Time}.
 */
public interface IUserService {
    /**
     * 查询用户
     * @return 返回用户
     */
    public Olts_users selectByLogin(Olts_users user);

    /**加用户*/
    public boolean insertUser(Olts_users user);
}
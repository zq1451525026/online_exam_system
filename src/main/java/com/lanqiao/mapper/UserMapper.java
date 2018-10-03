package com.lanqiao.mapper;

import com.lanqiao.vo.UsersInfo;
import org.springframework.stereotype.Repository;

/**
 * Created by 王良 on 2018/9/27 on ${Time}.
 */
@Repository
public interface UserMapper {

    /**查用户*/
    public UsersInfo selectByLogin(UsersInfo user);

    /**加用户*/
    public boolean insertUser(UsersInfo user);

}
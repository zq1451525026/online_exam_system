package com.lanqiao.mapper;

import com.lanqiao.vo.Olts_users;
import org.springframework.stereotype.Repository;

/**
 * Created by Nymph on ${Time} 20:15
 */
@Repository
public interface UserMapper {

    /**查用户*/
    public Olts_users selectByLogin(Olts_users user);

    /**加用户*/
    public boolean insertUser(Olts_users user);

}
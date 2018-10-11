package com.lanqiao.mapper;

import com.lanqiao.vo.Olts_users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 王良 on 2018/10/6 on ${Time}.
 */
@Repository
public interface StuManageMapper {
    public void updateStu(Olts_users users);
    public Olts_users selectUserById(Integer num);
    public void insertUser(Olts_users users);
    public void deleteStuById(Integer num);


    public List<Olts_users> selectAllUser(@Param("users") Olts_users users,
                                          @Param("pageNum") int pageNum,
                                          @Param("pageSize") int pageSize);
}

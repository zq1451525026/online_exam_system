package com.lanqiao.service;

import com.lanqiao.vo.Olts_users;

import java.io.InputStream;
import java.util.List;

/**
 * Created by 王良 on 2018/10/4 on ${Time}.
 */
public interface IStuManageService {

    /**导入学生信息表（查询所有学生信息）*/
    public List<Olts_users> selectStu(InputStream inputStream, String edu);

    /**
     * @param users 学生列表
     * @param line 利用数组下标批量删除学生
     */
    public void deleteStu(List<Olts_users> users, int[] line);

    /**
     * 更新当前登录账户
     * @param user 更新部分
     */
    public void updateStu(Olts_users user);

    /**
     * @param num 查询对象的用户名
     * @return 对象用户的具体信息
     */
    public Olts_users selectUserById(Integer num);

    public void insertUser(Olts_users users);

    /**
     * 在数据库中查询所有学生
     * @return 列表
     */
    public List<Olts_users> selectAllUsers(Olts_users users, int pageNum, int pageSize);

    /**
     * 通过id删除学员
     * @param num 学员 id
     */
    public void deleteStuById(Integer num);
}

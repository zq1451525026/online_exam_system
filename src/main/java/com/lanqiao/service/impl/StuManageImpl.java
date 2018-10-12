package com.lanqiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.lanqiao.mapper.StuManageMapper;
import com.lanqiao.service.IStuManageService;
import com.lanqiao.vo.Olts_users;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 王良 on 2018/10/4 on ${Time}.
 */
@Service("stuManageService")
public class StuManageImpl implements IStuManageService {

    @Resource
    private StuManageMapper stuManageMapper;

    /**
     * @param inputStream 文件输入流
     * @param graduate 毕业院校
     * @return 学生列表
     */
    @Override
    public List<Olts_users> selectStu(InputStream inputStream, String graduate) {
        List<Olts_users> students = new ArrayList<>();
        InputStream is = inputStream;

        try {
            // 创建工作本
            Workbook wb = new HSSFWorkbook(is);
            //得到第一个工作表
            Sheet sheet = wb.getSheetAt(0);
            //得到工作表中的行数
            int numberOfRows = sheet.getPhysicalNumberOfRows();
            System.out.println("总行数：" + numberOfRows);
            for (int rowIdx = 1; rowIdx < numberOfRows; rowIdx++) {
                //得到每一行
                Row row = sheet.getRow(rowIdx);
                //得到每一个单元格
                Cell cell = null;
                cell = row.getCell(0);

                int _stuNo = (int)cell.getNumericCellValue();
                if (_stuNo == 0) {
                    break;
                }
                String stuNo = _stuNo + "";//int 转 String

                cell = row.getCell(1);
                if (cell==null) {
                    break;
                }
                String stuName = cell.getStringCellValue();

                cell = row.getCell(2);
                String idCard = cell.getStringCellValue();

                cell = row.getCell(3);
                String education = cell.getStringCellValue();

                cell = row.getCell(4);
                String major = cell.getStringCellValue();

                cell = row.getCell(5);
                String mobile =  cell.getStringCellValue();

                cell = row.getCell(6);
                int _qq = (int)cell.getNumericCellValue();
                String qq = _qq + "";

                cell = row.getCell(7);
                String city = cell.getStringCellValue();
                Olts_users user = new Olts_users(stuNo, stuName, idCard, education, major, mobile, qq, city);
                user.setGraduate_School(graduate);
                students.add(user);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return students;
    }

    /**
     * 删除学生
     * @param users 学生列表
     * @param line  利用数组下标批量删除学生
     */
    @Override
    public void deleteStu(List<Olts_users> users, int[] line) {
        int time = 0;//计数器，用于统计循环次数
        boolean b = true;
        for (int i : line) {
            if (b) {
                users.remove(i);
                time++;
                b = false;
            } else {
                i=i-time;
                time++;
                users.remove(i);
            }
        }
    }

    /**
     * 更新当前账户的学生/教师信息
     * @param user 更新部分栏目
     */
    @Override
    public void updateStu(Olts_users user) {
        stuManageMapper.updateStu(user);
    }

    /**
     * @param num 查询对象的id
     * @return 对象用户的具体信息
     */
    @Override
    public Olts_users selectUserById(Integer num) {
        Olts_users olts_users = stuManageMapper.selectUserById(num);
        return olts_users;
    }

    @Override
    public void insertUser(Olts_users users) {
        stuManageMapper.insertUser(users);
    }

    /**
     * 数据库中查询所有的人员信息
     * @return 学生列表
     * users, 查询条件
     */
    @Override
    public List<Olts_users> selectAllUsers(Olts_users users, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return stuManageMapper.selectAllUser(users,pageNum,pageSize);
    }

    @Override
    public void deleteStuById(Integer num) {
        stuManageMapper.deleteStuById(num);
    }
}

package com.lanqiao.service;

import com.lanqiao.vo.*;

import java.util.List;

/**
 * Created by Administrator on 2018/10/4.
 */
public interface IQuestionService {

    int insertSmd(Smd_questions smd_questions);

    int insertSmd2(Smd_questions questions);

    int inserto(Smd_questions smd_questions);

    List<Courses> selectCourses();

    List<Tech_category> selectTech(Integer id);

    int insertFsp(Fsp_questions fsp_questions);
}

package com.lanqiao.mapper;

import com.lanqiao.vo.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/10/4.
 */
@Repository
public interface QuestionMapper {

    int insertSmd(Smd_questions smd_questions);

    int insertSmd2(Smd_questions questions);

    List<Courses> selectCourses();

    List<Tech_category> selectTech(Integer id);

    int insertFsp(Fsp_questions fsp_questions);

    int inserto(Smd_questions smd_questions);


}

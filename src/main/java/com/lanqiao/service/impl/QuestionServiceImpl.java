package com.lanqiao.service.impl;

import com.lanqiao.mapper.QuestionMapper;
import com.lanqiao.service.IQuestionService;
import com.lanqiao.vo.*;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/10/4.
 */
@Service("QuestionService")
public class QuestionServiceImpl implements IQuestionService {
    static Logger logger = Logger.getLogger(QuestionServiceImpl.class);
    @Resource
    private QuestionMapper questionMapper;

    @Override
    public int insertSmd(Smd_questions smd_questions) {
        questionMapper.insertSmd(smd_questions);


        return this.questionMapper.inserto(smd_questions);
    }

    @Override
    public int insertSmd2(Smd_questions questions) {
       return questionMapper.insertSmd2(questions);
    }


    @Override
    public int inserto(Smd_questions smd_questions) {
        return questionMapper.inserto(smd_questions);
    }


    @Override
    public List<Courses> selectCourses() {
        return questionMapper.selectCourses();
    }

    @Override
    public List<Tech_category> selectTech(Integer id) {
        return questionMapper.selectTech(id);
    }

    @Override
    public int insertFsp(Fsp_questions fsp_questions) {
        return questionMapper.insertFsp(fsp_questions);
    }


}

package com.lanqiao.mapper;

import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Fsp_questions;
import com.lanqiao.vo.Smd_options;
import com.lanqiao.vo.Smd_questions;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ASUS on 2018/10/7.
 */
@Repository
public interface TestQuestionMapper {

    List<Smd_options> selectTestQuestion(@Param("smd_questions") Smd_questions smd_questions,
                                         @Param("pageNum") int pageNum,
                                         @Param("pageSize") int pageSize);


    Smd_options selectOptionByQuestionId(Integer questionId/*@Param("type") int type,@Param("num") int num*/);

    int updateSmd_Option(Smd_options smd_options);

    int updateSmd_Question(Smd_questions smd_questions);

    int deleteSmd_Question(Smd_questions smd_questions);

    int deleteSmd_Option(Smd_options smd_options);

    /*编程，简答题*/
    List<Fsp_questions> selectFspTestQuestion(@Param("fsp_questions") Fsp_questions fsp_questions,
                                              @Param("pageNum") Integer pageNum,
                                              @Param("pageSize2") int pageSize2);


    /*判断*/
    List<Smd_questions> selectTf(@Param("smd_questions") Smd_questions smd_questions,
                                 @Param("pageNum") Integer pageNum,
                                 @Param("i") int i);

    int updateSmd_Question1(Smd_questions smd_questions);

    int updateSmd_Question2(Smd_questions smd_questions);

    List<Examination> selectAllExamination();

    void updatetExam(@Param("examno") String examno,
                     @Param("examid") String examid);


    /**
     * 新增判断
     * @param examno
     * @param examid
     */
    void updateTrueFalse(@Param("examno") String examno,
                         @Param("examid") String examid);

    /**
     * 新增多选题
     * @param examno
     * @param examid
     */
    void updateMultiple(@Param("examno") String examno,
                        @Param("examid") String examid);

    /**
     * 新增简答题
     * @param examno
     * @param examid
     */
    void updateSimpleAnswer(@Param("examno") String examno,
                            @Param("examid") String examid);

    /**
     * 新增填空题
     * @param examno
     * @param examid
     */
    void updateFillInGaps(@Param("examno") String examno,
                          @Param("examid") String examid);

    /**
     * 新增编程题
     * @param examno
     * @param examid
     */
    void updateProgram(@Param("examno") String examno,
                       @Param("examid") String examid);
}





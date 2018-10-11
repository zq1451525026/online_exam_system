package com.lanqiao.mapper;

import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Olts_score;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 王良 on 2018/10/10 on ${Time}.
 */
@Repository
public interface ScoreManageMapper {
    public List<Olts_score> totalScore(String exam_no);

    public List<Examination> selectExamNo();
}

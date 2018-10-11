package com.lanqiao.service;

import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Olts_score;

import java.util.List;

/**
 * Created by 王良 on 2018/10/10 on ${Time}.
 */
public interface IScoreService {
    public List<Olts_score> totalScore(String exam_no);

    public List<Examination> selectExamNo();
}

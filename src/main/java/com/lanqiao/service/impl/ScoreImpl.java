package com.lanqiao.service.impl;

import com.lanqiao.mapper.ScoreManageMapper;
import com.lanqiao.service.IScoreService;
import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Olts_score;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 王良 on 2018/10/10 on ${Time}.
 */
@Service("scoreService")
public class ScoreImpl implements IScoreService {
    @Resource
    private ScoreManageMapper scoreManageMapper;

    @Override
    public List<Olts_score> totalScore(String exam_no) {
        return scoreManageMapper.totalScore(exam_no);
    }

    @Override
    public List<Examination> selectExamNo() {
        return scoreManageMapper.selectExamNo();
    }
}

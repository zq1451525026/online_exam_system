package com.lanqiao.service;

import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Olts_score;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 王良 on 2018/10/10 on ${Time}.
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ScoreTest {
    @Resource
    private IScoreService scoreService;

    @Test
    public void selectTotalScoreTest() throws Exception {
        List<Olts_score> ddd = scoreService.totalScore("GS2018100403");
        for (Olts_score olts_score : ddd) {
            System.out.print(olts_score.getAllScore());
            System.out.println(olts_score.getLvl());
        }
    }

    @Test
    public void selectExamination() throws Exception {
        List<Examination> examinations = scoreService.selectExamNo();
        for (Examination examination : examinations) {
            System.out.println(examination.getExam_no());
        }
    }
}
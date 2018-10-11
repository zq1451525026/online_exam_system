package com.lanqiao.controller;

import com.lanqiao.service.IScoreService;
import com.lanqiao.vo.Examination;
import com.lanqiao.vo.Olts_score;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 王良 on 2018/10/10 on ${Time}.
 */
@Controller
@RequestMapping("/score")
public class ScoreManageController {
    @Resource
    private IScoreService scoreService;

    @RequestMapping("/totalScore")
    @ResponseBody
    public List<Olts_score> getScoreData(@RequestParam("examNo") String exam_no) {
        return scoreService.totalScore(exam_no);
    }

    @RequestMapping("/totalExamNumber")
    @ResponseBody
    public List<Examination> getExaminationNum() {
        return scoreService.selectExamNo();
    }
}

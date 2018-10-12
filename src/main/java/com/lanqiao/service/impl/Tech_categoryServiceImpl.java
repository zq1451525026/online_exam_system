package com.lanqiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.lanqiao.mapper.Tech_categoryMapper;
import com.lanqiao.service.ITech_categoryService;
import com.lanqiao.vo.Tech_category;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nymph on 2018/10/5 14:13
 */
@Service("knowledgeService")
public class Tech_categoryServiceImpl implements ITech_categoryService {

    @Resource
    Tech_categoryMapper tech_CategoryMapper;

    @Override
    public List<Tech_category> selectAllKnowledge(Tech_category techCategory, int pageNum, int pageSize) {
            PageHelper.startPage(pageNum, pageSize);
        return tech_CategoryMapper.selectAllKnowledge(techCategory, pageNum, pageSize);
    }

    @Override
    public int insertKnowledge(Tech_category techCategory) {
        return tech_CategoryMapper.insertKnowledge(techCategory);
    }

    @Override
    public int updateKnowledge(Tech_category techCategory) {
        return tech_CategoryMapper.updateKnowledge(techCategory);
    }

    @Override
    public Tech_category selectById(Integer id) {
        return tech_CategoryMapper.selectById(id);
    }

    @Override
    public int deleteKnowledge(Integer id) {
        return tech_CategoryMapper.deleteKnowledge(id);
    }

    @Override
    public List<Tech_category> selectKnowledge(Tech_category techCategory, int pageNum, int pageSize) {
        return tech_CategoryMapper.selectKnowledge(techCategory,pageNum,pageSize);
    }

    @Override
    public Tech_category selectByTech_ctgr(String tech_ctgr) {
        return tech_CategoryMapper.selectByTech_ctgr(tech_ctgr);
    }

    @Override
    public List<Tech_category> selectAllCategory(Integer courseId) {
        return tech_CategoryMapper.selectAllCategory(courseId);
    }

    @Override
    public List<Tech_category> selectCategoryById(Integer courseId) {
        return tech_CategoryMapper.selectCategoryById(courseId);
    }
}

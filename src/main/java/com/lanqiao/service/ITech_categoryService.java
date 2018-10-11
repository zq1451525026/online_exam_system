package com.lanqiao.service;

import com.lanqiao.vo.Tech_category;

import java.util.List;

/**
 * Created by Nymph on 2018/10/5 14:12
 */
public interface ITech_categoryService {

    public List<Tech_category> selectAllKnowledge(Tech_category techCategory, int pageNum, int pageSize);

    public int insertKnowledge(Tech_category techCategory);

    public int updateKnowledge(Tech_category techCategory);

    public Tech_category selectById(Integer id);

    public int deleteKnowledge(Integer id);

    List<Tech_category> selectKnowledge(Tech_category techCategory, int pageNum, int pageSize);

    Tech_category selectByTech_ctgr(String tech_ctgr);
}

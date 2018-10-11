package com.lanqiao.mapper;

import com.lanqiao.vo.Tech_category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nymph on 2018/10/5 13:33
 */
@Repository
public interface Tech_categoryMapper {

    public List<Tech_category> selectAllKnowledge(@Param("techCategory") Tech_category techCategory,
                                                  @Param("pageNum") int pageNum,
                                                  @Param("pageSize") int pageSize);

    public List<Tech_category> selectKnowledge(@Param("techCategory") Tech_category techCategory,
                                               @Param("pageNum") int pageNum,
                                               @Param("pageSize") int pageSize);

    public int insertKnowledge(Tech_category techCategory);

    public int updateKnowledge(Tech_category techCategory);

    public Tech_category selectById(Integer id);

    public int deleteKnowledge(Integer id);

    Tech_category selectByTech_ctgr(String tech_ctgr);
}

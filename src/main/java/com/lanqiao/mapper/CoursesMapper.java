package com.lanqiao.mapper;

import com.lanqiao.vo.Courses;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nymph on 2018/10/4 15:22
 */
@Repository
public interface CoursesMapper {

    public List<Courses> selectAllCourses(@Param("courses") Courses courses,
                                          @Param("pageNum") int pageNum,
                                          @Param("pageSize") int pageSize);

    public int insertCourse(Courses courses);

    public int updateCourse(Courses courses);

    public Courses selectById(Integer id);

    public int deleteCourse(Integer id);

    Courses selectByName(String course_name);
}

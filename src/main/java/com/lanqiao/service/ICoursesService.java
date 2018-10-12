package com.lanqiao.service;

import com.lanqiao.vo.Courses;
import com.lanqiao.vo.Tech_category;

import java.util.List;

/**
 * Created by Nymph on 2018/10/4 15:18
 */

public interface ICoursesService {

    /**
     * 查询所有课程
     * @return
     */
    public List<Courses> selectAllCourses(Courses courses, int pageNum, int pageSize);

    public int insertCourse(Courses courses);

    public int updateCourse(Courses courses);

    public Courses selectById(Integer id);

    public Courses selectByName(String course_name);

    public int deleteCourse(Integer id);

    public List<Courses> selectCourses();

    public List<Tech_category> coursesContactCategory(Integer knowledgeId);

}

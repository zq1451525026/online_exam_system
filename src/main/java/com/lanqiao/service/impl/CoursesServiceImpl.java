package com.lanqiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.lanqiao.mapper.CoursesMapper;
import com.lanqiao.service.ICoursesService;
import com.lanqiao.vo.Courses;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nymph on 2018/10/4 15:21
 */
@Service("categoryService")
public class CoursesServiceImpl implements ICoursesService {

    @Resource
    private CoursesMapper coursesMapper;

    @Override
    public List<Courses> selectAllCourses(Courses courses, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return coursesMapper.selectAllCourses(courses, pageNum, pageSize);
    }

    @Override
    public int insertCourse(Courses courses) {
        return coursesMapper.insertCourse(courses);
    }

    @Override
    public int updateCourse(Courses courses) {
        return coursesMapper.updateCourse(courses);
    }

    @Override
    public Courses selectById(Integer id) {
        return coursesMapper.selectById(id);
    }

    @Override
    public Courses selectByName(String course_name) {
        return coursesMapper.selectByName(course_name);
    }

    @Override
    public int deleteCourse(Integer id) {
        return coursesMapper.deleteCourse(id);
    }
}

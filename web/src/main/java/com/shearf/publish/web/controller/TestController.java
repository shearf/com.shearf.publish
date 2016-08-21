package com.shearf.publish.web.controller;

import com.shearf.publish.common.base.Response;
import com.shearf.publish.dao.mapper.ProjectMapper;
import com.shearf.publish.entity.ProjectDo;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by xiahaihu2009@gmail on 16/8/16.
 */

@Controller
@RequestMapping("test")
public class TestController {

    @Resource
    private ProjectMapper projectMapper;

    @RequestMapping("")
    public String test() {
        return "test";
    }

    @ResponseBody
    @RequestMapping("db")
    public String testDb() {
        ProjectDo projectDo = new ProjectDo();
        projectDo.setCreateTime(new Date());
        projectDo.setUpdateTime(new Date());
        projectDo.setType('A');
        projectDo.setStatus('V');
        projectDo.setName("test");
        projectDo.setDescription("test project");
        projectDo.setRepo("test");
        projectDo.setRepoUrl("test");

        int projectId = projectMapper.insert(projectDo);

        System.out.println(projectId);

        return "New projectId : " + projectId;
    }

    @ResponseBody
    @RequestMapping("json")
    public Response responseSuccess() {
        return Response.success();
    }

}

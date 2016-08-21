package com.shearf.publish.dao.mapper;

import com.shearf.publish.entity.ProjectDo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by xiahaihu2009@gmail on 16/8/21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application-context.xml")
public class ProjectMapperTest {

    @Resource
    private ProjectMapper projectMapper;

    @Test
    public void insert() {

        ProjectDo projectDo = new ProjectDo();
        projectDo.setCreateTime(new Date());
        projectDo.setUpdateTime(new Date());
        projectDo.setType('A');
        projectDo.setStatus('V');
        projectDo.setName("test");
        projectDo.setDescription("test project");
        projectDo.setRepo("test");
        projectDo.setRepoUrl("test");

        projectMapper.insert(projectDo);
    }
}

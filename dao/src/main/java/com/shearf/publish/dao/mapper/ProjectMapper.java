package com.shearf.publish.dao.mapper;

import com.shearf.publish.entity.ProjectDo;
import org.springframework.stereotype.Repository;

/**
 * Created by xiahaihu2009@gmail on 16/8/21.
 */
@Repository
public interface ProjectMapper {

    int insert(ProjectDo projectDo);
}

package com.shearf.publish.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by xiahaihu2009@gmail on 16/8/20.
 */
@Data
public class ProjectDo extends BaseDo {

    private String name;

    private Character type;

    private String description;

    private String repo;

    private String repoUrl;

    private Character status;

    private Date createTime;

    private Date updateTime;
}

package com.shearf.publish.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by xiahaihu2009@gmail on 16/8/21.
 */

@Controller
@RequestMapping("")
public class AuthController {

    @RequestMapping("login")
    public String login() {
        return "login";
    }
}

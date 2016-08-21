package com.shearf.publish.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;


/**
 * Created by xiahaihu2009@gmail on 16/8/22.
 */
@Controller
@RequestMapping("upload")
public class UploadController {

    @RequestMapping("")
    public String upload() {
        return "upload";
    }


    @RequestMapping(value = "do", method = RequestMethod.POST)
    public String doUpload(@RequestParam("file") MultipartFile file) throws IOException {

        /*
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext()
        );

        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

            Iterator iterator = multipartHttpServletRequest.getFileNames();
            while (iterator.hasNext()) {
                MultipartFile file = multipartHttpServletRequest.getFile(iterator.next().toString());
                if (null != file) {
                    String path = "/Users/xiahaihu/tmp/files/" + file.getOriginalFilename();
                    file.transferTo(new File(path));
                }
            }

        }
        */

        if (! file.isEmpty()) {
            String path = "/Users/xiahaihu/tmp/files/" + file.getOriginalFilename();
            file.transferTo(new File(path));
        }
        return "Done!";
    }


}

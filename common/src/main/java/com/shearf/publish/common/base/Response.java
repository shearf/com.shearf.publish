package com.shearf.publish.common.base;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by xiahaihu2009@gmail on 16/8/22.
 */
public class Response<T> implements Serializable {

    private static final long serialVersionUID = -1085733499385929766L;

    @Setter
    @Getter
    private int code;

    @Setter
    @Getter
    private String message;

    @Setter
    @Getter
    private T data;

    public Response(BaseError baseError) {
        this(baseError.getCode(), baseError.getMessage());
    }

    public Response(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public static <T> Response<T> success() {
        return new Response<T>(GlobalError.SUCCESS);
    }

    public static <T> Response<T> fail() {
        return new Response<T>(GlobalError.FAIL);
    }
}

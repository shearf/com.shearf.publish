package com.shearf.publish.common.base;

import lombok.Getter;

/**
 * Created by xiahaihu2009@gmail on 16/8/22.
 */
public enum GlobalError implements BaseError {

    SUCCESS(200, "操作成功"),
    FAIL(-1, "操作失败");

    @Getter
    private int code;

    @Getter
    private String message;

    GlobalError(int code, String message) {
        this.code = code;
        this.message = message;
    }
}

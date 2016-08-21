var AdminLte = {

    statusCode : {
        "success" : 200,
        //"timeout" : 401,
        "error" : 500,
        "missToken": 401,
        "validateError": 422
    },

    debug: true,

    getToken : function(callback) {
        $.get("/token", function(json) {
            if (json.code == AdminLte.statusCode.success) {
                callback(json.data.name, json.data.value);
            }
        });
    },

    timeout: 10,

    timeoutCallback: function() {
        alert("Response timeout");
    },

    formToken : function(form) {
        var $form = $(form);
        if ($form.find('input[name="_token"]').length == 0) {
            $form.append('<input type="hidden" name="_token">');
        }

        var tokenField = $form.find('>input[name="_token"]');

        AdminLte.getToken(function(tokenName, tokenValue) {
            tokenField.val(tokenValue);
        });
    },

    debugLog: function(str) {
        if (AdminLte.debug) {
            console.log(str);
        }
    },

    ajaxFormResultDisplay: function(id, json) {

        var showValidateErrors = function(container, errors) {
            container.find('ul').remove();
            var html = '<ul>';
            $.each(errors, function(key, msgList) {
                html += '<li>'+ msgList.join(',') +'</li>';
            });
            html += '</ul>';
            contentContainer.append(html);
            
        };
        var alert = $('#' + id);

        var alertClass = '';
        var iconClass = '';
        if (json.code == AdminLte.statusCode.success) {
            alertClass = 'alert-success';
            iconClass = 'fa-check';
        } else {
            alertClass = 'alert-danger';
            iconClass = 'fa-ban';
        }
        if (alert.length > 0) {
            var contentContainer = alert.find(">p");

            alert.removeClass('alert-danger alert-success').addClass(alertClass).show();
            alert.find('i').removeClass('fa-warning fa-check').addClass(iconClass);

            if (json.code == AdminLte.statusCode.validateError) {
                showValidateErrors(contentContainer, json.data);

            } else {
                contentContainer.text(json.message);
            }

        } else {
            AdminLte.debugLog('ajaxFormResultDisplay: cannot find alert id');
        }

    }


};
/*
 * 删除元素通用处理
 */
$('.btnDelete').each(function() {

    var $this = $(this);
    var title = $this.attr('title');
    var modelId = 'modal' + ($this.attr('id') ? $this.attr('id') : Math.random(10000, 1000000));
    var success = $this.data('success');
    var fail = $this.data('fail');

    var html = '';
    html += '<div class="modal fade" tabindex="-1" role="dialog" id="'+ modelId +'" aria-labelledby="'+ modelId +'Label">'
        + '<div class="modal-dialog modal-sm" role="document">'
        + ' <div class="modal-content">'
        + '     <div class="modal-header">'
        + '         <button type="button" class="close" data-dismiss="modal" aria-label="Close">'
        + '             <span aria-hidden="true">×</span>'
        + '         </button>'
        + '         <h4 class="modal-title">'+ title +'</h4>'
        + '     </div>'
        + '     <div class="modal-body" style="display: none;">'
        + '         <div class="alert alert-danger alert-dismissible">'
        + '             <h4><i class="icon fa fa-ban"></i>操作失败!</h4>'
        + '         </div>'
        + '     </div>'
        + '     <div class="modal-footer">'
        + '         <button type="button" class="btn btn-default pull-left" data-dismiss="modal">取消</button>'
        + '         <button type="button" class="btn btn-primary btnConfirm">确认</button>'
        + '     </div>'
        + ' </div>'
        + '</div><!-- /.modal-dialog -->'
        + '</div>';

    $('section.content').append(html);
    var $modal = $('#' + modelId);


    $modal.on('click', '.btnConfirm', function () {

        var href = $this.attr('href');
        var token = {};
        $.ajax({
            url : '/token',
            method: 'GET',
            dataType : 'json',
            success : function(json) {
                if (json.code = 200) {
                    token.name = json.data.name;
                    token.value = json.data.value;
                }

                $.ajax({
                    url : href,
                    // method: 'POST',
                    method: 'DELETE',
                    data: {
                        _token: token.value
                    },
                    success : function(json) {
                        if (json.code == 200) {
                            $modal.modal('hide');
                            if (success != undefined) {
                                window[success](json);
                            }
                        } else {
                            $modal.find('.modal-body').show();
                            if (fail != undefined) {
                                window[fail](json);
                            }
                        }
                    },
                    error: function() {
                        $modal.find('.modal-body').show();
                    }
                });
            }
        });
    });

    $modal.on(
        'hidden.bs.modal', function (e) {
            $modal.find('.modal-body').hide();
        }
    );

    $this.click(function() {
        $modal.modal('show');
        return false;
    });

});


$("form.ajaxForm").each(function() {
    var $this = $(this);

    var form = this;
    var success = $this.data('success');
    var error = $this.data('error');
    var before = $this.data('before');
    // var submitButton = Ladda.create($this.find(":submit").get(0));
    // $this.parent().append('<div class="overlay"> <i class="fa fa-refresh fa-spin"></i></div>');

    var options = {
        dataType : "json",
        contentType : "application/json",
        success : function(json) {
            if (json.code == AdminLte.statusCode.success) {

                if (success != "" && success != undefined) {

                    if ($.isFunction(window[success])) {
                        window[success](json);
                    } else {
                        AdminLte.debugLog('undefined function: ' + success);
                    }
                }

            } else if (json.code == AdminLte.statusCode.missToken) {
                alert("token验证失败,请刷新重试");
            } else {
                if (error != "" && error != undefined) {
                    if ($.isFunction(window[error])) {
                        window[error](json);
                    } else {
                        AdminLte.debugLog("undefined function: " + error);
                    }
                }
            }
            $this.parent().find(".overlay").remove();

            // submitButton.stop();
        },
        error : function(json) {
            if (error != "" && error != undefined) {

                if ($.isFunction(window[error])) {

                    window[error](json);
                } else {
                    AdminLte.debugLog("undefined function: " + error);
                }
            }
            
            // submitButton.stop();
            $this.parent().find(".overlay").remove();
        }
    };

    var method = form.method.toUpperCase();
    if (method != "GET") {
        var formMethod = $this.find(':hidden[name="_method"]').val();
        if (formMethod != undefined) {
            method = formMethod;
        }
    }

    options.type = method;

    //AdminLte.formToken(form); //由form表单首次载入获得

    AdminLte.debugLog("ajaxForm loaded");

    $this.submit(function() {
        // submitButton.start();
        var continuePost = true;
        if (before != undefined && before) {
            if ($.isFunction(window[before])) {
                continuePost = window[before]();
            } else {
                AdminLte.debugLog("undefined function: " + before);
            }
        }

        if (continuePost) {

            $this.parent().append('<div class="overlay"> <i class="fa fa-refresh fa-spin"></i></div>');

            if (method != 'GET') {
                // options.data = $this.serialize();
                options.data = JSON.stringify($this.serializeObject());
                console.info(options.data);
            }

            options.url = $this.attr("action");
            $.ajax(options);
        }

        return false;
    });

    /*
    $this.on('click', ':reset', function() {
        $this.find("button.close").alert('close');
    });
    */
});



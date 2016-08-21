<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Project Publish Admin | Log In</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/static/bower_components/AdminLTE/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/bower_components/components-font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/static/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/bower_components/AdminLTE/dist/css/AdminLTE.min.css">

    <!-- iCheck -->
    <link rel="stylesheet" href="/static/bower_components/AdminLTE/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/bower_components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="/static/bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="/"><b>Publish</b> Admin</a>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Enter username & password</p>
        <p class="login-box-msg text-red" id="loginNotice" style="display: none;"></p>
        <form action="${rc.contextPath}/auth" method="post" class="ajaxForm" data-success="loginSuccess" data-error="loginFail">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="username" placeholder="username">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="password" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                </div><!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登陆</button>
                </div><!-- /.col -->
            </div>
            <#--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">-->
            <input type="hidden" name="_method" value="POST">
        </form>

    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->

<!-- jQuery 2.1.4 -->
<script src="/static/bower_components/AdminLTE/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="/static/bower_components/jquery-serialize-object/dist/jquery.serialize-object.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="/static/bower_components/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/bower_components/AdminLTE/plugins/iCheck/icheck.min.js"></script>
<script src="/static/js/ui.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    function loginSuccess(json) {
        window.location.href = json.data.url;
    }

    function loginFail(json) {
        $("#loginNotice").text(json.message).show();
    }
</script>
</body>
</html>

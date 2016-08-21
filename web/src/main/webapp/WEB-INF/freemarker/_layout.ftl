
<#macro head_css files=[]>
    <#list files as file>
    <link rel="stylesheet" href="${file}">
    </#list>
</#macro>

<#macro head_js files=[]>
    <#list files as file>
    <script type="text/javascript" src="${file}"></script>
    </#list>
</#macro>

<#macro head_style>
    <#nested>
</#macro>

<#macro head_script>
    <#nested>
</#macro>


<#macro extra_plugins plugins=[]>
    <#list plugins as plugin>
    <script type="text/javascript" src="${plugin}"></script>
    </#list>
</#macro>


<#macro body_script>
    <#nested>
</#macro>

<#macro extra_section>
    <#nested>
</#macro>




<#macro layout>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Publish</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${rc.contextPath}/static/bower_components/AdminLTE/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/bower_components/components-font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/static/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/bower_components/AdminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="/static/bower_components/AdminLTE/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="/static/plugins/ladda/ladda-themeless.min.css">

    <link rel="stylesheet" href="/static/css/ui.css">

    <@head_css></@head_css>
    <#--@yield('head_css')-->

    <@head_style></@head_style>
    <#--@yield('head_style')-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/bower_components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="/static/bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->

    <@head_js></@head_js>
    <#--@yield('head_js')-->

    <@head_script></@head_script>
    <#--@yield('head_script')-->

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">


    <#include "blocks/main-header.ftl">
    <#--@include('blocks.main-header')-->
    <!-- Main Header -->
    <!-- Left side column. contains the logo and sidebar -->
    <#--@include('blocks.main-aside')    -->
    <#include "blocks/main-aside.ftl">


        <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <#--<section class="content-header">-->
        <#--@yield('content-head')-->
        <#--</section>-->

        <!-- Main content -->
        <section class="content">

            <#nested>
            <!-- Your Page Content Here -->
            <#--@yield('content')-->
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->

    <!-- Main Footer -->
    <#include "blocks/main-footer.ftl">
    <#--@include('blocks.main-footer')-->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">

        <#include "blocks/control-sidebar.ftl">
        <#--@include('blocks.control-sidebar')-->

    </aside><!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div><!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.1.4 -->
<script src="/static/bower_components/AdminLTE/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<#--<script src="/static/bower_components/jquery-serialize-object/dist/jquery.serialize-object.min.js"></script>-->
<!-- Bootstrap 3.3.5 -->
<script src="/static/bower_components/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/bower_components/AdminLTE/dist/js/app.min.js"></script>


<!-- watchhhh admin script -->

<@extra_plugins></@extra_plugins>
<#--@yield('extra_plugins') <!-- 页面上单独需要加载一些js插件 &ndash;&gt;-->

<@body_script></@body_script>
<#--@yield('body_script')   <!-- 页面上单独写的处理脚本 &ndash;&gt;-->

<@extra_section></@extra_section>
<#--@yield('extra_section') <!-- 扩展一些html或js代码段 &ndash;&gt;-->


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
<script src="/static/js/ui.js"></script>
</body>
</html>
</#macro>
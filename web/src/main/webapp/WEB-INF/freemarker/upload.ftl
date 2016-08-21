<#import "_layout.ftl" as layout>

<@layout.layout>

<div class="box box-primary">


    <div class="box-header with-border">
        <h3 class="box-title">测试文件上传</h3>
    </div>
    <form role="form" action="/upload/do" method="post" enctype="multipart/form-data"
          class="form-horizontal" data-success="createPublishSuccess" data-error="createPublishError">
        <input type="hidden" name="_method" value="POST" />
        <input type="hidden" name="_token" value="" />
        <div class="box-body">
            <input type="file" name="file" />
        </div>
        <div class="box-footer">
            <button type="reset" class="btn btn-default">取消</button>
            <button type="submit" class="btn btn-primary pull-right">确定</button>
        </div>
    </form>
</div>


</@layout.layout>

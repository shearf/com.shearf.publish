<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->

        <div class="user-panel">
            <div class="pull-left image">
                <#--<img width="45" height="45" src="" class="img-circle" alt="User Image">-->
                <div style="width: 45px; height: 45px;"></div>
            </div>
            <div class="pull-left info">
                <p>Shearf</p>
                <!-- Status -->
            </div>
        </div>

        <!-- search form (Optional) -->
        <!--
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
        </form>
        -->
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">HEADER</li>
            <li class="treeview">
                <#--<a href=""><span>{{ trans('global.auth') }}</span> <i class="fa fa-angle-left pull-right"></i></a>-->
                <#--<ul class="treeview-menu">-->
                    <#--<li><a href="{{ route('admin.user.index') }}">{{ trans('user.manage_user') }}</a></li>-->
                    <#--<li><a href="{{ route('admin.role.index') }}">{{ trans('role.manage') }}</a></li>-->
                    <#--<li><a href="{{ route('admin.permission.index') }}">{{ trans('permission.manage') }}</a></li>-->
                <#--</ul>-->
            </li>
            <#--<li><a href="{{ route('admin.project.index') }}">{{ trans('project.manage') }}</a> </li>-->
            <#--<li><a href="{{ route('publish.index') }}">{{ trans('publish.list') }}</a> </li>-->

            <#--<li class="treeview">-->
                <#--<a href=""><span>{{ trans('archive.manage') }}</span> <i class="fa fa-angle-left pull-right"></i></a>-->
                <#--<ul class="treeview-menu">-->
                    <#--@foreach($myProjects as $project)-->
                    <#--<li>-->
                        <#--<a href="{{ route('project.archive.index', $project->id) }}">{{ $project->name }}</a>-->
                    <#--</li>-->
                    <#--@endforeach-->
                <#--</ul>-->
            <#--</li>-->

        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
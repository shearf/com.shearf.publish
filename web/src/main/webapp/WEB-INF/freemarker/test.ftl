<#import "_layout_test.ftl" as layout>
<#assign files=["a.js", "b.js"]>
<#--<@layout.head_js jsFiles=files></@layout.head_js>-->
<@layout.layout >
    Body
</@layout.layout>

<@layout.foot>
    Foot
</@layout.foot>


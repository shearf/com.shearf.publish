
<#macro head_js jsFiles=[]>
    <#list jsFiles as file>
        <script type="text/javascript" src="${file}"></script>
    </#list>
</#macro>

<#macro foot>
    <#nested >
</#macro>
<#macro layout>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        Test Title
    </title>
    <@head_js/>
</head>
<body>
    <#nested>
<@foot></@foot>
</body>
</html>
</#macro>

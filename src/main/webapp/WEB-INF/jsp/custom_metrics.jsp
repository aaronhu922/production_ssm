<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
 
<div>
<table  id="customMetricsList" title="欠瓶统计报表" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'custom/duebottles',method:'get',pageSize:10,fitColumns:true,
		toolbar:toolbar_duebottles">
    <thead>
        <tr>
            <th data-options="field:'customName',align:'center',width:100">客户名称</th>
        	<th data-options="field:'productId',align:'center',width:100">欠瓶类别</th>
            <th data-options="field:'quantity',align:'center',width:100">数量</th>
           
        </tr>
    </thead>
</table>
</div>  
<!-- 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->

<div  id="toolbar_duebottles" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
		
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="customMetricsList_reload()">刷新</a>  
	</div>  
</div>  


<script>
	
function customMetricsList_reload(){
	$("#customMetricsList").datagrid("reload");
}
</script>

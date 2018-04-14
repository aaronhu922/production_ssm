<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
 
<div title="DataGrid" style="padding:5px">
<table  id="metricsList" title="月度统计报表" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'order/monthmetrics',method:'get',pageSize:20,fitColumns:true,
		toolbar:toolbar_OrderCheck">
    <thead>
        <tr>
        	<th data-options="field:'sumOfMoney',align:'center',width:100">订单总额</th>
            <th data-options="field:'monthName',align:'center',width:100">月份</th>
            <th data-options="field:'year',align:'center',width:100">年份</th>
        </tr>
    </thead>
</table>
</div>  
<!-- 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->

<div  id="toolbar_OrderCheck" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
		
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="fMeasureCheck_reload()">刷新</a>  
	</div>  
	   <div id="search_fMeasureCheck" style="float: right;">	
	        <input id="search_text_fMeasureCheck" class="easyui-searchbox"  
            data-options="searcher:doSearch_fMeasureCheck,prompt:'请输入...',menu:'#menu_fMeasureCheck'"  
            style="width:250px;vertical-align: middle;">
        </input>
        <div id="menu_fMeasureCheck" style="width:120px"> 
			<div data-options="name:'year'">年份</div> 			
		</div>     
    </div> 
</div>  
    <p></p>
    <p></p>
    <p></p>

<div>
<table  id="yearMetricsList" title="年度报表，每年订单总额" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'order/yearmetrics',method:'get',pageSize:10,fitColumns:true">
    <thead>
        <tr>
        	<th data-options="field:'sumOfMoney',align:'center',width:100">订单总额</th>
            <th data-options="field:'year',align:'center',width:100">年份</th>
        </tr>
    </thead>
</table>
</div>  

<script>
function doSearch_fMeasureCheck(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		$("#metricsList").datagrid({
	        title:'统计报表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_OrderCheck", url:'order/monthmetrics', method:'get', loadMsg:'数据加载中......',
			fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'sumOfMoney', width : 100, title : '订单总额', align:'center'},
				{field : 'monthName', width : 100, align : 'center', title : '月份'},
				{field : 'year', width : 100, align : 'center', title : '年份'}
	        ] ],  
	    });
	}else{
		$("#metricsList").datagrid({  
	        title:'统计报表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_OrderCheck", url:'order/monthmetrics?year='+value, loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'sumOfMoney', width : 100, title : '订单总额', align:'center'},
				{field : 'monthName', width : 100, align : 'center', title : '月份'},
				{field : 'year', width : 100, align : 'center', title : '年份'}
	        ] ],  
	    });
	}
}

	
function fMeasureCheck_reload(){
	$("#metricsList").datagrid("reload");
}
</script>

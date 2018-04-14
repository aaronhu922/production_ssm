<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
 <div>
 			<tr>
				<td width="100">客户名称:</td>
				<td><input id="custom" class="easyui-combobox" name="customId"
					panelHeight="auto"
					data-options="required:true,valueField:'customId',textField:'customName',url:'custom/get_data',
    					editable:false" />
				</td>
			</tr>
			 <tr>
	            <td>年份:</td>
	            <td>
		            <select class="easyui-combobox" id="year" name="year" panelHeight="auto" 
		            	data-options="width:150, editable:false">
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>	
						<option value="2017">2017</option>												
					</select>
				</td>
	        </tr>
 </div>
 
 	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="doSearch_CustomMetric()">查询</a>
	</div>
 
 
<div title="DataGrid" style="padding:5px">
<table  id="cusordmetricsList" title="月度统计报表" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'',method:'get',pageSize:20,fitColumns:true">
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

<div  id="toolbar_CustomMetric" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
		
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="fMeasureCheck_reload()">刷新</a>  
	</div>  
    
</div>  
    <p></p>
    <p></p>
    <p></p>

<div>
<table  id="CustomYearMetricsList" title="年度报表，客户年订单总额" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'',method:'get',pageSize:10,fitColumns:true">
    <thead>
        <tr>
        	<th data-options="field:'sumOfMoney',align:'center',width:100">订单总额</th>
            <th data-options="field:'year',align:'center',width:100">年份</th>
        </tr>
    </thead>
</table>
</div>  

<script>
function doSearch_CustomMetric(){ //用户输入用户名,点击搜素,触发此函数  
	var year= $("#year").combobox('getValue');
	var custom=$("#custom").combobox('getValue');

		$("#cusordmetricsList").datagrid({  
	        title:'统计报表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_CustomMetric", url:'order/custom_monthmetrics?year='+year+'&custom='+custom, loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'sumOfMoney', width : 100, title : '订单总额', align:'center'},
				{field : 'monthName', width : 100, align : 'center', title : '月份'},
				{field : 'year', width : 100, align : 'center', title : '年份'}
	        ] ],  
	    });
		
		$("#CustomYearMetricsList").datagrid({  
	        title:'年度统计报表', singleSelect:false, collapsible:true, pagination:true, rownumbers:false, method:'get',
			nowrap:true, url:'order/custom_yearmetrics?custom='+custom, loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'sumOfMoney', width : 100, title : '订单总额', align:'center'},
				{field : 'year', width : 100, align : 'center', title : '年份'}
	        ] ],  
	    });
}

	
function fMeasureCheck_reload(){
	$("#cusordmetricsList").datagrid("reload");
}
</script>

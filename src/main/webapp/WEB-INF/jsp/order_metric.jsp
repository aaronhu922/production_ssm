<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

 <div>
	<form id="customMetricForm" class="customMetricForm" method="post">
	 
		<table>
			<tr>
				<td width="100">客户:</td>
				<td><input id="customId" class="easyui-combobox" name="customId"
					panelHeight="350"
					data-options="valueField:'customId',textField:'customName',url:'custom/get_data',
    					editable:true" 
    				style="width: 150px"/>
				</td>
			</tr>			
			<tr>
				<td width="100">开始日期:</td>
				<td><input class="easyui-datetimebox" name="startDate"
					data-options="required:false,showSeconds:true"
					value="date.format('yyyy-MM-dd hh:mm:ss')" style="width: 150px">
				</td>
			</tr>
		
			<tr>
				<td width="100">结束日期:</td>
				<td><input id="requestDatePanel" class="easyui-datetimebox" name="endDate"
					data-options="required:false,showSeconds:true"
					value="date.format('yyyy-MM-dd hh:mm:ss')" style="width: 150px">
				</td>
			</tr>			
		</table>
	</form>
	<div style="padding: 5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitCustomMetricForm()">查询</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearCustomMetricForm()">重置</a>
	</div>
</div>
 
 
<div title="DataGrid" style="padding:5px">
<table  id="metricsList" title="月度统计报表" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:false,rownumbers:true,url:'order/monthmetrics',method:'post',pageSize:20,fitColumns:true">
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
function submitCustomMetricForm(){
	if(!$('#customMetricForm').form('validate')){
		$.messager.alert('提示','表单还未填写完成!');
		return ;
	}
	
	$.post("order/monthmetrics",$("#customMetricForm").serialize(), function(data){
        $('#metricsList').datagrid('loadData',data); 
	});
}

function clearCustomMetricForm() {
	$('#customMetricForm').form('reset');
}	

</script>

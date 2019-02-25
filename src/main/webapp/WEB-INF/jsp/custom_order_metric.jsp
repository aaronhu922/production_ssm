<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
 <div>
	<form id="orderMetricForm" class="orderMetricForm" method="post">
	 
		<table>
			<tr>
				<td width="100">客户:</td>
				<td><input id="customId" class="easyui-combobox" name="customId"
					panelHeight="350"
					data-options="required:true,valueField:'customId',textField:'customName',url:'custom/get_data',
    					editable:true" />
				</td>
			</tr>			
			<tr>
				<td width="100">开始日期:</td>
				<td><input class="easyui-datetimebox" name="startDate"
					data-options="required:true,showSeconds:true"
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
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitOrderMetricForm()">查询</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearOrderMetricForm()">重置</a>
	</div>
</div>
 
 
<div title="DataGrid" style="padding:5px">
<table  id="cusordmetricsList" title="客户销售统计报表" class="easyui-datagrid" data-options="singleSelect:false,collapsible:true,
		pagination:false,rownumbers:true,url:'',method:'get',fitColumns:true">
    <thead>
        <tr>
        	<th data-options="field:'productId',align:'center',width:100">产品名称</th>
            <th data-options="field:'quantity',align:'center',width:100">数量</th>
        </tr>
    </thead>
</table>
</div>  
<!-- 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->

<script>
function submitOrderMetricForm(){
	if(!$('#orderMetricForm').form('validate')){
		$.messager.alert('提示','表单还未填写完成!');
		return ;
	}
	
	$.post("order/custom_order_metrics",$("#orderMetricForm").serialize(), function(data){
        $('#cusordmetricsList').datagrid('loadData',data); 
	});
}

function clearOrderMetricForm() {
	$('#orderMetricForm').form('reset');
}
	
</script>

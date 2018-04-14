<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="orderEditForm" class="orderForm" method="post">
		<input type="hidden" name="orderId"/>
		<input type="hidden" name="totalMoney"/>		
	    <table cellpadding="5">
	         <tr>
	            <td>订购客户:</td>
	            <td>
	            	<input id="custom" class="easyui-combobox" name="customId"  panelHeight="auto"
						   data-options="required:true,valueField:'customId',textField:'customName',
						   url:'custom/get_data', editable:false" />
	            </td>
	        </tr>
	       
	        <tr>
				<td width="100">订单状态:</td>
				<td><select id="cc" class="easyui-combobox" name="status"
					panelHeight="auto"
					data-options="required:true, width:150, editable:false">
						<option value="1">入厂管理</option>
						<option value="2">订单核对完成</option>
						<option value="3">出厂(订单完结)</option>
						<option value="4">订单取消</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">支付状态:</td>
				<td><select id="cc" class="easyui-combobox" name="paymentType"
					panelHeight="auto"
					data-options="required:true, width:150, editable:false">
						<option value="0">未付款</option>
						<option value="1">已付现款</option>
						<option value="2">预付款</option>
						<option value="3">欠款</option>
				</select></td>
			</tr>
	        <tr>
	            <td>订购日期:</td>
	            <td><input class="easyui-datetimebox" name="orderDate"     
        			data-options="required:true,showSeconds:true" style="width:150px"> </td>
	        </tr>
	        
	        <tr>
				<td width="100">是否配送:</td>
				<td>
				  <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="enabledelivery()">是</a>
                  <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="disabledelivery()">否</a>
		          <input type="hidden" id="deliverysb" name="delivery"/>
				</td>
			</tr>
	        
	        <tr>
	            <td>要求日期:</td>
      			
        		<td><input id="requestDatePanel" class="easyui-datetimebox" name="requestDate"
					data-options="required:false,showSeconds:true" style="width: 150px">
				</td>
	        </tr>
	        <tr>
	            <td>商品描述:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:visible;" name="note"></textarea>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitOrderEditForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	
	var orderEditEditor ;
	$(function(){
		//实例化富文本编辑器
		orderEditEditor = TAOTAO.createEditor("#orderEditForm [name=note]");
	});
	//同步kindeditor中的内容
	orderEditEditor.sync();
	
	function submitOrderEditForm(){
		if(!$('#orderEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		orderEditEditor.sync();
		
		$.post("order/update_all",$("#orderEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改订单成功!','info',function(){
					$("#orderEditWindow").window('close');
					$("#orderList").datagrid("reload");
				});
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function enabledelivery(){
		$('#requestDatePanel').datetimebox('enable');	
		$('#deliverysb').val("true");
	}

	function disabledelivery(){
		$('#requestDatePanel').datetimebox('disable');
		$('#deliverysb').val("false");
	}
</script>

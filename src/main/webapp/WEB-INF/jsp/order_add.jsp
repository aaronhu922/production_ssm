<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	
<body>	
	<div style="margin:10px 0">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()">添加要购买的产品</a>
	</div>

	<div>
	<form id="orderAddForm" class="orderForm" method="post">
	 
	    <table id="tt"></table>
	    <!--<p class="total">总价: ￥0</p>-->
	 
		<table>
			<tr>
				<td width="100">订购客户:</td>
				<td><input id="custom" class="easyui-combobox" name="customId"
					panelHeight="auto"
					data-options="required:true,valueField:'customId',textField:'customName',url:'custom/get_data',
    					editable:false" />
				</td>
			</tr>
			<tr>
				<td width="100">订单总额(￥):</td>
				<td><input class="easyui-numberbox" type="text" id="totalMoney"
					name="totalMoney" data-options="min:0,max:99999999,precision:2,required:true" />
				</td>
			</tr>
			<tr>
				<td width="100">订单状态:</td>
				<td><select id="cc" class="easyui-combobox" name="status"
					panelHeight="auto"
					data-options="required:true, width:150, editable:false">
						<option value="1">欠款经销商订单</option>
						<option value="2">付现款经销商订单</option>
						<option value="3">预付款经销商订单</option>
						<option value="4">未开始</option>
						<option value="5">订单取消</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">订购日期:</td>
				<td><input class="easyui-datetimebox" name="orderDate"
					data-options="required:true,showSeconds:true"
					value="date.format('yyyy-MM-dd hh:mm:ss')" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="100">要求日期:</td>
				<td><input class="easyui-datetimebox" name="requestDate"
					data-options="required:true,showSeconds:true"
					value="date.format('yyyy-MM-dd hh:mm:ss')" style="width: 150px">
				</td>
			</tr>
			<!-- <tr>
				<td>合同扫描件:</td>
				<td><a href="javascript:void(0)"
					class="easyui-linkbutton picFileUpload">上传图片</a> <input
					type="hidden" id="image" name="image" /></td>
			</tr>
			<tr>
				<td>附件:</td>
				<td>-->
					<!-- <iframe src="file_upload.jsp"></iframe>  -->
					<!--<div id="orderAddFileUploader">上传文件</div> <input type="hidden"
					id="orderAddFile" name="file" />
				</td>
			</tr>-->
			<tr>
				<td width="100">订单要求:</td>
				<td><textarea
						style="width: 560px; height: 300px; visibility: true;"
						name="note"></textarea></td>
			</tr>
		</table>
		<input type="hidden" name="orderParams" />
		<input type="hidden" id="orderListStr" name="orderList" />

	</form>
	<div style="padding: 5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitOrderAddForm()">提交</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearOrderADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">

$(function(){
	$('#tt').datagrid({
		title:'购物清单',
		iconCls:'icon-edit',
		width:660,
		height:250,
		singleSelect:true,
		//idField:'itemid',
		//url:'data/datagrid_data.json',				
		columns:[[
			//{field:'itemid',title:'Item ID',width:60},
			{field:'productId',title:'产品',width:100,
				formatter:function(value,row){
					return row.productName || value;
				},
				editor:{
					type:'combobox',
					options:{
						valueField:'productName',
						textField:'productName',
						url:'product/get_data',
						required:true,
						editable:false
					}
				}
			},
			{field:'unit',title:'单价',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}},
			{field:'quantity',title:'数量',width:80,align:'right',editor:{type:'numberbox',options:{precision:0}}},

			{field:'unitPrice',title:'金额',width:80,align:'right',editor:'numberbox'},

			{field:'action',title:'操作',width:80,align:'center',
				formatter:function(value,row,index){
					if (row.editing){
						var s = '<a href="javascript:void(0)" onclick="saverow(this)">保存</a> ';
						var c = '<a href="javascript:void(0)" onclick="cancelrow(this)">取消</a>';
						return s+c;
					} else {
						var e = '<a href="javascript:void(0)" onclick="editrow(this)">修改</a> ';
						var d = '<a href="javascript:void(0)" onclick="deleterow(this)">删除</a>';
						return e+d;
					}
				}
			}
		]],
		onEndEdit:function(index,row){
			var ed = $(this).datagrid('getEditor', {
				index: index,
				field: 'productId'
			});
			row.productname = $(ed.target).combobox('getText');
		},
		onBeforeEdit:function(index,row){
			row.editing = true;
			$(this).datagrid('refreshRow', index);
		},
		onAfterEdit:function(index,row){
			row.editing = false;
			$(this).datagrid('refreshRow', index);
		},
		onCancelEdit:function(index,row){
			row.editing = false;
			$(this).datagrid('refreshRow', index);
		},

onBeginEdit:function(rowIndex){
var editors = $('#tt').datagrid('getEditors', rowIndex);
var n1 = $(editors[1].target);
var n2 = $(editors[2].target);
var n3 = $(editors[3].target);
n1.add(n2).numberbox({
    onChange:function(){
        var cost = n1.numberbox('getValue')*n2.numberbox('getValue');
        n3.numberbox('setValue',cost);
    }
})
}
	});
});
function getRowIndex(target){
	var tr = $(target).closest('tr.datagrid-row');
	return parseInt(tr.attr('datagrid-row-index'));
}
function editrow(target){
	$('#tt').datagrid('beginEdit', getRowIndex(target));
}
function deleterow(target){
	$.messager.confirm('Confirm','Are you sure?',function(r){
		if (r){
			$('#tt').datagrid('deleteRow', getRowIndex(target));
		}
	});
}
function saverow(target){
	debugger;
	var rowIndex = getRowIndex(target);
	$('#tt').datagrid('endEdit', getRowIndex(target));
	compute();

}
function cancelrow(target){
	$('#tt').datagrid('cancelEdit', getRowIndex(target));
}
function insert(){
	var row = $('#tt').datagrid('getSelected');
	if (row){
		var index = $('#tt').datagrid('getRowIndex', row);
	} else {
		index = 0;
	}
	$('#tt').datagrid('insertRow', {
		index: index,
		row:{
			status:'P'
		}
	});
	$('#tt').datagrid('selectRow',index);
	$('#tt').datagrid('beginEdit',index);
}

	function compute() {//计算函数
		debugger;
		var rows = $('#tt').datagrid('getRows')//获取当前的数据行
		var ptotal = 0//计算listprice的总和
		, utotal = 0;//统计unitcost的总和
		var list = []; 
		for (var i = 0; i < rows.length; i++) {
			ptotal += parseFloat(rows[i]['quantity']);
			utotal += parseFloat(rows[i]['unitPrice']);
			
	        list.push(rows[i]['productId']);
			list.push(rows[i]['unit']);
			list.push(rows[i]['quantity']);
			list.push(rows[i]['unitPrice']);
		}
		//orderList = list;
		$('#totalMoney').numberbox('setValue', utotal);//赋值
		var sb = list.join(",");
		$('#orderListStr').val(sb);
		//alert(orderList);
		//新增一行显示统计信息
		//alert('总件数:'+ptotal+"\n总价:"+utotal);
		// $('#tt').datagrid('appendRow', { itemid: '<b>统计：</b>', amount: ptotal.toFixed(1), unitcost: utotal });
		//$('#tt').datagrid("footer":[{amount: ptotal.toFixed(1), unitcost: utotal });
		//$('.total').html('总价: ￥' + utotal);
		//$('.totalMoney').val('utotal');

		//setInputValue($('#orderAddForm'), 'totalMoney', utotal);
		


	}

	function setInputValue(frm, Name, Value) {
		var txt = frm.find("input[name=\"" + Name + "\"]");
		txt.val(Value);
		//txt[0].value = vallue;
	}

	//

	//提交表单
	function submitOrderAddForm() {
		//有效性验证
		if (!$('#orderAddForm').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		//同步文本框中的订单要求
		//orderAddEditor.sync();

		//ajax的post方式提交表单
		//$("#orderAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("order/insert", $("#orderAddForm").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '新增订单成功!');
				clearOrderADDForm();
				$("#orderAddWindow").window('close');
				//	$(".picFileUpload").siblings("div.pics").find("ul > li")
				//		.remove();
				//$(".ajax-file-upload-container > .ajax-file-upload-statusbar")
				//		.remove();
				$("#orderList").datagrid("reload");
			} else {
				$.messager.alert('提示', data.msg);
			}
		});
	}

	function clearOrderADDForm() {
		$('#orderAddForm').form('reset');
		//orderAddEditor.html('');
	}
</script>
</body>


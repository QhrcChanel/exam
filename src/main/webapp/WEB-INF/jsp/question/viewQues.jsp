<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Tables</title>
<meta name="description" content="Static &amp; Dynamic Tables" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" href="./assets/css/bootstrap.css" />
<link rel="stylesheet" href="./assets/css/font-awesome.css" />
<link rel="stylesheet" href="./assets/css/ace-fonts.css" />
<link rel="stylesheet" href="./assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<script src="./assets/js/ace-extra.js"></script>
<script type="text/javascript" src="./js/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){ 
	var data = {};
	data["pageSize"] = 10;
	data["pageNum"] = 1;
	query(data);
	
	queryQuesType();
	queryQuesCate();
});

function queryQuesType(){
	$.ajax({
		type : "post",
		url : "queryQuesType",
		dataType : "json",
		success : function(result) {
			if(result.length === 0){
				alert("查询为空");
			}else{
				buildQuesType(result);
			}
			
		},
		error : function() {
			alert("网络错误！");
		}
	});
}

function buildQuesType(data){
	$("select[name='quesType']").append("<option value='0'>--请选择--</option>");
	for(i = 0; i < data.length; i++){
		$("select[name='quesType']").append("<option value="+ data[i].quesTypeId +">"+ data[i].quesTypeName +"</option>");
	}
}

function queryQuesCate(){
	$.ajax({
		type : "post",
		url : "queryQuesCate",
		dataType : "json",
		success : function(result) {
			if(result.length === 0){
				alert("查询为空");
			}else{
				buildQuesCate(result);
			}
			
		},
		error : function() {
			alert("网络错误！");
		}
	});
}

function buildQuesCate(data){
	$("select[name='quesCate']").append("<option value='0'>--请选择--</option>");
	for(i = 0; i < data.length; i++){
		$("select[name='quesCate']").append("<option value="+ data[i].quesCateId +">"+ data[i].quesCateName +"</option>");
	}
}

function doQuery(){
	var data = {};
	data["pageSize"] =  $("#pageSize").val();
	data["pageNum"] =  $("#pageNum").val();
	data["quesTitle"] =  $("#quesTitle").val();
	data["quesTypeId"] =  $("select[name='quesType'] option:selected").val();
	data["quesCateId"] =  $("select[name='quesCate'] option:selected").val();
	query(data);	
}

function query(data){
	$.ajax({
		type : "post",
		url : "queryQues",
		data : data,
		dataType : "json",
		success : function(result) {
			if(result.length === 0){
				alert("查询为空");
			}else{
				buildTable(result);
			}
			
		},
		error : function() {
			alert("网络错误！");
		}
	});
};

function buildTable(data){
	var html = "";
	html += "<thead>";
	html += "<tr>";
	html += "<th class='center'>";
	html += "<label class='position-relative'>";
	html += "<input type='checkbox' class='ace' /> <span class='lbl'></span>";
	html += "</label></th>";
	html += "<th>试题ID</th>";
	html += "<th>试题描述</th>";
	html += "<th>正确答案</th>";
	html += "<th>类型</th>";
	html += "<th>题型</th>";
	html += "<th>操作</th>";
	html += "</tr>";
	html += "</thead>";
	html += "<tbody>";
	for(i = 0; i < data.length; i++){
		html += "<tr>";
		html += "<td class='center'><label class='position-relative'>";
		html += "<input type='checkbox' class='ace' /> <span class='lbl'></span>";
		html += "</label></td>";
		html += "<td>" + data[i].quesId + "</td>";
		html += "<td>" + data[i].quesTitle + "</td>";
		html += "<td>" + data[i].quesRightAnswer + "</td>";
		html += "<td>" + data[i].quesTypeName + "</td>";
		html += "<td>" + data[i].quesCateName + "</td>";
		html += "<td><div class='hidden-sm hidden-xs btn-group'>";
		html += "<button class='btn btn-xs btn-success'>"
		html += "<i class='ace-icon fa fa-check bigger-120'></i>"
		html += "</button>"
		html += "<button class='btn btn-xs btn-info'>"
		html += "<i class='ace-icon fa fa-pencil bigger-120'></i>"
		html += "</button>"
		html += "<button class='btn btn-xs btn-danger'>"
		html += "<i class='ace-icon fa fa-trash-o bigger-120'></i>"
		html += "</button>"
		html += "<button class='btn btn-xs btn-warning'>"
		html += "<i class='ace-icon fa fa-flag bigger-120'></i>"
		html += "</button>"
		html += "</div>"
		html += "<div class='hidden-md hidden-lg'>"
		html += "<div class='inline position-relative'>"
		html += "<buttonclass='btn btn-minier btn-primary dropdown-toggle' data-toggle='dropdown' data-position='auto'>"
		html += "<i class='ace-icon fa fa-cog icon-only bigger-110'></i>"
		html += "</button>"
		html += "<ul class='dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close'>"
		html += "<li><a href='#' class='tooltip-info' data-rel='tooltip' title='View'> "
		html += "<span class='blue'>  "
		html += "<i class='ace-icon fa fa-search-plus bigger-120'></i>"
		html += "</span>"
		html += "</a></li>"
		html += "<li><a href='#' class='tooltip-success' data-rel='tooltip' title='Edit'>  "
		html += "<span class='green'> "
		html += "<i class='ace-icon fa fa-pencil-square-o bigger-120'></i>"
		html += "</span>"
		html += "</a></li>"
		html += "<li><a href='#' class='tooltip-error'data-rel='tooltip' title='Delete'> "
		html += "<spanclass='red'> <iclass='ace-icon fa fa-trash-o bigger-120'></i>"
		html += "</span>"
		html += "</a></li>"
		html += "</ul>"
		html += "</div>"
		html += "</div>"
		html += "</td>"
		html += "</tr>"
	}
	
	$("#quesTable").html(html);
};

</script>
</head>

<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>


		<div class="main-content">
			<div class="main-content-inner">

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<!-- /section:settings.box -->
					<div class="page-header">
						<h1>试题管理 
						<small> <i class="ace-icon fa fa-angle-double-right"></i>
							查看试题
						</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="modal-content">
						<div class="modal-body">
							<div class="row">
								<div class="col-xs-12 col-sm-7">
									<div class="form-group">
										<input type="hidden" id="pageSize" name="pageSize" value="10"/>
										<input type="hidden" id="pageNum" name="pageNum" value="1"/>
										<label for="form-field-first">试题描述</label> 
										<input type="text" id="quesTitle" name="quesTitle" /> 
										<label for="form-field-first">类型</label> 
										<select name="quesType"></select>
										<label for="form-field-first">题型</label> 
										<select name="quesCate"></select>
										<button type="button" class="btn btn-info btn-sm" onclick="doQuery()">
										查询
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="row">
								<div class="col-xs-12">
									<table id="quesTable" class="table table-striped table-bordered table-hover">
										
									</table>
								</div>
								<!-- /.span -->
							</div>
							<!-- /.row -->

							<div class="hr hr-18 dotted hr-double"></div>
						</div>
						<!-- /.col -->
					</div>
				</div>
			</div>
		</div>
		<!-- /.main-content -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		</div>

		<script type="text/javascript">
			window.jQuery || document.write("<script src='./assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='./assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="./assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="./assets/js/jquery.dataTables.js"></script>
		<script src="./assets/js/jquery.dataTables.bootstrap.js"></script>

		<!-- ace scripts -->
		<script src="./assets/js/ace/elements.scroller.js"></script>
		<script src="./assets/js/ace/elements.colorpicker.js"></script>
		<script src="./assets/js/ace/elements.fileinput.js"></script>
		<script src="./assets/js/ace/elements.typeahead.js"></script>
		<script src="./assets/js/ace/elements.wysiwyg.js"></script>
		<script src="./assets/js/ace/elements.spinner.js"></script>
		<script src="./assets/js/ace/elements.treeview.js"></script>
		<script src="./assets/js/ace/elements.wizard.js"></script>
		<script src="./assets/js/ace/elements.aside.js"></script>
		<script src="./assets/js/ace/ace.js"></script>
		<script src="./assets/js/ace/ace.ajax-content.js"></script>
		<script src="./assets/js/ace/ace.touch-drag.js"></script>
		<script src="./assets/js/ace/ace.sidebar.js"></script>
		<script src="./assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="./assets/js/ace/ace.submenu-hover.js"></script>
		<script src="./assets/js/ace/ace.widget-box.js"></script>
		<script src="./assets/js/ace/ace.settings.js"></script>
		<script src="./assets/js/ace/ace.settings-rtl.js"></script>
		<script src="./assets/js/ace/ace.settings-skin.js"></script>
		<script src="./assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="./assets/js/ace/ace.searchbox-autocomplete.js"></script>
		<script type="text/javascript">
			jQuery(function($) {
				var oTable1 = 
				$('#sample-table-2')
				.dataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,
					  { "bSortable": false }
					],
					"aaSorting": [],
			    } );
			
				$(document).on('click', 'th input:checkbox' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			})
		</script>


		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="./assets/js/ace/elements.onpage-help.js"></script>
		<script src="./assets/js/ace/ace.onpage-help.js"></script>
		<script src="./docs/assets/js/rainbow.js"></script>
		<script src="./docs/assets/js/language/generic.js"></script>
		<script src="./docs/assets/js/language/html.js"></script>
		<script src="./docs/assets/js/language/css.js"></script>
		<script src="./docs/assets/js/language/javascript.js"></script>
</body>
</html>

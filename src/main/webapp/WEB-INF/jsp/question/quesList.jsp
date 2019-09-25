<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>试题管理</title>

		<meta name="description" content="Static &amp; Dynamic Tables" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="./assets/css/bootstrap.css" />
		<link rel="stylesheet" href="./assets/css/font-awesome.css" />
		<link rel="stylesheet" href="./assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="./assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<script src="./assets/js/ace-extra.js"></script>
		<style type="text/css">
	      .hiddenCol{
	      	  display:none;
	      }
	    </style>
	</head>

	<body class="no-skin">

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">

						<!-- /section:settings.box -->
						<div class="page-header">
							<h1>
								试题管理
							</h1>
						</div><!-- /.page-header -->
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-1 control-label no-padding-right" for="form-field-1-1"> 试题描述 </label>

								<div class="col-sm-8">
									<input type="text" id="quesTitle" class="form-control" />
								</div>
							</div>	
							<div class="form-group">
								<label class="col-sm-1 control-label no-padding-right" for="form-field-1">试题答案 </label>
								<div class="col-sm-2">
									<input type="text" id="quesRightAnswer" class="form-control" />
								</div>
								
								<label class="col-sm-1 control-label no-padding-right">科目</label>
								<div class="col-sm-1">
									<select id="quesType" name="quesType"></select>
								</div>
								
								&emsp;&emsp;&emsp;
								<label>题型</label>
								<select id="quesCate" name="quesCate"></select>
								&emsp;&emsp;&emsp;
								<button onclick="query()" type="button" class="btn btn-info btn-sm">
									<i class="ace-icon fa fa-search bigger-110"></i>查询
								</button>
								&emsp;
								<button type="button" class="btn btn-info btn-sm" href="#modal-table" role="button" data-toggle="modal">
									<i class="ace-icon fa fa-plus-circle bigger-110">
									<a style="color:#ffffff">新增</a></i>
								</button>
							</div>
						</form>
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">

										<!-- <div class="table-responsive"> -->

										<!-- <div class="dataTables_borderWrap"> -->
										<div>
											<table id="quesListTable" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th id="thCheckbox" class="center" width="5%">
															<label class="position-relative">
																<input type="checkbox" class="ace" />
																<span class="lbl"></span>
															</label>
														</th>
														<th id="thQuesId" hidden="hidden">试题ID</th>
														<th id="thQuesTitle" width="49%">试题描述</th>
														<th id="thQuesRightAnswer" width="12%">试题答案</th>
														<th id="thQuesType" width="10%">科目</th>
														<th id="thQuesCate" width="10%">题型</th>
														<th id="thQuesOp" width="9%">操作</th>
														<th id="thQuesTypeId" hidden="hidden"></th>
														<th id="thQuesCateId" hidden="hidden"></th>
													</tr>
												</thead>

												<tbody></tbody>
											</table>
										</div>
									</div>
								</div>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div id="modal-table" class="modal fade" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header no-padding">
							<div class="table-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									<span class="white">&times;</span>
								</button>
								新增试题
							</div>
						</div>

						<div class="modal-body no-padding" id="quesAdd">
							<div class="form-group">
								<label class="control-label no-padding-right" for="form-field-1-1"> 试题描述 </label>
								<input type="text" id="addQuesTitle" />
							</div>
							<div class="form-group">
								<label class="control-label no-padding-right" for="form-field-1">试题答案 </label>
								<input type="text" id="addQuesRightAnswer"/>
							</div>
							<div class="form-group">
								<label class="control-label no-padding-right">科目</label>
								<select id="addQuesTypeId" name="quesType">
								</select>
							</div>
							<div class="form-group">
								<label class="control-label no-padding-right">题型</label>
								<select id="addQuesCateId" name="quesCate">
								</select>
							</div>
						</div>

						<div class="modal-footer no-margin-top">
							<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
								<i class="ace-icon fa fa-times"></i>
								取消
							</button>
							<button class="btn btn-sm btn-success pull-right" onclick="add()">
								<i class="ace-icon fa fa-check"></i>
								提交
							</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- PAGE CONTENT ENDS -->
							
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='./assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='./assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
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
		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="./assets/js/ace/elements.onpage-help.js"></script>
		<script src="./assets/js/ace/ace.onpage-help.js"></script>
		<script src="./docs/assets/js/rainbow.js"></script>
		<script src="./docs/assets/js/language/generic.js"></script>
		<script src="./docs/assets/js/language/html.js"></script>
		<script src="./docs/assets/js/language/css.js"></script>
		<script src="./docs/assets/js/language/javascript.js"></script>
		<script src="./js/question/quesList.js"></script>
	</body>
</html>

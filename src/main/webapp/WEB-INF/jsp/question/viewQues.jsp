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
<script type="text/javascript">
window.onload=function(){
	var data = [];
	data.push("pageSize", 20);
	date.push("pageNum", 1);
	
	var json_data = JSON.stringify(data);
	
	$.ajax({
		type : "post",
		url : "viewQues",
		contentType:"application/json",
		data : json_data,
		dataType : "json",
		success : function(data) {
			alert(data.length);
		},

		error : function() {
			alert("网络错误！");
		}
	});
};

function queryQues(){
	
}
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
						<h1>
							试题管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
								查看试题
							</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<form id="viewQues">
						<div class="modal-content">
							<div class="modal-body">
								<div class="row">
									<div class="col-xs-12 col-sm-7">
										<div class="form-group">
											<label for="form-field-first">试题描述</label> 
											<input type="text" id="quesTitle" name="quesTitle" /> 
											<label for="form-field-first">类型</label> 
											<input type="text" id="quesTypeId" name="quesTypeId" />  
											<label for="form-field-first">题型</label> 
											<input type="text" id="quesCateId" name="quesCateId" />

											<button type="button" class="btn btn-info btn-sm" onclick="queryQues()">
												<i class="ace-icon fa fa-key bigger-110"></i>查询
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<!-- PAGE CONTENT BEGINS -->
									<div class="row">
										<div class="col-xs-12">
											<table id="sample-table-1"
												class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center"><label class="position-relative">
																<input type="checkbox" class="ace" /> <span class="lbl"></span>
														</label></th>
														<th>问题ID</th>
														<th>问题描述</th>
														<th class="hidden-480">正确答案</th>

														<th>类型</th>
														<th class="hidden-480">题型</th>

														<th>操作</th>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td class="center"><label class="position-relative">
																<input type="checkbox" class="ace" /> <span class="lbl"></span>
														</label></td>

														<td><a href="#">ace.com</a></td>
														<td>$45</td>
														<td class="hidden-480">3,330</td>
														<td>Feb 12</td>

														<td class="hidden-480"><span
															class="label label-sm label-warning">Expiring</span></td>

														<td>
															<div class="hidden-sm hidden-xs btn-group">
																<button class="btn btn-xs btn-success">
																	<i class="ace-icon fa fa-check bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-info">
																	<i class="ace-icon fa fa-pencil bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-danger">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-warning">
																	<i class="ace-icon fa fa-flag bigger-120"></i>
																</button>
															</div>

															<div class="hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>

													<tr>
														<td class="center"><label class="position-relative">
																<input type="checkbox" class="ace" /> <span class="lbl"></span>
														</label></td>

														<td><a href="#">base.com</a></td>
														<td>$35</td>
														<td class="hidden-480">2,595</td>
														<td>Feb 18</td>

														<td class="hidden-480"><span
															class="label label-sm label-success">Registered</span></td>

														<td>
															<div class="hidden-sm hidden-xs btn-group">
																<button class="btn btn-xs btn-success">
																	<i class="ace-icon fa fa-check bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-info">
																	<i class="ace-icon fa fa-pencil bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-danger">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-warning">
																	<i class="ace-icon fa fa-flag bigger-120"></i>
																</button>
															</div>

															<div class="hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>

													<tr>
														<td class="center"><label class="position-relative">
																<input type="checkbox" class="ace" /> <span class="lbl"></span>
														</label></td>

														<td><a href="#">max.com</a></td>
														<td>$60</td>
														<td class="hidden-480">4,400</td>
														<td>Mar 11</td>

														<td class="hidden-480"><span
															class="label label-sm label-warning">Expiring</span></td>

														<td>
															<div class="hidden-sm hidden-xs btn-group">
																<button class="btn btn-xs btn-success">
																	<i class="ace-icon fa fa-check bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-info">
																	<i class="ace-icon fa fa-pencil bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-danger">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-warning">
																	<i class="ace-icon fa fa-flag bigger-120"></i>
																</button>
															</div>

															<div class="hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>

													<tr>
														<td class="center"><label class="position-relative">
																<input type="checkbox" class="ace" /> <span class="lbl"></span>
														</label></td>

														<td><a href="#">best.com</a></td>
														<td>$75</td>
														<td class="hidden-480">6,500</td>
														<td>Apr 03</td>

														<td class="hidden-480"><span
															class="label label-sm label-inverse arrowed-in">Flagged</span>
														</td>

														<td>
															<div class="hidden-sm hidden-xs btn-group">
																<button class="btn btn-xs btn-success">
																	<i class="ace-icon fa fa-check bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-info">
																	<i class="ace-icon fa fa-pencil bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-danger">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-warning">
																	<i class="ace-icon fa fa-flag bigger-120"></i>
																</button>
															</div>

															<div class="hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>

													<tr>
														<td class="center"><label class="position-relative">
																<input type="checkbox" class="ace" /> <span class="lbl"></span>
														</label></td>

														<td><a href="#">pro.com</a></td>
														<td>$55</td>
														<td class="hidden-480">4,250</td>
														<td>Jan 21</td>

														<td class="hidden-480"><span
															class="label label-sm label-success">Registered</span></td>

														<td>
															<div class="hidden-sm hidden-xs btn-group">
																<button class="btn btn-xs btn-success">
																	<i class="ace-icon fa fa-check bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-info">
																	<i class="ace-icon fa fa-pencil bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-danger">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</button>

																<button class="btn btn-xs btn-warning">
																	<i class="ace-icon fa fa-flag bigger-120"></i>
																</button>
															</div>

															<div class="hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- /.span -->
									</div>
									<!-- /.row -->

									<div class="hr hr-18 dotted hr-double"></div>

									<div id="modal-table" class="modal fade" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header no-padding">
													<div class="table-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">
															<span class="white">&times;</span>
														</button>
														Results for "Latest Registered Domains
													</div>
												</div>

												<div class="modal-body no-padding">
													<table
														class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
														<thead>
															<tr>
																<th>Domain</th>
																<th>Price</th>
																<th>Clicks</th>

																<th><i class="ace-icon fa fa-clock-o bigger-110"></i>
																	Update</th>
															</tr>
														</thead>

														<tbody>
															<tr>
																<td><a href="#">ace.com</a></td>
																<td>$45</td>
																<td>3,330</td>
																<td>Feb 12</td>
															</tr>

															<tr>
																<td><a href="#">base.com</a></td>
																<td>$35</td>
																<td>2,595</td>
																<td>Feb 18</td>
															</tr>

															<tr>
																<td><a href="#">max.com</a></td>
																<td>$60</td>
																<td>4,400</td>
																<td>Mar 11</td>
															</tr>

															<tr>
																<td><a href="#">best.com</a></td>
																<td>$75</td>
																<td>6,500</td>
																<td>Apr 03</td>
															</tr>

															<tr>
																<td><a href="#">pro.com</a></td>
																<td>$55</td>
																<td>4,250</td>
																<td>Jan 21</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- PAGE CONTENT ENDS -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.page-content -->
					</form>
				</div>
			</div>
			<!-- /.main-content -->
			<a href="#" id="btn-scroll-up"
				class="btn-scroll-up btn btn-sm btn-inverse"> <i
				class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div>
		<!-- /.main-container -->

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

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				var oTable1 = 
				$('#sample-table-2')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.dataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,
					  { "bSortable": false }
					],
					"aaSorting": [],
			
					//,
					//"sScrollY": "200px",
					//"bPaginate": false,
			
					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element
			
					//"iDisplayLength": 50
			    } );
				/**
				var tableTools = new $.fn.dataTable.TableTools( oTable1, {
					"sSwfPath": "././copy_csv_xls_pdf.swf",
			        "buttons": [
			            "copy",
			            "csv",
			            "xls",
						"pdf",
			            "print"
			        ]
			    } );
			    $( tableTools.fnContainer() ).insertBefore('#sample-table-2');
				*/
				
				
				//oTable1.fnAdjustColumnSizing();
			
			
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

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="./assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="./docs/assets/js/themes/sunburst.css" />

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

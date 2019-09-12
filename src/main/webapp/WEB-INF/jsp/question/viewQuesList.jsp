<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Tables</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="SuggeElson" />
        <meta name="description" content=""
        />
        <meta name="keywords" content=""
        />
        <meta name="application-name" content="sprFlat admin template" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' />
        <!--[if lt IE 9]>
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
		<![endif]-->
        <!-- Css files -->
        <!-- Icons -->
        <link href=".//assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href=".//assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href=".//assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href=".//assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href=".//assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href=".//assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href=".//assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href=".//assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href=".//assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href=".//assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href=".//assets/img/ico/favicon.ico" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
        <script src=".//assets/js/jquery/jquery-3.4.1.js"></script>
        <script type="text/javascript">
			var tableData = {};
			tableData["pageSize"] = 10000;
			tableData["pageNum"] = 1;
        
			$(function(){ 
				$("#quesFucker").dataTable({
					ajax: 'queryQues'
				});
			});
					/*
					searching: true, //是否开启搜索功能
				    ordering: false,//是否排序
				   	processing: true,//获取数据过程中是否出现加载指示
				   	bPaginate:true,//是否允许分页
				   	bInfo:true,//是否显示表格相关信息
				   	destroy:true,//销毁一个实例
				   	iDisplayLength:5,//分页时每页显示的行数
				   	bLengthChange:false,
				    serverSide: true,//当用ajax请求数据源时，这个属性必须添加，切记
					ajax:{ //使用ajax记得要引入jquery.min.js
					    url:'queryQues', //请求路径，也就是控制器里方法
					    type:"post",
					    async:true,
					    data : window.tableData,
						dataType : "json"
					},
					columns:[  //绑定的数据源，后台的json数据里必须有这些属性，保持一致性
				        {"data":"quesId"},
				        {"data":"quesTitle"},
				        {"data":"quesRightAnswer"},
				        {"data":"quesTypeName"},
				        {"data":"quesCateName"}
				    ],
				 	columnDefs:[
						 {
						    // targets:5,  //对数据源中的第六行进行渲染
						     //render:function(data,type,row){
						     //var html = '<a href="javascript:cancelUser('+data['id']+');">取消授权</a>';
						     //return html;
						 }
					  ],
				     "oLanguage" : { // 国际化配置
				             "sProcessing" : "正在获取数据，请稍后...",
				             "sLengthMenu" : "显示 _MENU_ 条",
				             "sZeroRecords" : "没有找到数据",
				             "sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
				             "sInfoEmpty" : "记录数为0",
				             "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
				             "sInfoPostFix" : "",
				             "sSearch" : "查询",
				             "sUrl" : "",
				             "oPaginate" : {
				                 "sFirst" : "第一页",
				                 "sPrevious" : "上一页",
				                 "sNext" : "下一页",
				                 "sLast" : "最后一页"
				             }
				     },
				})
			});
			*/
			
			function queryQuesType(){
				$.ajax({
					type : "post",
					url : "queryQuesType",
					dataType : "json",
					success : function(result) {
						if(result.length === 0){
							alert("查询为空");
						}else{
							alert(JSON.stringify(result));
							//buildQuesType(result);
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
					async : false,
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
				html += "<th>试题ID</th>";
				html += "<th>试题描述</th>";
				html += "<th>正确答案</th>";
				html += "<th>类型</th>";
				html += "<th>题型</th>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				for(i = 0; i < data.length; i++){
					html += "<tr ";
					if(i % 2 == 0){
						html += "class='odd gradeX'>";
					}else{
						html += "class='even gradeC'>";
					}
					html += "<td>" + data[i].quesId + "</td>";
					html += "<td>" + data[i].quesTitle + "</td>";
					html += "<td>" + data[i].quesRightAnswer + "</td>";
					html += "<td>" + data[i].quesTypeName + "</td>";
					html += "<td>" + data[i].quesCateName + "</td>";
				}
				html += "</tbody><tfoot><tr>";
				html += "<th>试题ID</th>";
				html += "<th>试题描述</th>";
				html += "<th>正确答案</th>";
				html += "<th>类型</th>";
				html += "<th>题型</th></tr></tfoot></table>";
				$("#datatable").html(html);
				$("#datatable").dataTable();
			};
	</script>
    </head>
    <body>
        <!-- Start #content -->
        <div>
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <!-- End .row -->
				<div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default plain toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">Data table</h4>
                                </div>
                                <div class="panel-body">
                                    <table class="table display" id="quesFucker">
                                    	<thead>
											<tr>
												<th>试题ID</th>
												<th>试题描述</th>
												<th>正确答案</th>
												<th>类型</th>
												<th>题型</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>试题ID</th>
												<th>试题描述</th>
												<th>正确答案</th>
												<th>类型</th>
												<th>题型</th>
											</tr>
										</tfoot>
										
                                    </table>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-12 end here -->
                    </div>
                </div>
                <!-- End .outlet -->
            </div>
            <!-- End .content-wrapper -->
            <div class="clearfix"></div>
        </div>
        <!-- End #content -->
        <!-- Javascripts -->
        <!-- Load pace first -->
        <script src=".//assets/plugins/core/pace/pace.min.js"></script>
        <!-- Important javascript libs(put in all pages) -->
        <script src=".//assets/js/jquery-1.8.3.min.js"></script>
        <script>
        window.jQuery || document.write('<script src=".//assets/js/libs/jquery-2.1.1.min.js">\x3C/script>')
        </script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script>
        window.jQuery || document.write('<script src=".//assets/js/libs/jquery-ui-1.10.4.min.js">\x3C/script>')
        </script>
        <!--[if lt IE 9]>
		  <script type="text/javascript" src=".//assets/js/libs/excanvas.min.js"></script>
		  <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		  <script type="text/javascript" src=".//assets/js/libs/respond.min.js"></script>
		<![endif]-->
        <!-- Bootstrap plugins -->
        <script src=".//assets/js/bootstrap/bootstrap.js"></script>
        <!-- Core plugins ( not remove ever) -->
        <!-- Handle responsive view functions -->
        <script src=".//assets/js/jRespond.min.js"></script>
        <!-- Custom scroll for sidebars,tables and etc. -->
        <script src=".//assets/plugins/core/slimscroll/jquery.slimscroll.min.js"></script>
        <script src=".//assets/plugins/core/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
        <!-- Resize text area in most pages -->
        <script src=".//assets/plugins/forms/autosize/jquery.autosize.js"></script>
        <!-- Proivde quick search for many widgets -->
        <script src=".//assets/plugins/core/quicksearch/jquery.quicksearch.js"></script>
        <!-- Bootbox confirm dialog for reset postion on panels -->
        <script src=".//assets/plugins/ui/bootbox/bootbox.js"></script>
        <!-- Other plugins ( load only nessesary plugins for every page) -->
        <script src=".//assets/plugins/core/moment/moment.min.js"></script>
        <script src=".//assets/plugins/charts/sparklines/jquery.sparkline.js"></script>
        <script src=".//assets/plugins/charts/pie-chart/jquery.easy-pie-chart.js"></script>
        <script src=".//assets/plugins/forms/icheck/jquery.icheck.js"></script>
        <script src=".//assets/plugins/forms/tags/jquery.tagsinput.min.js"></script>
        <script src=".//assets/plugins/forms/tinymce/tinymce.min.js"></script>
        <script src=".//assets/plugins/tables/datatables/jquery.dataTables.min.js"></script>
        <script src=".//assets/plugins/tables/datatables/jquery.dataTablesBS3.js"></script>
        <script src=".//assets/plugins/tables/datatables/tabletools/ZeroClipboard.js"></script>
        <script src=".//assets/plugins/tables/datatables/tabletools/TableTools.js"></script>
        <script src=".//assets/plugins/misc/highlight/highlight.pack.js"></script>
        <script src=".//assets/plugins/misc/countTo/jquery.countTo.js"></script>
        <script src=".//assets/js/jquery.sprFlat.js"></script>
        <script src=".//assets/js/app.js"></script>
    </body>
</html>
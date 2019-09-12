<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>青海农信考试系统</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="SuggeElson" />
        <meta name="description" content=""/>
        <meta name="keywords" content=""/>
        <meta name="application-name" content="sprFlat admin template" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />
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
        <script type="text/javascript" src="./js/jquery/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			function login() {
				if ($("#acctName").val().length === 0) {
					alert("用户名不能为空！");
					return;
				}
		
				if ($("#password").val().length === 0) {
					alert("密码不能为空！");
					return;
				}
		
				$.ajax({
					type : "post",
					url : "login",
					data : $('#loginForm').serialize(),
					success : function(data) {
						if ("000000" === data) {
							alert("登录成功！");
							location.href = "index";
						} else if ("000001" === data) {
							alert("用户名不存在，请核对后重新登录！");
						} else if ("000002" === data) {
							alert("密码错误，请核对后重新登录！");
						}
					},
		
					error : function() {
						alert("网络错误！");
					}
				});
			}
		</script>
    </head>
    <body class="login-page">
        <!-- Start #login -->
        <div id="login" class="animated bounceIn">
            <img id="logo" src=".//assets/img/logo.png" alt="sprFlat Logo">
            <!-- Start .login-wrapper -->
            <div class="login-wrapper">
                <ul id="myTab" class="nav nav-tabs nav-justified bn">
                    <li>
                        <a data-toggle="tab">请登录</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content bn">
                    <div class="tab-pane fade active in" id="log-in">
                        <form class="form-horizontal mt10" id="loginForm" role="form">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <input type="text" name="acctName" id="acctName" class="form-control left-icon" placeholder="请输入用户名">
                                    <i class="ec-user s16 left-input-icon"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <input type="password" name="password" id="password" class="form-control left-icon" >
                                    <i class="ec-locked s16 left-input-icon"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-8">
                                </div>
                                <!-- col-lg-12 end here -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-4">
                                    <!-- col-lg-12 start here -->
                                    <button onclick="login()" class="btn btn-success pull-right" type="submit">Login</button>
                                </div>
                                <!-- col-lg-12 end here -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End #.login-wrapper -->
        </div>
        <!-- End #login -->
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
        <!-- Form plugins -->
        <script src=".//assets/plugins/forms/icheck/jquery.icheck.js"></script>
        <script src=".//assets/plugins/forms/validation/jquery.validate.js"></script>
        <script src=".//assets/plugins/forms/validation/additional-methods.min.js"></script>
        <!-- Init plugins olny for this page -->
        <script src=".//assets/js/pages/login.js"></script>
    </body>
</html>
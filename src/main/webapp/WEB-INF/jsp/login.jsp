<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./assets/css/bootstrap.css" />
<link rel="stylesheet" href="./assets/css/font-awesome.css" />
<link rel="stylesheet" href="./assets/css/ace-fonts.css" />
<link rel="stylesheet" href="./assets/css/ace.css" />
<link rel="stylesheet" href="./assets/css/ace-rtl.css" />
</head>
<meta http-equiv=“Content-Type” content=“text/html; charset=UTF-8″>
<title>青海农信考试平台</title>
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
<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<span class="green">青海农信</span> <span class="white"
									id="id-text2">考试系统</span>
							</h1>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">请登录</h4>

										<div class="space-6"></div>

										<form id="loginForm">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														name="acctName" id="acctName" type="text"
														class="form-control" placeholder="Username" />
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														name="password" id="password" type="password"
														class="form-control" placeholder="Password" />
												</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<button type="button" onclick="login()"
														class="width-35 pull-right btn btn-sm btn-primary">
														<span class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>


									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i> Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>Enter your email and to receive instructions</p>

											<form>
												<fieldset>
													<label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
													</span>
													</label>

													<div class="clearfix">
														<button type="button"
															class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i> <span
																class="bigger-110">Send Me!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div>
										<!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box"
												class="back-to-login-link"> Back to login <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i> New User
												Registration
											</h4>

											<div class="space-6"></div>
											<p>Enter your details to begin:</p>

											<form>
												<fieldset>
													<label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
													</span>
													</label> <label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="Username" />
															<i class="ace-icon fa fa-user"></i>
													</span>
													</label> <label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="password" class="form-control"
															placeholder="Password" /> <i class="ace-icon fa fa-lock"></i>
													</span>
													</label> <label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="password" class="form-control"
															placeholder="Repeat password" /> <i
															class="ace-icon fa fa-retweet"></i>
													</span>
													</label> <label class="block"> <input type="checkbox"
														class="ace" /> <span class="lbl"> I accept the <a
															href="#">User Agreement</a>
													</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i> <span
																class="bigger-110">Reset</span>
														</button>

														<button type="button"
															class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Register</span> <i
																class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box"
												class="back-to-login-link"> <i
												class="ace-icon fa fa-arrow-left"></i> Back to login
											</a>
										</div>
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.signup-box -->
							</div>
							<!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br /> &nbsp; <a id="btn-login-dark" href="#">Dark</a> &nbsp; <span
									class="blue">/</span> &nbsp; <a id="btn-login-blur" href="#">Blur</a>
								&nbsp; <span class="blue">/</span> &nbsp; <a
									id="btn-login-light" href="#">Light</a> &nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.main-content -->
		</div>
	</div>
		<script type="text/javascript">
			window.jQuery
					|| document.write("<script src='../assets/js/jquery.js'>"
							+ "<"+"/script>");
		</script>

		<script type="text/javascript">
			if ('ontouchstart' in document.documentElement)
				document
						.write("<script src='../assets/js/jquery.mobile.custom.js'>"
								+ "<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				$(document).on('click', '.toolbar a[data-target]', function(e) {
					e.preventDefault();
					var target = $(this).data('target');
					$('.widget-box.visible').removeClass('visible');//hide others
					$(target).addClass('visible');//show target
				});
			});

			//you don't need this, just used for changing background
			jQuery(function($) {
				$('#btn-login-dark').on('click', function(e) {
					$('body').attr('class', 'login-layout');
					$('#id-text2').attr('class', 'white');
					$('#id-company-text').attr('class', 'blue');

					e.preventDefault();
				});
				$('#btn-login-light').on('click', function(e) {
					$('body').attr('class', 'login-layout light-login');
					$('#id-text2').attr('class', 'grey');
					$('#id-company-text').attr('class', 'blue');

					e.preventDefault();
				});
				$('#btn-login-blur').on('click', function(e) {
					$('body').attr('class', 'login-layout blur-login');
					$('#id-text2').attr('class', 'white');
					$('#id-company-text').attr('class', 'light-blue');

					e.preventDefault();
				});

			});
		</script>
</body>
</html>
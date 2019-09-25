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

$(function(){ 
	queryQuesType();
	queryQuesCate();
	query();
});

function query(){
	$("#quesListTable").dataTable().fnDestroy();
    
	 $('#quesListTable').DataTable({
         "bPaginate": true,  //是否显示分页
         "sPaginationType": "full_numbers", //分页，一共两种样式，full_numbers和two_button(默认)
         "bStateSave": false, //保存状态到cookie *************** 很重要 ， 当搜索的时候页面一刷新会导致搜索的消失。使用这个属性就可避免了
         "bScrollCollapse" : true, //当显示的数据不足以支撑表格的默认的高度 
         "bLengthCrowNume": true,  //每行显示的记录数
         "bFilter": false, //搜索栏
         "bSort": false, //是否支持排序功能
         "bInfo": true, //显示表格信息
         "bAutoWidth": false,  //自适应宽度
         "bDestory" : true,
         "bProcessing": false,
         "bServerSide": true,
         "sAjaxSource": "queryQues",
         "fnServerData" : function(ajaxSource, aoData, fnCallback){
        	 aoData.push({"name":"quesTitle", "value": $("#quesTitle").val()});
        	 aoData.push({"name":"quesRightAnswer", "value": $("#quesRightAnswer").val()});
             aoData.push({"name": "quesTypeId", "value": $("select[name='quesType'] option:selected").val()});
        	 aoData.push({"name": "quesCateId", "value": $("select[name='quesCate'] option:selected").val()});
        	 $.ajax({
        		 dataType: "json",
                 type: "POST",
                 url: ajaxSource,
                 data: "paramStr=" + JSON.stringify(aoData),
                 success: function(data){
                	 fnCallback(data);
                 }
        	 });
         },
		columns: [
            {data: null, "bSortable": false, "class" : "center", "render": function(data, type, row, mDate) {
                    var html = "<label  class='position-relative'>" + 
                    				"<input class='ace' type='checkbox' value="+data.quesId+"/>" + 
                    				"<span class='lbl'></span>" + 
                    			"</label>"
                    return html;
                }},
            {data: "quesId", sClass:"hiddenCol"},
            {data: "quesTitle"},
            {data: "quesRightAnswer"},
            {data: "quesTypeName"},
            {data: "quesCateName"},
            {data: null, "bSortable": false, "render": function(data, type, row, mDate) {
                    var html =  "<button onclick='deleteQues($(this))' id='delteQues' type='button' class='btn btn-info btn-sm'>" + 
	                            "<i class='ace-icon fa fa-trash-o bigger-110'>" + 
	                            "&emsp;<a style='color:#ffffff'>删除</a></i></button>";
                    return html;
            }},
            {data: "quesTypeId", sClass:"hiddenCol"},
            {data: "quesCateId", sClass:"hiddenCol"}
        ],
	   select: {
	       style: 'multi'
	   },
	   "aaSorting": [],
	   "oLanguage": {
	       "sEmptyTable": "对不起，表中没有数据。",
	       "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
	       "sInfoEmtpy": "找不到相关数据",
	       "sInfoFiltered": "（从 _MAX_ 条记录中过滤）",
	       "sInfoPostFix": "　",
	       "sInfoThousands": ",",//千位分隔符
	       "sLengthMenu": "每页显示 _MENU_ 条记录",
	       "sLoadingRecords": "载入中...",
	       "sProcessing": "正在加载中...",
	       "sSearch": "搜索：",
	       "sZeroRecords": "对不起，搜索不到任何相关数据。",
	       "oPaginate": {
	           "sFirst": "第一页",
	           "sPrevious": " 上一页 ",
	           "sNext": " 下一页 ",
	           "sLast": " 最后一页 "
	       },
	       "oAria": {
	           "sSortAscending": "可以按升序对列进行排序",
	           "sSortDescending": "可以按降序对列进行排序"
	       }
	   }
	});
	
	//全选 
    $('table th input:checkbox').on( 
        'click', 
        function() { 
          var that = this; 
          $(this).closest('table').find( 
              'tr > td:first-child input:checkbox').each( 
              function() { 
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
};

function isEmpty(obj){
    if(typeof obj == "undefined" || obj == null || obj == ""){
        return true;
    }else{
        return false;
    }
}

function add(){
	var addQuesTitle = $("#addQuesTitle").val();
	var addQuesRightAnswer = $("#addQuesRightAnswer").val();
	var addQuesTypeId = $("#addQuesTypeId").val();
	var addQuesCateId = $("#addQuesCateId").val();
	if(isEmpty(addQuesTitle)){
		alert("试题描述不能为空！");
		return;
	}
	if(isEmpty(addQuesRightAnswer)){
		alert("试题答案不能为空！");
		return;
	}
	if(addQuesTypeId == 0){
		alert("试题类型不能为空！");
		return;
	}
	if(addQuesCateId == 0){
		alert("题型不能为空！");
		return;
	}
	$.ajax({
		type : "post",
		url : "addQues",
		dataType : "json",
		data : {
			quesTitle : addQuesTitle,
			quesRightAnswer : addQuesRightAnswer,
			quesTypeId : addQuesTypeId,
			quesCateId : addQuesCateId
		},
		success : function(result) {
			if(result == 1){
				alert("新增成功");
				$("#addQuesTitle").val("");
				$("#addQuesRightAnswer").val("");
				$("#addQuesTypeId").val(0);
				$("#addQuesCateId").val(0);
				query();
			}
		},
		error : function() {
			alert("网络错误！");
		}
	});
}

function deleteQues(button) {
	var quesId = button.parent().parent().find("td:eq(1)").text();
	$( "#deleteConfirm" ).removeClass('hide').dialog({
		resizable: false,
		modal: true,
		title: "确认删除该试题？",
		title_html: true,
		buttons: [
			{
				html: "<i class='ace-icon fa fa-trash-o bigger-110'></i>&nbsp; 删除&nbsp;&nbsp;&nbsp;",
				"class" : "btn btn-danger btn-xs",
				click: function() {
					$.ajax({
						type : "post",
						url : "removeQues",
						dataType : "json",
						data : {
							"quesId" : quesId
						},
						success : function(result) {
							if(result.length == 1){
								alert("删除成功");
							}
						},
						error : function() {
							alert("网络错误！");
						}
					});
				}
			}
			,
			{
				html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
				"class" : "btn btn-xs",
				click: function() {
					$(this).dialog( "close" );
				}
			}
		]
	});
}

$('#quesListTable').on('dblclick','td',function(){
	if(!$(this).is('.input')){
		var rowNum = $(this).parent().prevAll().length;
		var lineNum = $(this).prevAll().length;
		var thId = $('#quesListTable tr:eq(0) th:eq(' + lineNum + ')').attr("id");
		if(thId == "thQuesTitle" || thId == "thQuesRightAnswer"){
			 $(this).addClass('input').html('<input type="text" class="col-sm-8" value="'+ $(this).text() +'" />')
			 .find('input').focus().blur(function(){    
				var thisid = $(this).parent().siblings("th:eq(0)").text();    
				var thisvalue= $(this).val(); 
				if(isEmpty(thisvalue)){
					alert("内容不能为空！");
					return;
				}
				$(this).parent().removeClass('input').html($(this).val());
				updateQues(rowNum);
			});    
		}else if(thId == "thQuesType"){
		    var td = $(this);
		    var statusId = td.children(".status").val();
		    td.empty();
		    var select = $("#quesType").clone(true);
		    select.find("#"+statusId).attr("SELECTED","SELECTED");
		    td.append(select);
		    select.blur(function(){
		        var select = $(this);
		        var td = select.parent("td");
		        var selectedId = select.children("option:selected").val();
		        if(selectedId == 0){
		        	alert("题型不能为空！");
		        	return;
		        }
		        var selectedText = select.children("option:selected").text();
		        td.children(".status").val(selectedId);
		        td.html(selectedText);
		        td.parent().find("td:eq(7)").html(selectedId);
		        $(this).parent().removeClass('select');
		        updateQues(rowNum);
		    });
		    td.unbind("click");
		}else if(thId == "thQuesCate"){
		    var td = $(this);
		    var statusId = td.children(".status").val();
		    td.empty();
		    var select = $("#quesCate").clone(true);
		    select.find("#"+statusId).attr("SELECTED","SELECTED");
		    td.append(select);
		    select.blur(function(){
		        var select = $(this);
		        var td = select.parent("td");
		        var selectedId = select.children("option:selected").val();
		        if(selectedId == 0){
		        	alert("题型不能为空！");
		        	return;
		        }
		        var selectedText = select.children("option:selected").text();
		        td.children(".status").val(selectedId);
		        td.html(selectedText);
		        td.parent().find("td:eq(8)").html(selectedId);
		        $(this).parent().removeClass('select');
		        updateQues(rowNum);
		    });
		    td.unbind("click");
		}
	}
});

function updateQues(rowNum){
	var tr = $("#quesListTable tbody tr:eq(" + rowNum + ")");
	var quesId = tr.find("td:eq(1)").text();
	var quesTitle = tr.find("td:eq(2)").text();
	var quesRightAnswer = tr.find("td:eq(3)").text();
	var quesTypeId = tr.find("td:eq(7)").text();
	var quesCateId = tr.find("td:eq(8)").text();
	
	$.ajax({
		type : "post",
		url : "editQues",
		dataType : "json",
		data : {
			"quesId" : quesId,
			"quesTitle" : quesTitle,
			"quesRightAnswer" : quesRightAnswer,
			"quesTypeId" : quesTypeId,
			"quesCateId" : quesCateId
		},
		success : function(result) {
			if(result.length == 1){
				alert("新增成功");
			}
		},
		error : function() {
			alert("网络错误！");
		}
	});
}


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<link href="/apps/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type='text/javascript' src='/webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script type='text/javascript' src='/apps/js/password.js'></script>
<script type='text/javascript' src="/apps/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="/apps/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/apps/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
$(function() {
    $('#password').password();
    $("#password2").on("keyup", function(){
    	console.log("psw"+$("#password").val());
    	console.log("psw2"+$("#password2").val());
    	if($("#password").val() != $("#password2").val()){
    		$("#password2").parent().addClass("has-error");
    		$("#password2").next().addClass("glyphicon-remove");
    		/* $("#password2").attr("title","两次密码不一样"); */
    		$("#subm").attr("disabled",true);
    	}else{
    		$("#password2").parent().removeClass("has-error");
    		$("#password2").parent().addClass("has-success");
    		$("#password2").next().removeClass("glyphicon-remove");
    		$("#password2").next().addClass("glyphicon-ok");
    		/* $("#password2").attr("title",""); */
    		$("#subm").attr("disabled",false);
    	}
    });
    /* $("[data-toggle='tooltip']").tooltip(); */
    $('.registerForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'user.loginName': {
                message: 'The username is not valid',
                validators: {
                    /* notEmpty: {
                        message: '用户名不能空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名长度为6-30'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The username can only consist of alphabetical, number and underscore'
                    } */
                    notEmpty: {
                        message: '用户名不能空，使用邮箱注册。例如：admin@timemagic.cn'
                    },
                    /* emailAddress: {
                        message: '请输入正确的邮箱地址'
                    }, */
                    stringLength: {
                        min: 10,
                        max: 50,
                        message: '长度尽量不要超过50个字符'
                    },
                    regexp: {
                        regexp: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
                        message: '请输入正确的邮箱地址'
                    }
                }
            }
        }
    })
    /* .on('success.form.bv', function(e) {
        // Prevent submit form
        //e.preventDefault();
        var $form     = $(e.target),
            validator = $form.data('bootstrapValidator');
        //$form.find('.alert').html('Thanks for signing up. Now you can sign in as ' + validator.getFieldElements('user.loginName').val()).show();
        console.log($form.context);
        console.log(e);
        e.submit();
        //$form.context.submit();
    }) */;
    $("#userName").on("blur", function(){
    	if($("#userName").parent().hasClass("has-error")){
    	}else{
    		var userName = $("#userName").val();
    		$.ajax({
				url:'/userjson/getUser.do',
				data:{userName:$('#userName').val()},
				type:'post',
				success:function(json){
					var result = json.result;
					if(result == '已存在'){
						$("#userName").parent().addClass("has-error");
			   	 		$("#userName").next().addClass("glyphicon-remove");
		   		 		$("#subm").attr("disabled",true);
					}else{
						$("#userName").parent().removeClass("has-error");
				    	$("#userName").next().removeClass("glyphicon-remove");
			    		$("#subm").attr("disabled",false);
					}
				}
			});
    	}
    });
    $('#datetimepicker').datetimepicker({
    	language:  'zh-CN',
    	weekStart: 1,//星期一
        todayBtn:  1,
		autoclose: true,//自动关闭
		todayHighlight: true,
		startView: 2,
		minView: 2,//最小单位，2是日
		forceParse: false,
        format: 'yyyy-mm-dd'
    });
});
</script>
<title>添加</title>
</head>
<body style="background-image:url(/image/bg01.gif);">
	<div class="container">
		<s:form action="save" namespace="/user" cssClass="registerForm" role="form">
		<!-- <div class="alert alert-success" style="display: none;"></div> -->
		<div style="position:fixed;left:30%;top:20%;margin-left:width/2;margin-top:height/2;width: 500px;">
			<div class="form-group has-feedback">
				<label for="userName">用户名(邮箱注册)</label>
				<s:textfield id="userName" name="user.loginName" cssClass="form-control" placeholder="邮箱注册"></s:textfield>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="password">请设置密码</label>
				<s:password id="password" name="user.passWord" cssClass="form-control" placeholder="密码"/>
			</div>
			<div class="form-group has-feedback">
				<label for="password2">请确认密码</label>
				<s:password id="password2" data-toggle="tooltip" cssClass="form-control" placeholder="密码" aria-describedby="inputError2Status"/>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="name">姓名</label>
				<s:textfield id="name" name="user.name" cssClass="form-control" placeholder="姓名"/>
				<span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="name">出生日期</label>
				<s:textfield id="datetimepicker" name="user.birthday" cssClass="form-control" placeholder="出生日期"/>
				<span class="glyphicon glyphicon-calendar form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="address">地址</label>
				<s:textfield id="address" name="user.address" cssClass="form-control" placeholder="地址"/>
				<span class="glyphicon glyphicon-home form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="mobile">电话</label>
				<s:textfield id="mobile" name="user.mobile" cssClass="form-control" placeholder="电话"/>
				<span class="glyphicon glyphicon-earphone form-control-feedback" aria-hidden="true"></span>
			</div>
			<!-- <button type="submit" class="btn btn-primary" name="reg">注册</button> -->
			<s:submit id="subm" cssClass="btn btn-primary" value="注册"></s:submit>
		</div>
		</s:form>
	</div>
</body>
</html>

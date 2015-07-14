<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel='stylesheet' href='/apps/css/carousel.css'>
<script type='text/javascript' src='/webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script type="text/javascript">
$(function() {
	$('.carousel').carousel()
});
</script>
<title>TimeMagic</title>
</head>
<body style="background-color: #ccc">
	<div class="jumbotron" style="height: auto;">
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>  
			<!-- 轮播（Carousel）项目 -->
			<div class="container">
				<div class="carousel-inner container">
					<div class="item active">
						<h1>Hello, TimeMagic! <small>Time</small></h1>
						<p>Time is a measure in which events can be ordered from the past through the present into the future, and also the measure of durations of events and the intervals between them. Time is often referred to as the fourth dimension, along with the three spatial dimensions.</p>
						<p><a class="btn btn-primary btn-lg" href="#" role="button">Let's Go</a></p>
					</div>
					<div class="item">
						<h1>你好, 绮丽魔光! <small>时光</small></h1>
						<p>墙角迎风的雏菊，茉莉花开的香气。闭上眼回到过去，划分界限的座椅。下课就靠在一起，我就是离不开你。一路乘着溜滑梯，我们说好走到底，以为从此就分离，用黑板上的日期，倒数找你。慢慢清晰 原来思念你，是加了糖 的消息，我用铅笔 画得很仔细，素描那年 天气，蝉鸣的夏季 我想遇见你。</p>
						<p><a class="btn btn-primary btn-lg" href="#" role="button">开启您的旅程</a></p>
					</div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
	<div class="container">
		<div class="well well-lg">欢迎您， 您是第101位旅行者。 <s:property value="name" /></div>
		<div class="tabbable">
			<ul class="nav nav-tabs">
				<li>
					<a href="#panel-zh" data-toggle="tab">关于时光</a>
				</li>
				<li class="active">
					<a href="#panel-en" data-toggle="tab">时光日志</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane" id="panel-zh">
					<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<h4>你好，旅行者。</h4>
					一次旅行需要较大资源，目前您已完成了<strong>45%</strong>,请继续努力！！！
					</div>
					<!-- <p>你好，旅行者。一次旅行需要较大资源，目前您已完成了45%,请继续努力！！！</p> -->
					<div class="progress">
						<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;width: 45%">
							<%-- <span class="sr-only">45% Complete</span> --%>45% Complete
						</div>
					</div>
				</div>
				<div class="tab-pane active" id="panel-en">
					<div class="row">
						<div class="col-xs-6 col-md-4">
							<div class="thumbnail">
				    			<div class="caption">
									<h3>绮丽魔光</h3>
									<p>这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字，这里会有一堆文字↓↓↓↓点击这里进行注册</p>
									<p><a href="/user/add.do" class="btn btn-primary" role="button">注册</a>
										<!-- <a href="#" class="btn btn-default" role="button">Button</a> --></p>
								</div>
							</div>
						</div>
						<div class="col-xs-6 col-md-4">
							<a href="#" class="thumbnail">
								<img src="/image/03.jpg" alt="..."><!--  class="carousel-inner img-responsive img-rounded" 自适应图片-->
							</a>
						</div>
						<div class="col-xs-6 col-md-4">
							<a href="#" class="thumbnail">
								<img src="/image/02.jpg" alt="...">
							</a>
						</div>
  					</div>
				</div>
			</div>
		</div>
		
		<!-- <div class="embed-responsive embed-responsive-16by9">
			<iframe class="embed-responsive-item" src="http://www.baidu.com"></iframe>
		</div> -->
	</div>
</body>
</html>
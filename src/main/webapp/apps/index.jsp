<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<script type='text/javascript' src='/webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<title>TimeMagic</title>
</head>
<body style="background-color: #ccc">
	<div class="jumbotron">
		<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>  
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="container">
					<h1>Hello, TimeMagic! <small>Time</small></h1>
					<p>Time is a measure in which events can be ordered from the past through the present into the future, and also the measure of durations of events and the intervals between them. Time is often referred to as the fourth dimension, along with the three spatial dimensions.</p>
					<p><a class="btn btn-primary btn-lg" href="#" role="button">Let's Go</a></p>
				</div>
			</div>
			<div class="item">
				<div class="container">
					<h1>你好, 绮丽魔光! <small>时光</small></h1>
					<p>墙角迎风的雏菊，茉莉花开的香气。闭上眼回到过去，划分界限的座椅。下课就靠在一起，我就是离不开你。一路乘着溜滑梯，我们说好走到底，以为从此就分离，用黑板上的日期，倒数找你。慢慢清晰 原来思念你，是加了糖 的消息，我用铅笔 画得很仔细，素描那年 天气，蝉鸣的夏季 我想遇见你。</p>
					<p><a class="btn btn-primary btn-lg" href="#" role="button">开启您的旅程</a></p>
				</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" style="background-image:null" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" style="background-image:null" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
		
	</div>
	<div class="container">
		<div class="well well-lg">欢迎, <s:property value="name" /></div>
		<div class="progress">
			<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;width: 45%">
				<%-- <span class="sr-only">45% Complete</span> --%>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 col-md-4">
				<div class="thumbnail">
	    			<div class="caption">
						<h3>Thumbnail label</h3>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
						<p><a href="#" class="btn btn-primary" role="button">Button</a>
							<a href="#" class="btn btn-default" role="button">Button</a></p>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="/image/bg01.gif" alt="..."><!--  class="carousel-inner img-responsive img-rounded" 自适应图片-->
				</a>
			</div>
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="/image/bg01.gif" alt="...">
				</a>
			</div>
  		</div>
		<!-- <div class="embed-responsive embed-responsive-16by9">
			<iframe class="embed-responsive-item" src="http://www.baidu.com"></iframe>
		</div> -->
	</div>
</body>
</html>
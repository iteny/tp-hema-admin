<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>河马CMS首页</title>
	<link rel="stylesheet" href="/public/home/css/common.css" />
	<link rel="stylesheet" href="/public/common/js/unslider/dist/css/unslider.css">
	<style>
	.banner {
	position: relative;
	width: 100%;
	overflow: auto;

	font-size: 18px;
	line-height: 24px;
	text-align: center;

	color: rgba(255,255,255,.6);
	text-shadow: 0 0 1px rgba(0,0,0,.05), 0 1px 2px rgba(0,0,0,.3);

	background: #5b4d3d;
	box-shadow: 0 1px 2px rgba(0,0,0,.25);
}
	.banner ul {
		list-style: none;
		width: 300%;
	}
	.banner ul li {
		display: block;
		float: left;
		width: 33%;
		min-height: 350px;

		-o-background-size: 100% 100%;
		-ms-background-size: 100% 100%;
		-moz-background-size: 100% 100%;
		-webkit-background-size: 100% 100%;
		background-size: 100% 100%;

		box-shadow: inset 0 -3px 6px rgba(0,0,0,.1);
	}

	.banner .inner {
		padding: 160px 0 110px;
	}

	.banner h1, .banner h2 {
		font-size: 40px;
		line-height: 52px;

		color: #fff;
	}

	.banner .btn {
		display: inline-block;
		margin: 25px 0 0;
		padding: 9px 22px 7px;
		clear: both;

		color: #fff;
		font-size: 12px;
		font-weight: bold;
		text-transform: uppercase;
		text-decoration: none;

		border: 2px solid rgba(255,255,255,.4);
		border-radius: 5px;
	}
		.banner .btn:hover {
			background: rgba(255,255,255,.05);
		}
		.banner .btn:active {
			-webkit-filter: drop-shadow(0 -1px 2px rgba(0,0,0,.5));
			-moz-filter: drop-shadow(0 -1px 2px rgba(0,0,0,.5));
			-ms-filter: drop-shadow(0 -1px 2px rgba(0,0,0,.5));
			-o-filter: drop-shadow(0 -1px 2px rgba(0,0,0,.5));
			filter: drop-shadow(0 -1px 2px rgba(0,0,0,.5));
		}

	.banner .btn, .banner .dot {
		-webkit-filter: drop-shadow(0 1px 2px rgba(0,0,0,.3));
		-moz-filter: drop-shadow(0 1px 2px rgba(0,0,0,.3));
		-ms-filter: drop-shadow(0 1px 2px rgba(0,0,0,.3));
		-o-filter: drop-shadow(0 1px 2px rgba(0,0,0,.3));
		filter: drop-shadow(0 1px 2px rgba(0,0,0,.3));
	}

	.banner .dots {
		position: absolute;
		left: 0;
		right: 0;
		bottom: 20px;
	}
		.banner .dots li {
			display: inline-block;
			width: 10px;
			height: 10px;
			margin: 0 4px;

			text-indent: -999em;

			border: 2px solid #fff;
			border-radius: 6px;

			cursor: pointer;
			opacity: .4;

			-webkit-transition: background .5s, opacity .5s;
			-moz-transition: background .5s, opacity .5s;
			transition: background .5s, opacity .5s;
		}
			.banner .dots li.active {
				background: #fff;
				opacity: 1;
			}

	.banner .arrows {
		position: absolute;
		bottom: 20px;
		right: 20px;
		color: #fff;
	}
		.banner .arrow {
			display: inline;
			padding-left: 10px;
			cursor: pointer;
		}
	</style>
</head>
<body>
<div id="hm_top">
	<div class="warp">
		<div class="logo">
			asdfasd
		</div>
		<div class="nav">
			<div class="item" onmouseover="this.className='item hover'" onmouseout="this.className='item'">
				<div class="title"><a href="首页">首页</a><i class="iconfont" style="color:white;font-size: 18px;">&#xe600;</i></div>				
				<div class="cc">
					<div class="warp">
						<ul>
							<li>
								<h2><a href=""><i class="iconfont" style="color:white;font-size: 24px;">&#xe601;</i>&nbsp;你好</a></h2>
								<ol>
									<li><a href=""><i class="iconfont" style="color:white;font-size: 16px;">&#xe601;</i>&nbsp;撒旦发射点发撒旦发射</a></li>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
								</ol>
							</li>
							<li>
								<h2><a href=""><i class="iconfont" style="color:white;font-size: 24px;">&#xe601;</i>&nbsp;你好</a></h2>
								<ol>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
								</ol>
							</li>
							<li>
								<h2><a href=""><i class="iconfont" style="color:white;font-size: 24px;">&#xe601;</i>&nbsp;你好</a></h2>
								<ol>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
								</ol>
							</li>
							<li>
								<h2><a href=""><i class="iconfont" style="color:white;font-size: 24px;">&#xe601;</i>&nbsp;你好</a></h2>
								<ol>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
									<li><a href="">你好</a></li>
								</ol>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="item" onmouseover="this.className='item hover'" onmouseout="this.className='item'">
				<div class="title"><a href="首页">首页</a><i class="iconfont" style="color:white;font-size: 18px;">&#xe600;</i></div>				
				<div class="cc">
					111111
				</div>
			</div>
			<div class="item"><a href="首页"></a></div>
			<div class="item"><a href="首页"></a></div>
		</div>
	</div>
</div>
<div id="hm_slider" style="margin-top:60px;">
	 <div class="banner">
      <ul>
          <li style="width:100%;height:50px;background-color:red;">
              <h1>This is a slide.</h1>
          </li>
          <li style="width:100%;height:50px;background-color:yellow;">
              <h2>This is another slide.</h2>
          </li>
          <li style="width:100%;height:50px;background-color:blue;">
             <h3>This is a final slide.</h3>
         </li>
      </ul>
 </div> 
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-latest.min.js"></script> -->
<script src="/public/common/js/unslider/dist/js/unslider-min.js"></script>
<script>

$(function(){
	var cc = $(window).width();
	$('.cc').css('width',cc);
	var slidey = $('.banner').unslider({
        speed: 500,               
  delay: 3000,            
  complete: function() {}, 
  keys: true,             
  dots: true,              
  fluid: false
	});
  // data = slidey.data('unslider'); 
  // data.move(2, function() {}); 
});

</script>

</html>
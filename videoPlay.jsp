<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,minimum=1.0,user-scalable=no">
<title>videooPlay</title>
<link href="~/js/video-js-5.11.4/alt/video-js-cdn.min.css" rel="stylesheet" />
<script src="~/js/video-js-5.11.4/alt/video.novtt.min.js"></script>
</head>
<body>
<div id="mobile_bg"> 
	<c:if test="${type != 1 }">
		<div class="ul_wrap">
			<ul>
				<c:if test="${type == null }">
					<c:forEach items="${videoList}" var="videoItem" varStatus="index" begin="0" end="2" step="1"  >
						<li>
							<video  
							class="video-js vjs-default-skin label_tip myVideo" 
							x5-playsinline=""
							x5-video-player-type='h5'
							x5-video-player-fullscreen="true"
							x5-video-ignore-metadata='true'
							x5-video-orientation="portraint|landscape"
							x-webkit-airplay="allow"
							controls
							controlslist=”nofullscreen“
							preload="none"
							poster="<c:if test="${videoItem.faceThumb != null }">${videoItem.faceThumb}</c:if>
							<c:if test="${videoItem.faceThumb == null }">${ctxStatic }/images/main-video-con.png</c:if>" data-setup="{}">
							    <source src="<fnz:image value="${videoItem.learnAttachment.url }"/>" type="video/mp4" />
			  				</video>
							<span>${videoItem.title}</span>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${type != null }">
					<c:forEach items="${videoList}" var="videoItem" varStatus="index"  >
						<li>
							<video  
							class="video-js vjs-default-skin label_tip myVideo" 
							x5-playsinline="" 
							x5-video-player-type='h5'
							x5-video-player-fullscreen="true"
							x5-video-ignore-metadata='true'
							x5-video-orientation="portraint|landscape"
							x-webkit-airplay="allow" 
							controls
							controlslist=”nofullscreen“
							preload="none" 
							poster="<c:if test="${videoItem.faceThumb != null }">${videoItem.faceThumb}</c:if>
							<c:if test="${videoItem.faceThumb == null }">${ctxStatic }/images/main-video-con.png</c:if>" data-setup="{}">
							    <source src="<fnz:image value="${videoItem.learnAttachment.url }"/>" type="video/mp4" />
			  				</video>
							<span>${videoItem.title}</span>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</c:if>
	<c:if test="${type != 2 }">
		<div class="ul_wrap">
			<ul>
				<c:if test="${type == null }"> 
					<c:forEach items="${textList}" var="textItem" varStatus="index" begin="0" end="2" step="1">
						<li>
							<img class="label_tip" src="<c:if test="${!empty textItem.faceThumb}">${textItem.faceThumb}</c:if><c:if test="${empty textItem.faceThumb}">${ctxStatic }/images/main-video-con.png</c:if>" alt="">
							<span><a href="${textItem.thumb}">${textItem.title}</a></span>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${type != null }"> 
					<c:forEach items="${textList}" var="textItem" varStatus="index" >
						<li>
							<img class="label_tip" src="<c:if test="${!empty textItem.faceThumb }">${textItem.faceThumb}</c:if>
							<c:if test="${empty textItem.faceThumb }">${ctxStatic }/images/main-video-con.png</c:if>" alt="">
							<span><a href="${textItem.thumb}">${textItem.title}</a></span>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</c:if>
</div>
</body>
<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/common/rem.js"></script>
<script type="text/javascript" >
	var u = navigator.userAgent;
  	var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1 //android终端
  	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

	function clickBtn(param){

	}
	$(".img").click(function () {
		if(isAndroid){
			// android.clickBtn("1"); 
		}else{
			// clickBtn("1");
		}
	})

	if(isAndroid){
		$(".myVideo").each(function(index,_item){
			_item.addEventListener('play',function(){
		    	$(this).parent("li").addClass("active")

		    })
		    _item.addEventListener('pause',function(){
		    	$(this).parent("li").removeClass("active")
		    })
		    _item.addEventListener('ended',function(){
		    	$(this).parent("li").removeClass("active")
		    })
		})
	}

	function isPlay(){
		// 1播放 0未播放 2开始播放
		$(".myVideo").each(function(_index,_item){
			_item.addEventListener('play',function(){ //开始播放
				android.playStatus('2')
		    })
		    _item.addEventListener('ended',function(){//播放完成
		    	android.playStatus('1')
		    })
		})
	}
	isPlay()

	function isPlayVideo(){
		// 1播放 0未播放 2开始播放
		var flag = true
		$(".myVideo").each(function(_index,_item){
			var _video = document.getElementsByTagName("video")[_index]

			_item.addEventListener('loadstart',function(){ //未播放[开始请求数据]
				_video.pause()
				android.playStatus('0')
		    })
		    _item.addEventListener('progress',function(){ //未播放[正在请求数据]
		    	_video.pause()
				android.playStatus('0')
		    })
			_item.addEventListener('timeupdate',function(){ //播放中
				flag = false
				_video.pause()
				android.playStatus('1')
		    })
		    _item.addEventListener('pause',function(){ //暂停
				_video.pause()
				android.playStatus('0')		    
			})
		})
		if(flag){
			android.playStatus('0')
		}
	}
</script>
</html>
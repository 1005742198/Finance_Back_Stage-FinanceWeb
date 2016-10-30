(function($){
	$(function(){
		//首页轮播
		var oBox=$('.qj-carsousel');
		var oPrev=oBox.find('.qj-carsousel-prev');
		var oNext=oBox.find('.qj-carsousel-next');
		var oUl=oBox.find('.qj-carsousel-pic');
		var aLi=oUl.children();
		var aBtn=oBox.find('ol li');
		var timer=null;

		var iNow=0;		
		oBox.mouseenter(function(){
			oPrev.show();
			oNext.show();
			clearInterval(timer);
		}).mouseleave(function(){
			oPrev.hide();
			oNext.hide();
			timer=setInterval(next,5000);
		});
		
		for(var i=0; i<aBtn.length; i++){
			(function(index){
				aBtn[i].onclick=function(){
					iNow=index;
					commonTab();
				};
			})(i);
		}
		
		function commonTab(){
			for(var i=0; i<aBtn.length; i++){
				aBtn[i].className='';
				startMove(aLi[i],'opacity',0,200);
			}
			aBtn[iNow].className='on';
			startMove(aLi[iNow],'opacity',1,200);
		}

		function next(){
			iNow++;
			if(iNow==aBtn.length)iNow=0;
			commonTab();
		}

		function prev(){
			iNow--;
			if(iNow==-1)iNow=aBtn.length-1;
			commonTab();
		}
		
		oNext.on('click',function(){
			next();
		});
		oPrev.on('click',function(){
			prev();
		});

		//自动播放
		timer=setInterval(next,5000);

		function getStyle(obj,name){
			if(obj.currentStyle){
				return obj.currentStyle[name];
			}else{
				return getComputedStyle(obj,false)[name];
			}
		}

		function startMove(obj,name,iTarget,time){
			
			clearInterval(obj.timer);
			var count=Math.floor(time/30);
			
			var start=parseFloat(getStyle(obj,name));
			
			var dis=iTarget-start;
			
			var n=0; 
			obj.timer=setInterval(function(){
				n++;
				var cur=start+n*dis/count;
				
				if(name=='opacity'){
					obj.style.opacity=cur;
					obj.style.filter='alpha(opacity:'+cur*100+')';
				}else{
					obj.style[name]=cur+'px';	
				}
				
				if(n==count){
					clearInterval(obj.timer);
				}
			},30);
		}

		if (!($.browser.msie && ($.browser.version == "6.0") )) { 
			//表格固定
			$(".tablefixed").each(function(){
				$(this).freezeHeader({ 'height': '213px' });
			})
		} 


		//文字滚动
		var scrollArgs = {
	 	 	speed:20,
	 	 	autoStart:false,
	 	 	lineHeight:31,
	 	  	scrollObjId:"scrollContent"
	 	};

	   	if($('#scrollContent li').length>5){
	   		var scroll = new HJ.ui.ScrollText(scrollArgs);
	   		scroll.start();	
	   	}	 		

	 	//tab切换
	 	var tab = new HJ.ui.TabSwitch({
			tabBox:'.tab-wrap',
			eventType:'hover',
			prevBtn:'prev-btn',
			nextBtn:'next-btn'
		});	
	});

})(jQuery);


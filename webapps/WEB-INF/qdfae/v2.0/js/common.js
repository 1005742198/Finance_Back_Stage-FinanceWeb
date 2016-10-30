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

		if(oBox.length){
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
					$(aLi[i]).hide();
				}

				aBtn[iNow].className='on';
				$(aLi[iNow]).show();	
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
		}
		

	 	//tab切换
	 	var tab = new HJ.ui.TabSwitch({
			tabBox:'.tab-wrap',
			eventType:'click',
			displayMode:'fade'
		});	

	 	//hover
	 	function hoverEvent1(sel){
	 		$(sel).on('hover',function(){
	 			$(sel).removeClass('active');
	 			$(this).addClass('active');
	 		})
	 	}
	 	function hoverEvent2(sel){
	 		$(sel).on('mouseenter',function(){
				$(this).addClass('active');
			}).on('mouseleave',function(){
				$(this).removeClass('active');
			})
	 	}

		//截字
		function subStr(str,len,hasDot){
			var cnReg=/[\u4e00-\u9fa5]/g; 
			var newStr=''; 
			var newLen=0; 
			var allLen=str.replace(cnReg,'**').length; 
			for(var i=0; i<str.length; i++){
				if(cnReg.test(str.charAt(i))){ 
					newLen+=2;
				}else{ 
					newLen+=1;
				}
				newStr+=str.charAt(i); 
				if(newLen>=len){ 
					break;
				}
			}
			if(hasDot && allLen>len){ 
				newStr+='...';
			}
			return newStr;
		}

		$('.dynamics-details p').each(function(){
			var _this=this;
			$(this).html(subStr($(_this).html(),60,true))

		})

		hoverEvent1('.dynamics-list1 li')//动态
		hoverEvent1('.dynamics-list2 li')//动态
		hoverEvent2('.service-list li')//服务
		hoverEvent2('.vedio-wrap a')//视频
		
		$('.top-nav .wechat').on('mouseenter',function(){
			$('.wechat-more').show()
		}).on('mouseleave',function(){
			$('.wechat-more').hide()
		})


	});

})(jQuery);


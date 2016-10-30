/**
 * 标签切换
 * @version 1.0
 * @depend jquery.js
**/
var HJ = HJ || {};
HJ.ui = HJ.ui || {};
+(function ($) {
    /**
	 * 标签切换
	 * @param: options {object} 
	    {
			tabBox    	: (string),   //Tab父级盒子
			curTab    	: (int),      //当前Tab id，默认为1
			eventType 	: (string),   //切换Tab的事件，mouseover/click，默认为mouseover
			hoverClass	: (string),   //鼠标悬浮样式class，点击切换时生效 
			autoplay  	: (boolean),  //是否自动播放，默认false
			speed     	: (int),      //播放速度
			nextBtn   	: '',         //向前按钮class
			prevBtn  	: '',         //向前按钮class
			displayMode	: ''		  //效果，默认无
		}
	**/
	var defaults={
		tabBox:'',
		hoverClass:'',
		eventType: "click",
		autoPlay:false,
		speed:2000,
		curTab:0,
		nextBtn:'',
		prevBtn:'',
		displayMode:''
	};
	HJ.ui.TabSwitch=function(options){
		this.options=$.extend({},defaults,options||{});
		this.init();
	};
	HJ.ui.TabSwitch.prototype={
		init:function(){
			this.tabBox=$(this.options.tabBox);
			this.tabNavs=this.tabBox.find('.hj-tabNav');
			this.tabConts=this.tabBox.find('.hj-tabCont');
			this.current=this.options.curTab;
			this.total=this.tabNavs.length;
			var _this=this;
			this.tabNavs.on(this.options.eventType,function(){
				_this.current=$(this).index();
				_this.tab();
			});
						
			this.options.autoPlay && this.auto();
			
			if (this.options.eventType == "click" && this.options.hoverClass != "") {
                this.tabNavs.mouseenter(function () {
                    $(this).addClass(_this.options.hoverClass);
                }).mouseleave(function () {
                    $(this).removeClass(_this.options.hoverClass);
                })
            }
            if (this.options.autoPlay) {
                this.tabNavs.mouseenter(function () {
                    clearInterval(_this.timer);
                }).mouseleave(function () {
                    _this.auto();
                });
            }
			
			if(this.options.nextBtn != ''){
				this.nextBtn=this.tabBox.find('.'+this.options.nextBtn);
				this.prevBtn=this.tabBox.find('.'+this.options.prevBtn);

				this.nextBtn.on('click',function(){
					_this.next();
				});

				this.prevBtn.on('click',function(){
					_this.prev();
				})

			}


		},
		tab:function(){
			var _this=this,
			mode=this.options.displayMode;
			this.tabNavs.removeClass('active').eq(this.current).addClass('active');
			switch(mode){
				case '':
					this.tabConts.removeClass('show').eq(this.current).addClass('show');
					break;
				case 'fade':
					this.tabConts.stop().fadeOut().hide().eq(this.current).stop().fadeIn();
					break;
				case 'slide':
					this.tabConts.stop().slideUp().hide().eq(this.current).stop().slideDown();
					break;
				default:
					break;
			}

		},
		next:function(){
			this.current++;
			if(this.current==this.total)this.current=0;
			this.tab();
		},
		prev:function(){
			this.current--;
			if(this.current==-1)this.current=this.total-1;
			this.tab();
		},
		auto:function(){
            var _this = this;
            this.timer = setInterval(function () {
				_this.prev();
            }, this.options.speed);
		}
		
		
	}
	
})(jQuery);

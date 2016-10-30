/* ========================================================================
 * B-JUI: bjui-extends.js  v1.2
 * -- Modified from dwz.core.js 
 * Copyright 2014 K'naan.
 * Licensed under Apache (http://www.apache.org/licenses/LICENSE-2.0)
 * ======================================================================== */

+function ($) {
    'use strict';
    
    $.fn.extend({
        /**
         * @param {Object} op: {type:GET/POST, url:ajax请求地址, data:ajax请求参数列表, callback:回调函数 }
         */
        ajaxUrl: function(op) {
            var $this = $(this)
            
            $this.trigger(BJUI.eventType.beforeAjaxLoad)
            
            if (op.loadingmask) {
                $this.trigger(BJUI.eventType.ajaxStatus)
            }
            
            $.ajax({
                type     : op.type || 'GET',
                url      : op.url,
                data     : op.data || {},
                cache    : false,
                async    : op.async!=undefined?op.async:true,
                dataType : 'html',
                timeout  : BJUI.ajaxTimeout,
                success  : function(response) {
                    var json = response.toJson(), $ajaxMask = $this.find('> .bjui-ajax-mask'),swfuploadInp=$this.find('.swfupload')
                    if (swfuploadInp.length > 0) { //注意jquery下检查一个元素是否存在必须使用 .length >0 来判断 modified by hj
                    	swfuploadInp.remove();//如果存在，则将其销毁
	                } 
                    
                    if (!json[BJUI.keys.statusCode]) {
                        $this.empty().html(response).append($ajaxMask).initui()
                        if ($.isFunction(op.callback)) op.callback(response)
                    } else {
//                        if (json[BJUI.keys.statusCode] == BJUI.statusCode.error) {
//                            if (json[BJUI.keys.message]) $this.alertmsg('error', json[BJUI.keys.message])
//                            if (!$this.closest('.bjui-layout').length) {
//                                if ($this.closest('.navtab-panel').length) $this.navtab('closeCurrentTab')
//                                else $this.dialog('closeCurrent')
//                            }
//                        } else if (json[BJUI.keys.statusCode] == BJUI.statusCode.timeout) {
//                            if ($this.closest('.bjui-dialog').length) $this.dialog('closeCurrent')
//                            if ($this.closest('.navtab-panel').length) $this.navtab('closeCurrentTab')
//                            
//                            $('body').alertmsg('info', (json[BJUI.keys.message] || BJUI.regional.sessiontimeout))
//                            BJUI.loadLogin()
//                        }
                    	
                    	//modified by hj
                    	switch(json[BJUI.keys.statusCode]) {
                    		case BJUI.statusCode.error:
                    			if (json[BJUI.keys.message]) $this.alertmsg('error', json[BJUI.keys.message])
                    			break;
                    		case BJUI.statusCode.info:
	                			if (json[BJUI.keys.message]) $this.alertmsg('info', json[BJUI.keys.message])
	                			break;
                    		case BJUI.statusCode.warn:
	                			if (json[BJUI.keys.message]) $this.alertmsg('warn', json[BJUI.keys.message])
	                			break;
                    		case BJUI.statusCode.timeout:
                    			if ($this.closest('.bjui-dialog').length) $this.dialog('closeCurrent')
                    			if ($this.closest('.navtab-panel').length) $this.navtab('closeCurrentTab')
                    			$('body').alertmsg('info', (json[BJUI.keys.message] || BJUI.regional.sessiontimeout))
                    			BJUI.loadLogin()
                    			break;
                    	}
                    	if (!$this.closest('.bjui-layout').length) {//modified by hj
                    		if ($this.closest('.bjui-dialog').length) $this.dialog('closeCurrent')
                			if ($this.closest('.navtab-panel').length) $this.navtab('closeCurrentTab')
                    	}
                    	
                    	
                        $ajaxMask.fadeOut('normal', function() {
                            $(this).remove()
                        })
                    }
                },
                error      : function(xhr, ajaxOptions, thrownError) {
                    $this.bjuiajax('ajaxError', xhr, ajaxOptions, thrownError)
                    if (!$this.closest('.bjui-layout').length) {
                        if ($this.closest('.navtab-panel').length) $this.navtab('closeCurrentTab')
                        else $this.dialog('closeCurrent')
                    }
                    $this.trigger('bjui.ajaxError')
                },
                statusCode : {//modified by hj
                	0  : function(xhr, ajaxOptions, thrownError) {
                		$this.alertmsg('error', BJUI.regional.ajaxnosend)
	                },
                    503: function(xhr, ajaxOptions, thrownError) {
	                	$this.alertmsg('error', BJUI.regional.statusCode_503)
                    }
                }
            })
        },
        loadUrl: function(url,data,callback) {
            $(this).ajaxUrl({url:url, data:data, callback:callback})
        },
        doAjax: function(op) {
            var $this = $(this), $target, $ajaxMask
            
            if (!op.url) {
                BJUI.debug('The ajax url is undefined!')
                return
            }
            if (!op.callback) {
                BJUI.debug('The ajax callback is undefined!')
                return
            } else {
                op.callback = op.callback.toFunc()
            }
            if (op.loadingmask) {
                $target = $this.getPageTarget()
                $target.trigger(BJUI.eventType.ajaxStatus)
                $ajaxMask = $target.find('> .bjui-ajax-mask')
            }
            if (!op.type) op.type = 'POST'
            if (!op.dataType) op.dataType = 'json'
            if (!op.cache) op.cache = false
            op.timeout = BJUI.ajaxTimeout
            op.success = function(response) {
            	if($this.data("validator") != undefined) {
            		$this.data("validator").holdSubmit(false);
            	}
                if ($ajaxMask) {
                    if (op.callback) {
                        $.when(op.callback(response)).done(function() {
                            $target.trigger('bjui.ajaxStop')
                        })
                    } else {
                        $target.trigger('bjui.ajaxStop')
                    }
                } else {
                    op.callback(response)
                }
            }
            op.error = op.error || function(xhr, ajaxOptions, thrownError) {
                $this.bjuiajax('ajaxError', xhr, ajaxOptions, thrownError)
                if ($ajaxMask) {
                    $target.trigger('bjui.ajaxError')
                }
            }
            
            op.statusCode = {//modified by hj
            	0  : function(xhr, ajaxOptions, thrownError) {
            		$this.alertmsg('error', BJUI.regional.ajaxnosend)
            	},
            	503: function(xhr, ajaxOptions, thrownError) {
                	$this.alertmsg('error', BJUI.regional.statusCode_503)
            	}
            }
            
            $.ajax(op)
        },
        getPageTarget: function() {
            var $target
            
            if (this.closest('.bjui-layout').length) $target = this.closest('.bjui-layout')
            else if (this.closest('.navtab-panel').length) $target = $.CurrentNavtab
            else $target = $.CurrentDialog
            
            return $target
        },
        resizePageH: function() {
            return this.each(function() {
                if ($(this).closest('.tab-content').length) return
                
                var $box         = $(this),
                    $pageHeader  = $box.find('> .bjui-pageHeader'),
                    $pageContent = $box.find('> .bjui-pageContent'),
                    $pageFooter  = $box.find('> .bjui-pageFooter'),
                    headH        = $pageHeader.outerHeight() || 0,
                    footH        = $pageFooter.outerHeight() || 0
                
                if ($box.hasClass('navtabPage') && $box.is(':hidden')) {
                    $box.show()
                    headH = $pageHeader.outerHeight() || 0
                    footH = $pageFooter.outerHeight() || 0
                    $box.hide()
                }
                if ($pageFooter.css('bottom')) footH += parseInt($pageFooter.css('bottom')) || 0
                if (footH == 0 && $box.hasClass('dialogContent')) footH = 5
                $pageContent.css({top:headH, bottom:footH})
            })
        },
        getMaxIndexObj: function($elements) {
            var zIndex = 0, index = 0
            
            $elements.each(function(i) {
                var newZIndex = parseInt($(this).css('zIndex')) || 1
                
                if (zIndex < newZIndex) {
                    zIndex = newZIndex
                    index  = i
                }
            })
            
            return $elements.eq(index)
        },
        /**
         * 将表单数据转成JSON对象 用法：$(form).serializeJson() Author: K'naan
         */
        serializeJson: function () {
            var o = {}
            var a = this.serializeArray()
            
            $.each(a, function () {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]]
                    }
                    o[this.name].push(this.value || '')
                } else {
                   o[this.name] = this.value || ''
                }
            })
            
            return o
        },
        isTag: function(tn) {
            if (!tn) return false
            if (!$(this).prop('tagName')) return false
            return $(this)[0].tagName.toLowerCase() == tn ? true : false
        },
        /**
         * 判断当前元素是否已经绑定某个事件
         * @param {Object} type
         */
        isBind: function(type) {
            var _events = $(this).data('events')
            return _events && type && _events[type]
        },
        /**
         * 输出firebug日志
         * @param {Object} msg
         */
        log: function(msg) {
            return this.each(function() {
                if (console) console.log('%s: %o', msg, this)
            })
        },
        /**
         * modified by hj
         * post方式打开新页面
         * @param {Object} op{url:请求地址,data:参数列表}
         */
        openPostWindow:function(op){
        	var hideForm =$('<form method="post" action="'+op.url+'" target="_blank" style="display:none;"></form>');
        	for(var key in op.data){
        		var hideInput = $('<input type="hidden" name="'+key+'" value="'+op.data[key]+'" />');
        		hideForm.append(hideInput);  
        	}
        	$('body').append(hideForm);
        	hideForm.trigger("submit").remove();
    	},
		/**
         * modified by hj
         * 截字
         * @param {Object} op{str:需截字段,len:长度,hasDot:是否需要小数点}
         */
    	subStr:function(str,len,hasDot){
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
    })
    
    /**
     * 扩展String方法
     */
    $.extend(String.prototype, {
        isPositiveInteger: function() {
            return (new RegExp(/^[1-9]\d*$/).test(this))
        },
        isInteger: function() {
            return (new RegExp(/^\d+$/).test(this))
        },
        isNumber: function() {
            return (new RegExp(/^([-]{0,1}(\d+)[\.]+(\d+))|([-]{0,1}(\d+))$/).test(this))
        },
        isNormalID: function() {
            return (new RegExp(/^[a-zA-Z][0-9a-zA-Z_-]*$/).test(this))
        },
        includeChinese: function() {
        	return (new RegExp(/[\u4E00-\u9FA5]/).test(this))
        },
        trim: function() {
            return this.replace(/(^\s*)|(\s*$)|\r|\n/g, '')
        },
        startsWith: function (pattern) {
            return this.indexOf(pattern) === 0
        },
        endsWith: function(pattern) {
            var d = this.length - pattern.length
            return d >= 0 && this.lastIndexOf(pattern) === d
        },
        replaceSuffix: function(index) {
            return this.replace(/\[[0-9]+\]/,'['+index+']').replaceAll('#index#',index)//modified by hj
        },
        replaceSuffix2: function(index) {
            return this.replace(/\-(i)([0-9]+)$/, '-i'+ index).replaceAll('#index#', index)//modified by hj
        },
        trans: function() {
            return this.replace(/&lt;/g, '<').replace(/&gt;/g,'>').replace(/&quot;/g, '"')
        },
        encodeTXT: function() {
            return (this).replaceAll('&', '&amp;').replaceAll('<','&lt;').replaceAll('>', '&gt;').replaceAll(' ', '&nbsp;')
        },
        replaceAll: function(os, ns) {
            return this.replace(new RegExp(os,'gm'), ns)
        },
        /*替换占位符为对应选择器的值*/ //{^(.|\#)[A-Za-z0-9_-\s]*}
        replacePlh: function($box) {
            $box = $box || $(document)
            return this.replace(/{\/?[^}]*}/g, function($1) {
                var $input = $box.find($1.replace(/[{}]+/g, ''))
                
                return $input && $input.val() ? $input.val() : $1
            })
        },
        replaceMsg: function(holder) {
            return this.replace(new RegExp('({.*})', 'g'), holder)
        },
        replaceTm: function($data) {
            if (!$data) return this
            
            return this.replace(RegExp('({[A-Za-z_]+[A-Za-z0-9_-]*})','g'), function($1) {
                return $data[$1.replace(/[{}]+/g, '')]
            })
        },
        replaceTmById: function(_box) {
            var $parent = _box || $(document)
            
            return this.replace(RegExp('({[A-Za-z_]+[A-Za-z0-9_-]*})','g'), function($1) {
                var $input = $parent.find('#'+ $1.replace(/[{}]+/g, ''))
                return $input.val() ? $input.val() : $1
            })
        },
        isFinishedTm: function() {
            return !(new RegExp('{\/?[^}]*}').test(this))
        },
        skipChar: function(ch) {
            if (!this || this.length===0) return ''
            if (this.charAt(0)===ch) return this.substring(1).skipChar(ch)
            return this
        },
        isValidPwd: function() {
            return (new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this))
        },
        isValidMail: function() {
            return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(this.trim()))
        },
        isSpaces: function() {
            for (var i = 0; i < this.length; i += 1) {
                var ch = this.charAt(i)
                
                if (ch!=' '&& ch!='\n' && ch!='\t' && ch!='\r') return false
            }
            return true
        },
        isPhone:function() {
            return (new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/).test(this))
        },
        isUrl:function() {
            return (new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/).test(this))
        },
        isExternalUrl:function() {
            return this.isUrl() && this.indexOf('://'+ document.domain) == -1
        },
        toBool: function() {
            return (this.toLowerCase() === 'true') ? true : false
        },
        toJson: function() {
            var json = this
            
            try {
                if (typeof json == 'object') json = json.toString()
                if (!json.trim().match("^\{(.+:.+,*){1,}\}$")) return this
                else return JSON.parse(this)
            } catch (e) {
                return this
            }
        },
        toObj: function() {
            var obj = null
            
            try {
                obj = (new Function('return '+ this))()
            } catch (e) {
                obj = this
                BJUI.debug('String toObj：Parse "String" to "Object" error! Your str is: '+ this)
            }
            return obj
        },
        /**
         * String to Function
         * 参数(方法字符串或方法名)： 'function(){...}' 或 'getName' 或 'USER.getName' 均可
         * Author: K'naan
         */
        toFunc: function() {
            if (!this || !this.length) return undefined
            
            if (this.startsWith('function')) {
                return (new Function('return '+ this))()
            }
            
            try {
                var m_arr = this.split('.'), fn = window
                
                for (var i = 0; i < m_arr.length; i++) {
                    fn = fn[m_arr[i]]
                }
                
                if (typeof fn === 'function') {
                    return fn
                }
            } catch (e) {
                return undefined
            }
        },
        setUrlParam: function(key, value) {
            var str = '', url = this
            
            if (url.indexOf('?') != -1)
                str = url.substr(url.indexOf('?') + 1)
            else
                return url + '?' + key + '=' + value
            
            var returnurl = '', setparam = '', arr, modify = '0'
            
            if (str.indexOf('&') != -1) {
                arr = str.split('&')
                
                for (var i in arr) {
                    if (arr[i].split('=')[0] == key) {
                        setparam = value
                        modify = '1'
                    } else {
                        setparam = arr[i].split('=')[1]
                    }
                    returnurl = returnurl + arr[i].split('=')[0] + '=' + setparam + '&'
                }
                
                returnurl = returnurl.substr(0, returnurl.length - 1)
                if (modify == '0') {
                    if (returnurl == str)
                        returnurl = returnurl + '&' + key + '=' + value
                }   
            } else {
                if (str.indexOf('=') != -1) {
                    arr = str.split('=')
                    if (arr[0] == key) {
                        setparam = value
                        modify = '1'
                    } else {
                        setparam = arr[1]
                    }
                    returnurl = arr[0] + '=' + setparam
                    if (modify == '0') {
                        if (returnurl == str)
                            returnurl = returnurl + '&' + key + '=' + value
                    }
                } else {
                    returnurl = key + '=' + value
                }
            }
            return url.substr(0, url.indexOf('?')) + '?' + returnurl
        }
    })
    
    /* Function */
    $.extend(Function.prototype, {
        //to fixed String.prototype -> toFunc
        toFunc: function() {
            return this
        }
    })
    
    /* Array */
    $.extend(Array.prototype, {
        remove: function(index) {
            if (index < 0) return this
            else return this.slice(0, index).concat(this.slice(index + 1, this.length))
        },
        unique: function() {
            var temp = new Array()
            
            this.sort()
            for (var i = 0; i < this.length; i++) {
                if (this[i] == this[i + 1]) continue
                temp[temp.length] = this[i]
            }
            
            return temp
        },
        myIndexOf: function(e) {
            if (!this || !this.length) return -1
            
            for (var i = 0, j; j = this[i]; i++) {
                if (j == e) return i
            }
            
            return -1
        },
        /* serializeArray to json */
        toJson: function() {
            var o = {}
            var a = this
            
            $.each(a, function () {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]]
                    }
                    o[this.name].push(this.value || '')
                } else {
                   o[this.name] = this.value || ''
                }
            })
            
            return o
        }
    })
    
    /* Global */
    $.isJson = function(obj) {
        var flag = true
        
        try {
            flag = $.parseJSON(obj)
        } catch (e) {
            return false
        }
        return flag ? true : false
    }
	//是否安装了flash插件modified by hj
	$.hasFlash = (function() {
		var hasFlash = 0,
			flashVersion=0;
		if(document.all) { 
			var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash'); 
			if(swf) { 
				hasFlash = 1; 
				VSwf = swf.GetVariable("$version"); 
				flashVersion = parseInt(VSwf.split(" ")[1].split(",")[0]); 
			} 
		} else { 
			if(navigator.plugins && navigator.plugins.length > 0) { 
				var swf = navigator.plugins["Shockwave Flash"]; 
				if(swf) { 
					hasFlash = 1; 
					var words = swf.description.split(" "); 
					for(var i = 0; i < words.length; ++i) { 
						if(isNaN(parseInt(words[i]))) continue; 
						flashVersion = parseInt(words[i]); 
					} 
				} 
			} 
		}
		return { 
			f: hasFlash, 
			v: flashVersion 
		}; 
    })()
    //数字转大写modified by hj
    $.digitUppercase = function(n) {  
	    var fraction = ['角', '分'];  
	    var digit = [  
	        '零', '壹', '贰', '叁', '肆',  
	        '伍', '陆', '柒', '捌', '玖'  
	    ];  
	    var unit = [  
	        ['元', '万', '亿','兆'],  
	        ['', '拾', '佰', '仟']  
	    ];  
	    var head = n < 0 ? '负' : '';var flow = n;  
	    n = Math.abs(n);  
	    var s = ''; 
	    var part = String(n).split("."); 
	    for (var i = 0; i < fraction.length; i++) {
	    	if(part[1]){
		    	var perchar=String(part[1]).charAt(i)?String(part[1]).charAt(i):0;
		    	s += (digit[perchar] + fraction[i]).replace(/零./, '');			    		
	    	}
	        //s += (digit[Math.round(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');  
	    }  
	    s = s || '整';  
	    n = Math.floor(n);  
	    for (var i = 0; i < unit[0].length && n > 0; i++) {  
	        var p = '';  
	        for (var j = 0; j < unit[1].length && n > 0; j++) {  
	            p = digit[n % 10] + unit[1][j] + p;  
	            n = Math.floor(n / 10);  
	        }  
	        s = p.replace(/(零.)*零$/, '').replace(/^$/, '零') + unit[0][i] + s;  
	    }  
	    if(flow > 100000000000000){
	        return '--'; 
	    }else{
	        return head + s.replace(/(零.)*零元/, '元')  
	        .replace(/(零.)+/g, '零')  
	        .replace(/^整$/, '零元整'); 
	    }   
	};
	    
}(jQuery);
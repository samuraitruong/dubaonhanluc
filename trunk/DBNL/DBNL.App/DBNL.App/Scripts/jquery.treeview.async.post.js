/*
 * Async Treeview 0.1 - Lazy-loading extension for Treeview
 * 
 * http://bassistance.de/jquery-plugins/jquery-plugin-treeview/
 *
 * Copyright (c) 2007 Jörn Zaefferer
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * Revision: $Id$
 *
 */

;(function($) {

function load(settings, root, child, container) {
//	$.getJSON(settings.url, {root: root}, function(response) {
//		function createNode(parent) {
//			var current = $("<li/>").attr("id", this.id || "").html("<span>" + this.text + "</span>").appendTo(parent);
//			if (this.classes) {
//				current.children("span").addClass(this.classes);
//			}
//			if (this.expanded) {
//				current.addClass("open");
//			}
//			if (this.hasChildren || this.children && this.children.length) {
//				var branch = $("<ul/>").appendTo(current);
//				if (this.hasChildren) {
//					current.addClass("hasChildren");
//					createNode.call({
//						text:"placeholder",
//						id:"placeholder",
//						children:[]
//					}, branch);
//				}
//				if (this.children && this.children.length) {
//					$.each(this.children, createNode, [branch])
//				}
//			}
//		}
//		$.each(response, createNode, [child]);
//        $(container).treeview({add: child});
 //   });
        function createNode(parent){
                    var url = this.url;
                    
                    var current = (url != null && url!= "")?$("<li/>").attr("id", this.id || "").html("<a target='_blank' href='" + url + "'>" + this.text + "</a>").appendTo(parent):$("<li/>").attr("id", this.id || "").html("<span>" + this.text + "</span>").appendTo(parent);

                    if (!this.hasChildren) {
                            current.unbind("click").bind('click', settings.nodeClick);
                            }
        			if (this.classes) {
        				current.children("span").addClass(this.classes);
                        current.children("a").addClass(this.classes);
        			}
        			if (this.expanded) {
        				current.addClass("open");
        			}
        			if (this.hasChildren || this.children && this.children.length) {
        				var branch = $("<ul/>").appendTo(current);
        				if (this.hasChildren) {
        					current.addClass("hasChildren");
        					createNode.call({
        						text:"placeholder",
        						id:"placeholder",
        						children:[]
        					}, branch);
        				}
        				if (this.children && this.children.length) {
        					$.each(this.children, createNode, [branch])
        				}
        			}
                 }
                 
         $.ajax($.extend(true, {
             url:settings.url, 
             type:'POST',
             contentType:'application/x-www-form-urlencoded; charset=utf-8',
             dataType:"json", 
             data: {Node : root },
             success: function(response){
                 child.empty();
                 $.each(response,createNode, [child]);
                 $(container).treeview({add:child});
             }
        }, settings.ajax));
}

var proxied = $.fn.treeview;

$.fn.treeview = function(settings) {
	if (!settings.url) {
		return proxied.apply(this, arguments);
	}
	var container = this;
	load(settings, "", this, container);
	var userToggle = settings.toggle;
	return proxied.call(this, $.extend({}, settings, {
		collapsed: true,
		toggle: function() {
			var $this = $(this);
			if ($this.hasClass("hasChildren")) {
				var childList = $this.removeClass("hasChildren").find("ul");
				childList.empty();
				load(settings, this.id, childList, container);
			}
			if (userToggle) {
				userToggle.apply(this, arguments);
			}
		}
	}));
};

})(jQuery);
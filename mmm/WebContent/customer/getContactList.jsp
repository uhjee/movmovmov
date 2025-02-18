<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript">

function Pagination(currentPage) {
	console.log('fncGetList에 왔거든여');
	$("#currentPage").val(currentPage);
	console.log($("#currentPage").val());
	$("#plusPage").load("/customer/getContactList",$("#currentPage").serialize());
	
}


$(function(){
	
	$("#searchBtn").on("click", function(){
		var searchCondition = $("#custInqStatCd").val();
		var searchKeyword = $("input[name='searchKeyword']").val();
			Pagination(1);		
			});
		
	
	
	$(".askBody td:nth-child(3)").on("click",function(){
		var articleNo = $(this).parent().find('input[name="articleNo"]').val();
		console.log(articleNo);
		self.location="/customer/getContact?articleNo="+articleNo;	
	});
	
	$('#delBtn').on("click", function(){
		if( $("input[class='chBox']").prop('checked')==true ){
			
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val){
				
				var checkArr = new Array();
				 $("input[class='chBox']:checked").each(function(){
					    checkArr.push($(this).attr("data-articleNo"));
					   });
	
				 console.log(checkArr)
				 
					 $.ajax({
						    url : "/customer/json/deleteContact",
						    type : "post",
						    data : { chbox : checkArr },
						    success : function(result){
						    	if(result==1){
						    		alert('삭제완료')
						    	}else{
						    		alert('삭제실패')
						    	}
						     location.href = "/mypage/mypage?condition=10";
						    }
						  });
			}
		}else{//end of if input checked
			alert("지우려는 내용을 체크해주세요")	
			
			
		}
	
		
	});
	
	$("button[name='ask']").on("click", function(){
		self.location="/customer/getAskList";
	});
	
	$("button[name='notice']").on("click", function(){
		self.location="/customer/getNoticeList";
	});
	
	$("#inqBtn").on("click", function(){
		self.location="/customer/addContact";
	});
});




</script>
<style type="text/css">


.page-item.active .page-link {
    z-index: 1;
    color: #4e4c4c;
    background-color: #fee00e;
    border-color: #d6cece;
}

h2.tit{
box-sizing: border-box;
margin: 0;
padding: 0 0 26px 0;
font-size: 1.8666em;
font-weight: 400;
letter-spacing: -1px;
line-height: 1.1;
color: #222;
}



h1, h2, h3, h4, h5, h6 {
    margin: 0;
    padding: 0;
    font-weight: 400;
}

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.tab-block {
    position: relative;
}

.tab-block:before {
    content: '';
    position: absolute;
    left: 0;
    top: 35px;
    width: 100%;
    height: 1px;
    background-color: #d8d9db;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.tab-block ul:after, .tab-block ul:before {
    content: '';
    display: table;
}
.tab-block ul:after {
    clear: both;
}

.tab-block ul li.hover:first-child, .tab-block ul li.on:first-child {
    border-color: #555;
}
.tab-block ul li.hover, .tab-block ul li.on {
    border-color: #555;
}
.tab-block ul li:first-child, .tab-block ul li:nth-child(6) {
    border-left: 1px solid #d8d9db;
}
.tab-block ul li {
    position: relative;
    float: left;
    width: 20%;
    border: 1px solid #d8d9db;
    border-left: 0;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

ul {
    list-style-type: disc;
}
.tab-block ul li.hover .btn, .tab-block ul li.on .btn {
    color: #fff;
    background-color: #555;
}
.tab-block ul li .btn {
    display: block;
    width: 100%;
    height: 34px;
    margin: 0;
    padding: 0;
    border: 0;
    line-height: 34px;
    text-align: center;
    background-color: transparent;
    text-decoration: none;
}

a {
    background-color: transparent;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

li.on:first-child {
    border-color: #555;
}

.tab-block ul li:last-child {
    border-right: 1px solid #d8d9db;
}

.tab-block ul li:last-child {
    border-right: 1px solid #d8d9db;
}

.mypage-infomation {
    position: relative;
    min-height: 36px;
    padding-bottom: 10px;
}
.mt20 {
    margin-top: 20px!important;
}

.mb20 {
    margin-bottom: 20px!important;
}


.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.mypage-infomation .btn-group {
    position: absolute;
    top: 0;
    right: 0;
    padding: 0;
    margin: 0;
}
.btn-group.right {
    text-align: right;
}
    padding: 20px 0 30px 0;
    margin: 0;
    text-align: center;
}

div {
    display: block;
}
group:before {
    content: '';
    display: table;
}

a.button:active, a.button:focus, a.button:hover, a.button:visited {
    color: #000000;
    background-color: #fee50e;
}
.btn-group .button {
    margin: 0;
}
a.button {
    text-decoration: none;
}

a:link {
    color: #444;
    text-decoration: none;
}
.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #000000;
    font-weight: 400;
    border-radius: 4px;
    text-decoration: none;
    border: 1px solid #d6cece;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}



.btn-group:after {
    clear: both;
}
.btn-group:after, .btn-group:before {
    content: '';
    display: table;
}
.mypage-infomation+.board-list-util {
    padding: 0;
    margin: 0;
}
.mb10 {
    margin-bottom: 10px!important;
}
.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}

html {
    -webkit-text-size-adjust: 100%;
    color: -internal-root-color;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}
.board-list-util:after {
    clear: both;
}

.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    line-height: 1.1;
    vertical-align: top;
}

user agent stylesheet
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

user agent stylesheet
strong {
    font-weight: bold;
}

.board-list-util .result-count b {
    color: #01738b;
}

b, strong {
    font-weight: 700;
}

user agent stylesheet
b {
    font-weight: bold;
}
user agent stylesheet
strong {
    font-weight: bold;
}

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: auto;
    height: 36px;
}
.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 220px;
}
.bootstrap-select:not(.input-group-btn), .bootstrap-select[class*=col-] {
    float: none;
    display: inline-block;
    margin-left: 0;
}
.bootstrap-select {
    height: 36px;
    vertical-align: middle;
}

.dropdown, .dropup {
    position: relative;
}

.board-list-util select {
    display: inline-block;
    vertical-align: middle;
    width: 150px;
    height: 36px;
    border: 1px solid #d8d9db;
    border-radius: 3px;
    padding: 0 5px;
    margin-right: 7px;
}
.bootstrap-select .selectpicker, .bootstrap-select select {
    height: 100%;
}
.bootstrap-select>select {
    position: absolute!important;
    bottom: 0;
    left: 50%;
    display: block!important;
    width: .5px!important;
    height: 100%!important;
    padding: 0!important;
    opacity: 0!important;
    border: none;
    z-index: 0!important;
}
select {
    height: 36px;
    padding-left: 4px;
    border-color: #ccc;
    border-radius: 4px;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

user agent stylesheet
select:not(:-internal-list-box) {
    overflow: visible !important;
}
user agent stylesheet
z
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    background-color: -internal-light-dark-color(white, black);
    cursor: default;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-radius: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
}

.bootstrap-select>.dropdown-toggle.bs-placeholder, .bootstrap-select>.dropdown-toggle.bs-placeholder:active, .bootstrap-select>.dropdown-toggle.bs-placeholder:focus, .bootstrap-select>.dropdown-toggle.bs-placeholder:hover {
    color: #999;
}
.bootstrap-select>.dropdown-toggle {
    height: 100%;
    margin: 0;
    padding: 0 30px 0 9px;
    border: 1px solid #666;
    border-radius: 4px;
    background-color: #fff;
}
.bootstrap-select>.dropdown-toggle {
    position: relative;
    width: 100%;
    text-align: right;
    white-space: nowrap;
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}
button {
    cursor: pointer;
    letter-spacing: normal;
    font-weight: 400;
}
button, select {
    text-transform: none;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

user agent stylesheet
button {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: buttonface;
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 4px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}

.bs3.bootstrap-select .dropdown-toggle .filter-option {
    padding-right: 0;
}
.bs3.bootstrap-select .dropdown-toggle .filter-option {
    padding-right: inherit;
}
.bootstrap-select .dropdown-toggle .filter-option {
    position: static;
    top: 0;
    left: 0;
    float: left;
    height: 100%;
    width: 100%;
    text-align: left;
    overflow: hidden;
    -webkit-box-flex: 0;
    -webkit-flex: 0 1 auto;
    -ms-flex: 0 1 auto;
    flex: 0 1 auto;
}

.bootstrap-select>.dropdown-toggle.bs-placeholder, .bootstrap-select>.dropdown-toggle.bs-placeholder:active, .bootstrap-select>.dropdown-toggle.bs-placeholder:focus, .bootstrap-select>.dropdown-toggle.bs-placeholder:hover {
    color: #999;
}
.bootstrap-select>.dropdown-toggle {
    position: relative;
    width: 100%;
    text-align: right;
    white-space: nowrap;
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
}

button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}
user agent stylesheet
button {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: center;
    cursor: default;
    font: 400 13.3333px Arial;
}

.bootstrap-select .filter-option .filter-option-inner {
    height: 100%;
}

.bootstrap-select .dropdown-toggle .filter-option {
    position: static;
    top: 0;
    left: 0;
    float: left;
    height: 100%;
    width: 100%;
    text-align: left;
    overflow: hidden;
    -webkit-box-flex: 0;
    -webkit-flex: 0 1 auto;
    -ms-flex: 0 1 auto;
    flex: 0 1 auto;
}
.bootstrap-select>.dropdown-toggle.bs-placeholder, .bootstrap-select>.dropdown-toggle.bs-placeholder:active, .bootstrap-select>.dropdown-toggle.bs-placeholder:focus, .bootstrap-select>.dropdown-toggle.bs-placeholder:hover {
    color: #999;
}
.bootstrap-select>.dropdown-toggle {
    position: relative;
    width: 100%;
    text-align: right;
    white-space: nowrap;
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
}

button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}
user agent stylesheet
button {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: center;
    cursor: default;
    font: 400 13.3333px Arial;
}
.bootstrap-select .filter-option .filter-option-inner .filter-option-inner-inner {
    height: 100%;
    line-height: 34px;
}
.bootstrap-select .dropdown-toggle .filter-option-inner-inner {
    overflow: hidden;
}

.bootstrap-select .dropdown-toggle .filter-option {
    position: static;
    top: 0;
    left: 0;
    float: left;
    height: 100%;
    width: 100%;
    text-align: left;
    overflow: hidden;
    -webkit-box-flex: 0;
    -webkit-flex: 0 1 auto;
    -ms-flex: 0 1 auto;
    flex: 0 1 auto;
}
.bootstrap-select>.dropdown-toggle.bs-placeholder, .bootstrap-select>.dropdown-toggle.bs-placeholder:active, .bootstrap-select>.dropdown-toggle.bs-placeholder:focus, .bootstrap-select>.dropdown-toggle.bs-placeholder:hover {
    color: #999;
}
.bootstrap-select>.dropdown-toggle {
    position: relative;
    width: 100%;
    text-align: right;
    white-space: nowrap;
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}
user agent stylesheet
button {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: center;
    cursor: default;
    font: 400 13.3333px Arial;
}

.bootstrap-select>.dropdown-toggle.bs-placeholder, .bootstrap-select>.dropdown-toggle.bs-placeholder:active, .bootstrap-select>.dropdown-toggle.bs-placeholder:focus, .bootstrap-select>.dropdown-toggle.bs-placeholder:hover {
    color: #999;
}


.bootstrap-select .dropdown-toggle .caret {
    display: block;
    position: absolute;
    top: 50%;
    right: 12px;
    width: 10px;
    height: 5px;
    margin-top: -2px;
    margin-left: 2px;
    vertical-align: middle;
    border-top: 0;
    border-right: 0;
    border-left: 0;
    border-bottom: 0;
    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-select-arr.png) no-repeat 0 0;
}
.bootstrap-select .dropdown-toggle .caret {
    position: absolute;
    top: 50%;
    right: 12px;
    margin-top: -2px;
    vertical-align: middle;
}
.caret {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    border-top: 4px dashed;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;
}

.bootstrap-select>.dropdown-toggle.bs-placeholder, .bootstrap-select>.dropdown-toggle.bs-placeholder:active, .bootstrap-select>.dropdown-toggle.bs-placeholder:focus, .bootstrap-select>.dropdown-toggle.bs-placeholder:hover {
    color: #999;
}
.bootstrap-select>.dropdown-toggle {
    position: relative;
    width: 100%;
    text-align: right;
    white-space: nowrap;
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-bet
    
  }
  
  .bootstrap-select .dropdown-menu {
    min-width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.dropdown-menu {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 40;
    float: left;
    min-width: 100px;
    max-width: 200px;
    margin: 0;
    padding: 0;
    font-size: 1em;
    text-align: left;
    list-style: none;
    background-color: #fff;
    border: 1px solid #666;
    border: 1px solid #666;
    border-radius: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.dropdown-menu {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 40;
    float: left;
    min-width: 100px;
    max-width: 200px;
    margin: 0;
    padding: 0;
    font-size: 1em;
    text-align: left;
    list-style: none;
    background-color: #fff;
    border: 1px solid #666;
    border: 1px solid #666;
    border-radius: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}
.bootstrap-select .dropdown-menu.inner {
    position: static;
    float: none;
    border: 0;
    padding: 0;
    margin: 0;
    border-radius: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
.bootstrap-select .dropdown-menu {
    min-width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.open>.dropdown-menu {
    display: block;
}
.dropdown-menu {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 40;
    float: left;
    min-width: 100px;
    max-width: 200px;
    margin: 0;
    padding: 0;
    font-size: 1em;
    text-align: left;
    list-style: none;
    background-color: #fff;
    border: 1px solid #666;
    border: 1px solid #666;
    border-radius: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.ml07 {
    margin-left: 7px!important;
}
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}

.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}
.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

user agent stylesheet
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}

.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}
.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}

button, select {
    text-transform: none;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

user agent stylesheet
button {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: buttonface;
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
    top : -4px;
}
.a-c {
    text-align: center!important;
}
.board-list {
    line-height: 1.3;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}

table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}

table caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    opacity: 0;
}
* {
    box-sizing: border-box;
}
user agent stylesheet
caption {
    display: table-caption;
    text-align: -webkit-center;
}

.board-list {
    line-height: 1.3;
}
user agent stylesheet
table {
    border-collapse: separate;
    border-spacing: 2px;
}
colgroup {
    display: table-column-group;
}

.board-list {
    line-height: 1.3;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
user agent stylesheet
table {
    border-collapse: separate;
    border-spacing: 2px;
}
col {
    display: table-column;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

.board-list {
    line-height: 1.3;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.board-list>thead>tr>th {
    height: 45px;
    padding: 3px 10px;
    color: #222;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    background-color: #f2f4f5;
}
table td, table th {
    padding: 0;
}

user agent stylesheet
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}
.a-c {
    text-align: center!important;
}
.board-list {
    line-height: 1.3;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
table td, table th {
    padding: 0;
}

user agent stylesheet
td {
    display: table-cell;
    vertical-align: inherit;
}
.pagination {
    clear: both;
    position: relative;
    margin: 0 auto;
    padding: 30px 0 0 0;
    text-align: center;
}
article, aside, figcaption, figure, footer, header, main, nav, section {
    display: block;
}
.modal-layer {

    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 501;
    background-color: rgba(0,0,0,0);
}
article, aside, figcaption, figure, footer, header, main, nav, section {
    display: block;
}

user agent stylesheet
section {
    display: block;
}
.modal-layer .focus {
    display: block;
    position: absolute;
    left: -9999px;
    top: -9999px;
    z-index: 502;
}
a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}

a {
    background-color: transparent;
}


button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}
input[type="hidden" i] {
    display: none;
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}
user agent stylesheet
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
	span.round.on.red {
    border: 2px solid #e71a0f;
    background-color: #e71a0f;
    color: #ffffff;
	}
	
	#delBtn{
	
	width:50px;

    background-color: #f2f4f5;
   
    border: none;

    color:#000000;

    padding: 10px 0;
    
	/* float: right; */
    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

	border-radius:30px;
	}
	
	body{
	font-family: 'Noto Sans KR', sans-serif;
	
	}
	
	#delBtn:hover {
    	background-color: #fee50e;
    
	}
	
	.page-item.active .page-link {
    z-index: 1;
    color: #4e4c4c !important;
    background-color: #fee00e !important;
    border-color: #d6cece !important;
	}

</style>
</head>

<body style="font-size : 16px; line-height : 1.5; letter-spacing: 0;">

<form autocomplete="off">
<div class="container"  style="margin-top : 50px;">
<div id="contents">
	<h2 class="tit"><strong>나의 문의내역</strong></h2>
<!-- 	<div class="tab-block"> -->
<!-- 		<ul> -->
<!-- 			<li data-url="/mypage/myinquiry?cd=INQD01"><a href="#" class="btn" data-cd="INQD01" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li> -->
<!-- 			<li data-url="/mypage/myinquiry?cd=INQD03"><a href="#" class="btn" data-cd="INQD03" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관 문의내역</a></li> -->
<!-- 			<li data-url="/mypage/myinquiry?cd=INQD02"><a href="#" class="btn" data-cd="INQD02" title="분실물 문의내역 탭으로 이동">분실물 문의내역</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->

	<div class="mypage-infomation mt20">
		<ul class="dot-list mb20">
			<li id="tabDesc">  고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
			<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
		</ul>

		<div class="btn-group right">
			<a href="#" class="button" id="inqBtn" title="1:1 문의하기">1:1 문의하기</a>
		</div>
	</div>

	<div class="board-list-util mb10">
		<p class="result-count">
			<!-- to 개발 : 검색을 안한 경우 -->
			<strong>전체 (<b id="totalCnt">${resultPage.totalCount}</b>건)</strong>
		</p>

			
		<select id="custInqStatCd" name="searchCondition">
			<option value="2" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>전체</option>
			<option value="0" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>미답변</option>
			<option value="1" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>답변완료</option>
		</select>
		
		
		<div class="board-search ml07">
			<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." name="searchKeyword" class="input-text" value="">
			<button type="button" class="btn-search-input" id="searchBtn">검색</button>
		</div>
	</div>

	<div class="table-wrap">
		<table class="board-list a-c">
			<caption>번호, 극장, 유형, 제목, 답변상태, 등록일 순서로 보여주는 1:1 문의 내역 표입니다</caption>
			<colgroup>
				<col style="width:40px">
				<col style="width:40px">
				<col style="width:140px;">
				<col style="width:180px;">
				<col style="width:100px;">
			</colgroup>
			<thead>
				<tr>
				    <th scope="col">선택</th>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">답변상태</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody class="askBody">
			  <c:set var="i" value="0" />
			<c:if test="${empty list}"><tr><td colspan="5">조회된 결과가 없습니다</td></tr></c:if>
		  <c:forEach var="notice" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			
			<tr>
					
			  <td  class="col" >
	  	    	 <input type="checkBox" class="chBox" name="chBox" data-articleNo = "${notice.articleNo}" id="" />
	  	    	  <script>
				  $(".chBox").click(function(){
					  $("#allCheck").prop("checked", false);
				  });
			  </script>
			  </td>
			  <td  class="col" >
	  	    	<input type="hidden" name="articleNo" value="${notice.articleNo}"/><kbd>${notice.articleNo}</kbd>
			  </td>
			  
			  <td class="col">  ${notice.articleTitle} 
			  </td>
			  <td class="col" > 
			  <label class="btn btn-secondary btn-sm">
			  
				  <c:if test="${notice.qnaStatus ne null && notice.qnaStatus eq 0}">답변전</c:if>
				  <c:if test="${notice.qnaStatus ne null && notice.qnaStatus eq 1}">답변완료</c:if>
				
				</label>
				</td>
			  <td class="col"  > ${notice.articleDate}
				</td>
			   
			</tr>
          </c:forEach>
			</tbody>

		</table>
	</div>
		<div class=" d-flex justify-content-end">
		<c:if test="${!empty list}">
		<button type="button" id="delBtn" class="">삭제</button>
		</c:if>
		</div>
		
<c:if test="${!empty list}">
	<!-- pagination --> 
	<div class="ticketingPagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4 ">
					  <ul class="pagination d-flex justify-content-center ">
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">«</a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   				 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">«</a>
   							</li>
						</c:if>
						
						<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
							<c:if test="${ resultPage.currentPage == i }">
							    <li class="page-item active" aria-current="page">
      								<a class="page-link" href="javascript:Pagination('${ i }')">${ i }<span class="sr-only">(current)</span></a>
   								 </li>
							</c:if>	
							
							<c:if test="${ resultPage.currentPage != i}">	
								<li class="page-item">
									<a class="page-link" href="javascript:Pagination('${ i }')">${ i }</a>
								</li>
							</c:if>
						</c:forEach>
					     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">						
					    	<li class="page-item disabled">
					    		<a class="page-link" href="#">»</a>
    						</li>
					      </c:if>
					      <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					      	    <li class="page-item">
     							 <a class="page-link" href="javascript:Pagination('${resultPage.endUnitPage+1}') ">»</a>
    							</li>
						 </c:if>	
					  </ul>
					 </div>
					 <div class="col-4"></div>
			  </div>
	<!--// pagination -->
</c:if>
</div>

</div>
</form>


</body>
</html>
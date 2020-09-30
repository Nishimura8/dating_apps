<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>マッチングアプリ</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/css?family=Corben:700 ' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="header_2">
                    <div class="title">destiny</div>
                    <img src="https://xk3otuup.user.webaccel.jp/wp/wp-content/uploads/2020/09/dating1.png" height="50px" alt="">
                    <img src="https://www.omiai-jp.com/omiai/img/global_menu/mypage.svg?1592383735" alt="" class="mypage-mark">
                    <img src="https://www.omiai-jp.com/omiai/img/global_menu/message.svg?1592383735" alt="" class="message-mark">
                </div>
	            <div id="content">
	                ${param.content}
	            </div>
            </div>
        </div>
    </body>
</html>
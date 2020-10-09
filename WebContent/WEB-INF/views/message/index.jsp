<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>メッセージ　一覧</h2>
          <c:forEach var="message" items="${message}">
               <div class="message-list">
                <c:out value="${message.content}"/>       
                ：
                <c:out value="${message.user.name}"/>       
               </div>
         </c:forEach>
        <div id="pagination">
            <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/message/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<form method="POST" action="<c:url value='/message/create' />">
    <label for="name">氏名</label><br />
    <c:out value="${sessionScope.login_user.name}" />
    <br /><br />
    <label for="content">内容</label><br />
    <textarea name="content" rows="10" cols="50"></textarea>
    <br /><br />
    <input type="hidden" name="room_id" value="${room.id}" />
    <input type="hidden" name="_token" value="${_token}" />
    <button type="submit">送信</button>
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h3>会員一覧</h3>
        <div class="content2">
            <c:forEach var="user" items="${users}">
                <div class="user-data">
	                <a href="${pageContext.request.contextPath}/users/show?id=${user.id}">
	                    <img src="<c:url value='${user.image}' />" class="img">
	                </a>
	                <div class="user-information">
		                <div class="user-name">
		                    <c:out value="${user.name}"/>
		                </div>
		                <div class="age">
		                    <c:out value="${user.age}歳"/>
	                    </div>
	                </div>
                </div>
            </c:forEach>
        </div>
        <div id="pagination">
            （全 ${users_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 16) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Список комплектующих</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

<h1>Список комплектующих</h1>

<form action="search">
    <input type="text" name="text"/>
    <input type="submit" value="Найти"/>
</form>

<c:choose>
    <c:when test="${isNecessary == null}">
        Все
        <a href="<c:url value="/parts"><c:param name="isNecessary" value="true"/></c:url>">Необходимые</a>
        <a href="<c:url value="/parts"><c:param name="isNecessary" value="false"/></c:url>">Опциональные</a>
    </c:when>
    <c:when test="${isNecessary == true}">
        <a href="<c:url value="/parts"><c:param name="isNecessary" value=""/></c:url>">Все</a>
        Необходимые
        <a href="<c:url value="/parts"><c:param name="isNecessary" value="false"/></c:url>">Опциональные</a>
    </c:when>
    <c:when test="${isNecessary == false}">
        <a href="<c:url value="/parts"><c:param name="isNecessary" value=""/></c:url>">Все</a>
        <a href="<c:url value="/parts"><c:param name="isNecessary" value="true"/></c:url>">Необходимые</a>
        Опциональные
    </c:when>
</c:choose>

<c:if test="${!empty listParts}">
    <table class="tg">
        <tr>
            <th width="240">Наименование</th>
            <th width="120">Необходим</th>
            <th width="120">Количество</th>
            <th width="120">Редактировать</th>
            <th width="120">Удалить</th>
        </tr>
        <c:forEach items="${listParts}" var="part">
            <tr>
                <td>${part.name}</td>
                <td>
                    <c:choose>
                        <c:when test="${part.necessary == true}">
                            да
                        </c:when>
                        <c:otherwise>
                            нет
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${part.quantity}</td>
                <td><a href="<c:url value='/edit/${part.id}'/>">Редактировать</a></td>
                <td><a href="<c:url value='/remove/${part.id}'/>">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:forEach begin="1" end="${lastPage}" var="i">
    <c:choose>
        <c:when test="${currentPage eq i}">
            <td>${i}</td>
        </c:when>
        <c:otherwise>
            <td>
                <a href="<c:url value="/parts">
                        <c:param name="page" value="${i}"/>
                        <c:param name="isNecessary" value="${isNecessary}"/></c:url>">
                        ${i}
                </a>
            </td>
        </c:otherwise>
    </c:choose>
</c:forEach>

<br>
<br>

Возможно собрать ${noOfComps} компьютера/компьютеров


<h1>Добавить на склад</h1>

<form:form action="/parts/add" modelAttribute="part">
    <table>
        <tr>
            <td>
                <form:label path="name">
                    Наименование
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="necessary">
                    Необходим
                </form:label>
            </td>
            <td>
                <form:checkbox path="necessary"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="quantity">
                    Количество
                </form:label>
            </td>
            <td>
                <form:input path="quantity"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Добавить"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>

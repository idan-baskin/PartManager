<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Результаты поиска</title>

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
<a href="<c:url value="/parts"/>">Нвзад к списку</a>

<br>
<br>

<form action="search">
    <input type="text" name="text"/>
    <input type="submit" value="Найтм"/>
</form>

<h1>Результаты поиска</h1>

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

</body>
</html>

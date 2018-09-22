<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<html>
<head>
    <title>Редактировать</title>
</head>
<body>

<a href="<c:url value="/parts"/>">Нвзад к списку</a>

<h1>Редактирование</h1>

<form:form action="/parts/add" modelAttribute="part">
    <table>
        <tr>
            <td>
                <form:label path="id">
                    id
                </form:label>
            </td>
            <td>
                <form:input path="id" readonly="true" size="8" disabled="true"/>
                <form:hidden path="id"/>
            </td>
        </tr>
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
                <input type="submit" value="Изменить"/>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
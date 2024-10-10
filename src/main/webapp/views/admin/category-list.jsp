<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 10/6/2024
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<a href="${pageContext.request.contextPath}/admin/category/add">Add Category</a>
<table border="1" width="100%">
    <tr>
        <th>STT</th>
        <th>Images</th>
        <th>Category ID</th>
        <th>Category Name</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${listcase}" var="cate" varStatus="STT" >
        <tr>
            <td>${STT.index+1 }</td>
<%--            <c:url value="/image?fname=${cate.image}" var="imgUrl"></c:url>--%>
            <td>
                <c:if test="${cate.images.substring(0, 5) != 'https'}">
                    <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                </c:if>
                <c:if test="${cate.images.substring(0, 5) == 'https'}">
                    <c:url value="${cate.images}" var="imgUrl"></c:url>
                </c:if>
                <img height="200" width="200" src="${imgUrl}" />
            </td>
            <td>${cate.categoryId }</td>
            <td>${cate.categoryname }</td>
            <td>
                <c:if test="${cate.status == 1}">
                    <span>Hoạt động</span>
                </c:if>
                <c:if test="${cate.status != 1}">
                    <span>Khóa</span>
                </c:if>
            </td>
            <td><a
                    href="<c:url value='/admin/category/edit?id=${cate.categoryId }'/>">Sửa</a>  | <a
                    href="<c:url value='/admin/category/delete?id=${cate.categoryId }'/>">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
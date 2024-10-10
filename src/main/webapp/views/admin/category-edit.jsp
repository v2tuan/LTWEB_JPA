<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 10/6/2024
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<form action="${pageContext.request.contextPath}/admin/category/update" method="post" enctype="multipart/form-data">
  <input type="text" id="categoryid" name="categoryid" value="${cate.categoryId}" hidden="hidden"><br>
  <label for="categoryname">Category name:</label><br>
  <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}"><br>
  <label for="image">Image:</label><br>
  <c:if test="${cate.images.substring(0, 5) != 'https'}">
    <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
  </c:if>
  <c:if test="${cate.images.substring(0, 5) == 'https'}">
    <c:url value="${cate.images}" var="imgUrl"></c:url>
  </c:if>
  <img id = "images" height="200" width="200" src="${imgUrl}" />
  <input type="file" onchange="chooseFile(this)" id="image" name="image" value="${cate.images}"><br><br>
  <label for="status">Status:</label><br>
  <input type="text" id="status" name="status" value="${cate.status}"><br><br>
  <input type="submit" value="Submit">
</form>

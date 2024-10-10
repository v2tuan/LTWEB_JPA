<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 10/6/2024
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="${pageContext.request.contextPath}/admin/category/insert" method="post" enctype="multipart/form-data">
  <label for="categoryname">Category name:</label><br>
  <input type="text" id="categoryname" name="categoryname"><br>
  <label for="image">Image:</label><br>
  <img id = "images" height="200" width="200" src="" />
  <input type="file" onchange="chooseFile(this)" id="image" name="image"><br><br>
  <label for="status">Status:</label><br>
  <input type="text" id="status" name="status"><br><br>
  <input type="submit" value="Submit">
</form>

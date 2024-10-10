<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 10/6/2024
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert Video</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .form-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 700px;
    }
    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 24px;
      color: #333;
    }
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #333;
    }
    input[type="text"], select, textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    input[type="file"] {
      display: none; /* Ẩn ô nhập tệp gốc */
    }
    .file-label {
      display: inline-block;
      padding: 10px;
      background-color: #007bff;
      color: white;
      border-radius: 4px;
      cursor: pointer;
      text-align: center;
      margin-bottom: 15px; /* Khoảng cách với các trường khác */
      width: 100%; /* Chiếm 100% chiều rộng */
    }
    #images {
      display: block;
      margin: 0 auto 15px auto; /* Giữa và khoảng cách dưới */
      border: 1px solid #ddd;
      border-radius: 4px;
      max-width: 150px; /* Giới hạn chiều rộng hình ảnh */
      height: auto; /* Tự động điều chỉnh chiều cao */
    }
    .radio-group {
      margin-bottom: 15px;
    }
    .radio-group label {
      font-weight: normal;
      margin-right: 10px;
    }
    input[type="submit"] {
      background-color: #28a745;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
    }
    input[type="submit"]:hover {
      background-color: #218838;
    }
    /* Thiết lập flex cho các hàng nhập liệu */
    .input-group {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15px;
    }
    .input-group > div {
      flex: 1;
      margin-right: 10px; /* Khoảng cách giữa các input */
    }
    .input-group > div:last-child {
      margin-right: 0; /* Không thêm khoảng cách cho input cuối cùng */
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2>Insert Video</h2>
  <form action="${pageContext.request.contextPath}/admin/video/insert" method="post" enctype="multipart/form-data">
    <label for="image">Image:</label>
    <img id="images" height="150" width="150" src="" alt="Preview Image" />
    <label class="file-label" for="image">Chọn tệp</label> <!-- Thêm label cho ô chọn tệp -->
    <input type="file" onchange="chooseFile(this)" id="image" name="image"><br>

    <div class="input-group">
      <div>
        <label for="videoID">Video ID:</label>
        <input type="text" id="videoID" name="videoID">
      </div>
      <div>
        <label for="videoTitle">Video Title:</label>
        <input type="text" id="videoTitle" name="videoTitle">
      </div>
    </div>

    <div class="input-group">
      <div>
        <label for="viewCount">View Count:</label>
        <input type="text" id="viewCount" name="viewCount">
      </div>
      <div>
        <label for="category">Category:</label>
        <select name="category" id="category">
          <c:forEach var="cate" items="${listCate}">
            <option value="${cate.categoryId}">${cate.categoryname}</option>
          </c:forEach>
        </select>
      </div>
    </div>

    <label>Active:</label>
    <div class="radio-group">
      <label>
        <input type="radio" name="active" value="1" checked> Active
      </label>
      <label>
        <input type="radio" name="active" value="0"> Non-active
      </label>
    </div>

    <label>Description:</label>
    <textarea id="description" name="description" rows="4" cols="50" placeholder="Nhập mô tả ở đây"></textarea>

    <input type="submit" value="Submit">
  </form>
</div>
<script>
  function chooseFile(input) {
    const reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('images').src = e.target.result;
    }
    reader.readAsDataURL(input.files[0]);
  }
</script>
</body>
</html>

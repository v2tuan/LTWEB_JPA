<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 10/6/2024
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Video List</title>

    <style>
        /* Thêm kiểu cho nút thêm Category */
        .btn-add {
            display: inline-block;
            padding: 10px 15px;
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
        }

        .btn-add:hover {
            background-color: #218838;
        }

        /* Thêm kiểu cho bảng */
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 16px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }

        .styled-table th, .styled-table td {
            padding: 12px 15px;
        }

        .styled-table tbody tr {
            border-bottom: 1px solid #ddd;
        }

        /* Hiệu ứng hover trên bảng */
        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Kiểu cho hình ảnh */
        .thumbnail {
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .thumbnail:hover {
            transform: scale(1.1);
        }

        /* Kiểu cho trạng thái */
        .status {
            padding: 5px 10px;
            border-radius: 3px;
            font-weight: bold;
        }

        .status.active {
            color: white;
            background-color: #28a745;
        }

        .status.inactive {
            color: white;
            background-color: #dc3545;
        }

        /* Kiểu cho các nút hành động */
        .btn-action {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            font-size: 14px;
        }

        .btn-action:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body>
    <a href="${pageContext.request.contextPath}/admin/video/add" class="btn-add">Add Category</a>
    <table class="styled-table">
    <thead>
    <tr>
        <th>STT</th>
        <th>Video ID</th>
        <th>Image</th>
        <th>Video Title</th>
        <th>Description</th>
        <th>Category</th>
        <th>Active</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="video" varStatus="STT">
        <tr>
            <td>${STT.index+1}</td>
            <td>${video.videoId}</td>
            <td>
                <c:if test="${video.poster.substring(0, 5) != 'https'}">
                    <c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
                </c:if>
                <c:if test="${video.poster.substring(0, 5) == 'https'}">
                    <c:url value="${video.poster}" var="imgUrl"></c:url>
                </c:if>
                <img height="100" width="100" src="${imgUrl}" class="thumbnail" />
            </td>
            <td>${video.title}</td>
            <td>${video.description}</td>
            <td>${video.category.categoryname}</td>
            <td>
                <c:if test="${video.active == 1}">
                    <span class="status active">Hoạt động</span>
                </c:if>
                <c:if test="${video.active != 1}">
                    <span class="status inactive">Khóa</span>
                </c:if>
            </td>
            <td>
                <a href="<c:url value='/admin/video/edit?id=${video.videoId }'/>" class="btn-action">Sửa</a> |
                <a href="<c:url value='/admin/video/delete?id=${video.videoId }'/>" class="btn-action btn-delete">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    </table>

</body>
</html>

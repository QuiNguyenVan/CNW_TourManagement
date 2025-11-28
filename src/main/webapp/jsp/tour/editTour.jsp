<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/jsp/common/header.jsp" />
    <h1>Chỉnh Sửa Tour</h1>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <form id="tourForm" action="${pageContext.request.contextPath}/tours" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${tour.id}">
        Tên: <input type="text" name="name" value="${tour.name}" required><br>
        Mô tả: <textarea name="description" required>${tour.description}</textarea><br>
        Giá: <input type="number" name="price" value="${tour.price}" step="0.01" required><br>
        Ngày Khởi Hành: <input type="date" name="startDate" value="${tour.startDate}" required><br>
        Số lượng khách tối đa:<input type="number" name="capacity" value="20" required>
        URL ảnh: <input type="text" name="imageURL" value="${tour.imageURL}" placeholder="https://example.com/image.jpg"><br>
    
        <input type="submit" value="Cập Nhật">
    </form>
<jsp:include page="/jsp/common/footer.jsp" />
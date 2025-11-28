<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/jsp/common/header.jsp" />

<div class="form-container">
    <h2 style="text-align: center; color: var(--primary);">Thêm Tour Mới</h2>
    
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/tours" method="post">
        <input type="hidden" name="action" value="add">
        
        <label>Tên Tour:</label>
        <input type="text" name="name" placeholder="Ví dụ: Tour Sapa 3 ngày 2 đêm" required>
        
        <label>Mô tả chi tiết:</label>
        <textarea name="description" rows="4" placeholder="Nhập lịch trình, điểm tham quan..." required></textarea>
        
        <label>Giá vé (VND):</label>
        <input type="number" name="price" step="1000" placeholder="0" required>
        
        <label>Ngày khởi hành:</label>
        <input type="date" name="startDate" required>
        
        <label>Số lượng khách tối đa:</label>
		<input type="number" name="capacity" value="20" required>	
		
		<label>URL ảnh tour:</label>
    <input type="text" name="imageURL" placeholder="https://example.com/image.jpg" required>
		
        <input type="submit" value="Thêm Tour">
    </form>
    
    <div style="text-align: center; margin-top: 15px;">
        <a href="${pageContext.request.contextPath}/tours" style="color: var(--secondary);">Quay lại danh sách</a>
    </div>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/jsp/common/header.jsp" />

<div class="form-container">
    <h2 style="text-align: center;">Xác Nhận Đặt Tour</h2>
    
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/bookings" method="post">
        <input type="hidden" name="action" value="book">
        
        <label>Mã Tour (ID):</label>
        <input type="number" name="tourId" value="${param.tourId}" readonly required title="Không thể sửa mã tour">
        
        <label>Họ và Tên:</label>
        <input type="text" name="customerName" placeholder="Nhập họ tên khách hàng" required>
        
        <label>Email liên hệ:</label>
        <input type="email" name="customerEmail" placeholder="example@email.com" required>
        
        <label>Số điện thoại:</label>
        <input type="text" name="customerPhone" placeholder="09xxxxxxxx" required>
        
        <label>Ngày đặt:</label>
        <input type="date" name="bookingDate" required>
        
        <input type="submit" value="Hoàn Tất Đặt Vé">
    </form>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
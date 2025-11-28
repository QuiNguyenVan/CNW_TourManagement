<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${user.role != 'admin'}">
    <c:redirect url="/index.jsp" />
</c:if>

<jsp:include page="/jsp/common/header.jsp" />

<div class="hero" style="background: linear-gradient(135deg, #343a40, #1c1e21); padding: 40px 20px; margin-bottom: 30px;">
    <h1>Admin Dashboard</h1>
    <p>Trung tâm quản lý hệ thống Tour & Booking</p>
</div>

<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; max-width: 1200px; margin: 0 auto 40px;">
    
    <div style="background: white; padding: 25px; border-radius: 8px; box-shadow: var(--shadow); border-left: 5px solid var(--primary);">
        <h3 style="color: var(--primary);">Quản Lý Tour</h3>
        <p style="color: #666; margin: 10px 0;">Xem, thêm mới hoặc chỉnh sửa các tour du lịch hiện có.</p>
        <div style="margin-top: 15px;">
            <a href="${pageContext.request.contextPath}/tours" class="btn-cta" style="font-size: 14px; padding: 8px 15px;">Xem Danh Sách</a>
            <a href="${pageContext.request.contextPath}/jsp/tour/addTour.jsp" class="btn-cta" style="background: white; color: var(--primary); border: 1px solid var(--primary); font-size: 14px; padding: 8px 15px; margin-left: 5px;">+ Thêm Mới</a>
        </div>
    </div>

    <div style="background: white; padding: 25px; border-radius: 8px; box-shadow: var(--shadow); border-left: 5px solid var(--success);">
        <h3 style="color: var(--success);">Đơn Đặt Tour</h3>
        <p style="color: #666; margin: 10px 0;">Xem tất cả các đơn đặt tour từ khách hàng.</p>
        <div style="margin-top: 15px;">
            <a href="${pageContext.request.contextPath}/bookings" class="btn-cta" style="background: var(--success); font-size: 14px; padding: 8px 15px;">Quản Lý Booking</a>
        </div>
    </div>

    <div style="background: white; padding: 25px; border-radius: 8px; box-shadow: var(--shadow); border-left: 5px solid var(--danger);">
        <h3 style="color: var(--danger);">Hệ Thống</h3>
        <p style="color: #666; margin: 10px 0;">Đang đăng nhập với quyền: <strong>ADMIN</strong></p>
        <div style="margin-top: 15px;">
            <a href="${pageContext.request.contextPath}/user?action=logout" class="btn-cta" style="background: var(--danger); font-size: 14px; padding: 8px 15px;">Đăng Xuất</a>
        </div>
    </div>
</div>

<div style="max-width: 1200px; margin: 0 auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: var(--shadow);">
    <h3>Hướng Dẫn Nhanh Cho Admin</h3>
    <ul style="margin-left: 20px; margin-top: 10px; color: #555;">
        <li style="margin-bottom: 8px;">Để <strong>thêm tour</strong>: Nhấn vào nút "Thêm Mới" ở mục Quản Lý Tour. Nhớ nhập đúng số lượng chỗ (Capacity).</li>
        <li style="margin-bottom: 8px;">Để <strong>xem ai đã đặt</strong>: Vào mục "Quản Lý Booking", bạn sẽ thấy danh sách toàn bộ khách hàng.</li>
        <li style="margin-bottom: 8px;">Để <strong>xóa tour</strong>: Vào danh sách tour, nút xóa chỉ hiện thị với Admin.</li>
    </ul>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
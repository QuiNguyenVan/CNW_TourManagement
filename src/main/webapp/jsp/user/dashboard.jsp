<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty user}">
    <c:redirect url="/jsp/user/login.jsp" />
</c:if>

<jsp:include page="/jsp/common/header.jsp" />

<div class="hero" style="padding: 40px 20px; margin-bottom: 30px; background: linear-gradient(135deg, var(--primary), #004494);">
    <h1>Xin Chào, ${user.username}!</h1>
    <p>Chào mừng bạn quay trở lại. Bạn muốn đi đâu hôm nay?</p>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px; max-width: 1200px; margin: 0 auto 50px;">
    
    <div style="background: white; padding: 30px; border-radius: 8px; box-shadow: var(--shadow); text-align: center; border-top: 4px solid var(--primary); transition: transform 0.3s;">
        <h3 style="color: var(--primary); margin-bottom: 15px;">Khám Phá Tour</h3>
        <p style="color: #666; margin-bottom: 25px;">Tìm kiếm những địa điểm du lịch hấp dẫn và đặt chỗ ngay cho kỳ nghỉ sắp tới.</p>
        <a href="${pageContext.request.contextPath}/tours" class="btn-cta" style="font-size: 14px; padding: 10px 25px;">Xem Danh Sách Tour</a>
    </div>

    <div style="background: white; padding: 30px; border-radius: 8px; box-shadow: var(--shadow); text-align: center; border-top: 4px solid var(--success); transition: transform 0.3s;">
        <h3 style="color: var(--success); margin-bottom: 15px;">Tour Của Tôi</h3>
        <p style="color: #666; margin-bottom: 25px;">Xem lại trạng thái các tour đã đặt, lịch sử thanh toán hoặc hủy vé nếu cần.</p>
        <a href="${pageContext.request.contextPath}/bookings" class="btn-cta" style="background-color: var(--success); font-size: 14px; padding: 10px 25px;">Quản Lý Booking</a>
    </div>

    <div style="background: white; padding: 30px; border-radius: 8px; box-shadow: var(--shadow); text-align: center; border-top: 4px solid var(--secondary); transition: transform 0.3s;">
        <h3 style="color: var(--secondary); margin-bottom: 15px;">Tài Khoản</h3>
        <p style="color: #666; margin-bottom: 25px;">Xem thông tin hồ sơ cá nhân của bạn. (Chức năng cập nhật đang phát triển)</p>
        <a href="${pageContext.request.contextPath}/jsp/user/customer.jsp" class="btn-cta" style="background-color: var(--secondary); font-size: 14px; padding: 10px 25px;">Xem Hồ Sơ</a>
    </div>

</div>

<div style="background-color: #e9ecef; border-radius: 8px; padding: 20px; text-align: center; margin-bottom: 40px;">
    <h3>🎁 Ưu đãi đặc biệt</h3>
    <p>Giảm giá 10% cho các tour đặt trước 30 ngày. Mã giảm giá: <strong>EARLYBIRD</strong></p>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/jsp/common/header.jsp" />

    <div class="hero">
        <h1>Khám Phá Thế Giới Cùng Travel Pro</h1>
        <p>Đặt tour dễ dàng, giá cả hợp lý, trải nghiệm tuyệt vời.</p>
        <a href="${pageContext.request.contextPath}/tours" class="btn-cta">Đặt Tour Ngay</a>
    </div>

    <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; text-align: center; margin-top: 40px;">
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: var(--shadow);">
            <h3 style="color: var(--primary);">Giá Tốt Nhất</h3>
            <p>Cam kết giá cạnh tranh nhất thị trường du lịch.</p>
        </div>
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: var(--shadow);">
            <h3 style="color: var(--primary);">Hỗ Trợ 24/7</h3>
            <p>Đội ngũ hỗ trợ luôn sẵn sàng giải đáp mọi thắc mắc.</p>
        </div>
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: var(--shadow);">
            <h3 style="color: var(--primary);">Thanh Toán An Toàn</h3>
            <p>Đa dạng phương thức thanh toán, bảo mật tuyệt đối.</p>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp" />
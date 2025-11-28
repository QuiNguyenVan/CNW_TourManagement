<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/jsp/common/header.jsp" />

<div style="max-width: 1200px; margin: 0 auto;">
    <h2 style="margin-bottom: 20px; border-left: 5px solid var(--primary); padding-left: 15px;">
        <c:if test="${user.role == 'admin'}">Thống Kê Đơn Đặt Tour</c:if>
        <c:if test="${user.role != 'admin'}">Lịch Sử Đặt Tour Của Bạn</c:if>
    </h2>

    <c:if test="${empty bookings}">
        <div style="text-align: center; padding: 50px; background: white; border-radius: 8px;">
            <p>Chưa có dữ liệu đặt tour nào.</p>
        </div>
    </c:if>

    <c:if test="${not empty bookings}">
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Mã BK</th>
                        <th>Tên Tour</th>
                        
                        <c:if test="${user.role == 'admin'}">
                            <th>Tên Khách Hàng</th>
                            <th>Số Điện Thoại</th>
                            <th>Giá Vé</th>
                        </c:if>
                        
                        <th>Ngày Đặt</th>
                        <th>Trạng Thái</th>
                        
                        <c:if test="${user.role != 'admin'}">
                            <th>Hành Động</th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>#${booking.id}</td>
                            <td style="font-weight: bold; color: var(--primary);">${booking.tourName}</td>
                            
                            <c:if test="${user.role == 'admin'}">
                                <td>${booking.customerName}</td>
                                <td>
                                    <a href="tel:${booking.customerPhone}" style="color: #333; text-decoration: none;">
                                        ${booking.customerPhone}
                                    </a>
                                </td>
                                <td style="color: var(--danger); font-weight: bold;">${booking.tourPrice}</td>
                            </c:if>
                            
                            <td>${booking.bookingDate}</td>
                            
                            <td>
                                <span style="padding: 5px 10px; border-radius: 15px; background: #d4edda; color: #155724; font-weight: bold; font-size: 12px;">
                                    ${booking.status}
                                </span>
                            </td>

                            <c:if test="${user.role != 'admin'}">
                                <td>
                                    <form action="${pageContext.request.contextPath}/bookings" method="post">
                                        <input type="hidden" name="action" value="cancel">
                                        <input type="hidden" name="bookingId" value="${booking.id}">
                                        <button type="submit" class="delete-btn" onclick="return confirm('Bạn muốn hủy vé này?')" style="color: var(--danger);">Hủy Vé</button>
                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
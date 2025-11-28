<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/jsp/common/header.jsp" />

<h2>Chi Tiết Tour</h2>

<div class="tour-detail-box">

    <h3 style="color: var(--primary);">${tour.name}</h3>
    <c:if test="${not empty tour.imageURL}">
        <img src="${tour.imageURL}" 
             alt="${tour.name}" 
             style="width: 100%; max-width: 600px; border-radius: 8px; margin-bottom: 15px;">
    </c:if>

    <p><strong>Mô tả:</strong> ${tour.description}</p>

    <p><strong>Giá:</strong> 
        <span style="color: var(--danger); font-weight: bold;">
            ${tour.price} VND
        </span>
    </p>

    <p><strong>Ngày đi:</strong> ${tour.startDate}</p>

    <p><strong>Chỗ còn:</strong>
        <span style="font-weight: bold; color:${tour.availableSlots > 0 ? 'green':'red'};">
            ${tour.availableSlots} / ${tour.capacity}
        </span>
    </p>

    <c:if test="${tour.availableSlots > 0}">
        <a href="${pageContext.request.contextPath}/jsp/booking/bookTour.jsp?tourId=${tour.id}"
           class="btn-nav btn-success"
           style="background: var(--success); color:white;">
           Đặt Tour
        </a>
    </c:if>
</div>

<hr>

<!-- DANH SÁCH REVIEW -->
<h3>Đánh giá từ khách hàng</h3>

<c:forEach var="rv" items="${reviews}">
    <div class="review-item" style="margin-bottom: 12px;">
        <strong>${rv.name}</strong> - 
        <span style="color: orange;">
            ★★★★★
        </span> (${rv.rating}/5)
        <p>${rv.comment}</p>
        <hr>
    </div>
</c:forEach>

<!-- FORM COMMENT -->
<c:if test="${not empty user}">
    <h4>Viết đánh giá của bạn:</h4>

    <form action="${pageContext.request.contextPath}/addReview" method="post">

        <input type="hidden" name="tourId" value="${tour.id}">

        <label>Chọn số sao:</label>
        <select name="rating" required>
            <option value="5">5 sao</option>
            <option value="4">4 sao</option>
            <option value="3">3 sao</option>
            <option value="2">2 sao</option>
            <option value="1">1 sao</option>
        </select>

        <br><br>

        <textarea name="comment" placeholder="Nhập bình luận..." required
                  style="width: 100%; height: 100px;"></textarea>

        <br><br>

        <button class="btn-nav btn-primary">Gửi đánh giá</button>
    </form>
</c:if>

<c:if test="${empty user}">
    <p><a href="${pageContext.request.contextPath}/jsp/user/login.jsp">Đăng nhập để bình luận</a></p>
</c:if>

<jsp:include page="/jsp/common/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/jsp/common/header.jsp" />

<style>
.tour-detail-box {
    border: 1px solid #ddd;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 20px;
    max-width: 800px;
    background-color: #fff;
}

.tour-detail-box img {
    width: 100%;
    max-width: 600px;
    border-radius: 8px;
    margin-bottom: 15px;
}

.tab-buttons {
    margin-top: 20px;
    display: flex;
    justify-content: center; /* căn giữa */
    gap: 10px;
}

.tab-buttons button {
    padding: 6px 16px; /* đủ rộng vừa chữ */
    border: none;
    border-radius: 6px;
    cursor: pointer;
    background-color: #eee;
    font-size: 14px;
    width: auto; /* không kéo full width */
    min-width: 80px; /* nếu muốn tối thiểu */
    transition: 0.2s;
}

.tab-buttons button:hover {
    background-color: #ddd;
}

.tab-buttons button.active {
    background-color: var(--primary);
    color: white;
}

.tab-content {
    margin-top: 15px;
}
.review-item {
    margin-bottom: 12px; 
    border:1px solid #eee; 
    padding:10px; 
    border-radius:6px;
}
</style>

<h2>Chi Tiết Tour</h2>

<div class="tour-detail-box">
    <h3 style="color: var(--primary);">${tour.name}</h3>

    <c:if test="${not empty tour.imageURL}">
        <img src="${tour.imageURL}" alt="${tour.name}">
    </c:if>

    <p><strong>Giá:</strong> 
        <span style="color: var(--danger); font-weight: bold;">${tour.price} VND</span>
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

<!-- TAB CHỌN -->
<div class="tab-buttons">
    <button class="tab-btn active" onclick="showTab('description')">Mô tả</button>
    <button class="tab-btn" onclick="showTab('reviews')">Đánh giá</button>
</div>

<!-- NỘI DUNG TAB -->
<div class="tab-content">
    <div id="description" class="tab-pane">
        <p>${tour.description}</p>
    </div>

    <div id="reviews" class="tab-pane" style="display:none;">
        <c:if test="${not empty reviews}">
            <c:forEach var="rv" items="${reviews}">
                <div class="review-item">
                    <strong>${rv.name}</strong> - 
                    <span style="color: orange;">★★★★★</span> (${rv.rating}/5)
                    <p>${rv.comment}</p>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty reviews}">
            <p>Chưa có đánh giá nào.</p>
        </c:if>

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
    </div>
</div>

<script>
function showTab(tabId) {
    var panes = document.querySelectorAll('.tab-pane');
    panes.forEach(p => p.style.display = 'none');

    var tabs = document.querySelectorAll('.tab-btn');
    tabs.forEach(t => t.classList.remove('active'));

    document.getElementById(tabId).style.display = 'block';
    event.currentTarget.classList.add('active');
}
</script>

<jsp:include page="/jsp/common/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/jsp/common/header.jsp" />

<style>
/* ===== GRID CARD TOUR ===== */
.tour-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(310px, 1fr));
    gap: 20px;
    padding: 20px 0;
}

.tour-card {
    border: 1px solid #ddd;
    border-radius: 12px;
    overflow: hidden;
    background: white;
    transition: 0.2s ease;
}

.tour-card:hover {
    transform: translateY(-4px);
    box-shadow: 0px 6px 12px rgba(0,0,0,0.15);
}

/* ===== IMAGE ===== */
.tour-card img {
    width: 100%;
    height: 190px;
    object-fit: cover;
}

/* ===== INFO ===== */
.tour-card .info {
    padding: 15px;
}

.tour-card .title {
    font-size: 20px;
    font-weight: 700;
    color: var(--primary);
    margin-bottom: 5px;
}

.tour-card .price {
    color: var(--danger);
    font-size: 18px;
    font-weight: bold;
    margin-top: 5px;
}

.tour-card .slots {
    margin-top: 8px;
    font-weight: bold;
    font-size: 15px;
}

/* ===== ACTION BUTTONS ===== */
.tour-card .actions {
    margin-top: 12px;
    display: flex;
    gap: 10px;
}
.actions a, .actions button {
    padding: 8px 15px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    text-decoration: none;
}
</style>

<div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
    <h2>Danh Sách Tour Du Lịch</h2>

    <c:if test="${user.role == 'admin'}">
        <a href="${pageContext.request.contextPath}/jsp/tour/addTour.jsp" 
           class="btn-nav btn-register">+ Thêm Tour</a>
    </c:if>
</div>

<div class="tour-grid">
    <c:forEach var="tour" items="${tours}">
        <div class="tour-card">
            <img src="${tour.imageURL}" alt="Tour image">
            <div class="info">
                <div class="title">${tour.name}</div>

                <div class="price">${tour.price} VND</div>

             <!--   <div style="margin-top:5px; font-size:14px; color:#444; height:45px; overflow:hidden;">
                    ${tour.description}
                </div>  --> 

                <div class="slots" 
                     style="${tour.availableSlots > 0 ? 'color: green;' : 'color: red;'}">
                    Chỗ còn: ${tour.availableSlots} / ${tour.capacity}
                </div>
                <div class="actions">

                    <c:choose>

                        <c:when test="${user.role == 'admin'}">
                            <a href="${pageContext.request.contextPath}/tours?action=edit&id=${tour.id}"
                               style="background:#ffc107; color:#333;">
                                Sửa
                            </a>

                            <form action="${pageContext.request.contextPath}/tours" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${tour.id}">
                                <button type="submit"
                                        onclick="return confirm('Bạn có chắc chắn muốn xóa tour này?')"
                                        style="background: var(--danger); color: white;">
                                    Xóa
                                </button>
                            </form>
                        </c:when>

                        <c:otherwise>
                            <c:choose>

                                <c:when test="${empty user}">
                                    <a href="${pageContext.request.contextPath}/jsp/user/login.jsp"
                                       style="background: var(--secondary); color: white;">
                                        Đăng nhập để đặt
                                    </a>
                                </c:when>

                                <c:when test="${tour.availableSlots <= 0}">
                                    <span style="background:#ccc; color:#555; padding:8px 15px; border-radius:6px;">
                                        Hết chỗ
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/tourDetail?tourId=${tour.id}"
                                       style="background: var(--success); color:white;">
                                        Xem chi tiết
                                    </a>
                                </c:otherwise>

                            </c:choose>
                        </c:otherwise>

                    </c:choose>

                </div>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="/jsp/common/footer.jsp" />

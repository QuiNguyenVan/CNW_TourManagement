<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty user}">
    <c:redirect url="/jsp/user/login.jsp" />
</c:if>

<jsp:include page="/jsp/common/header.jsp" />

<div class="container" style="max-width: 700px; margin: 50px auto; padding: 20px; background: white; border-radius: 8px; box-shadow: var(--shadow);">
    <h2 style="margin-bottom: 30px; text-align: center;">Hồ Sơ Cá Nhân</h2>

 
    <c:if test="${not empty message}">
        <div style="padding: 10px; background-color: #d4edda; color: #155724; border-radius: 4px; margin-bottom: 20px;">
            ${message}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/CustomerServlet" method="post" style="display: flex; flex-direction: column; gap: 20px;">
        <!-- Giữ ID để update -->
        <input type="hidden" name="id" value="${customer.id}" />

        <div>
            <label for="name" style="display:block; margin-bottom:5px;">Họ và Tên:</label>
            <input type="text" id="name" name="name" value="${customer.name}" required 
                style="width: 100%; padding: 10px; border-radius: 4px; border:1px solid #ccc;" />
        </div>

        <div>
            <label for="email" style="display:block; margin-bottom:5px;">Email:</label>
            <input type="email" id="email" name="email" value="${customer.email}" required
                style="width: 100%; padding: 10px; border-radius: 4px; border:1px solid #ccc;" />
        </div>

        <div>
            <label for="phone" style="display:block; margin-bottom:5px;">Số Điện Thoại:</label>
            <input type="text" id="phone" name="phone" value="${customer.phone}" required
                style="width: 100%; padding: 10px; border-radius: 4px; border:1px solid #ccc;" />
        </div>

        <div style="text-align: center;">
            <button type="submit" style="padding: 10px 30px; font-size: 16px; border:none; border-radius: 4px; background-color: var(--primary); color:white; cursor:pointer;">
                Cập Nhật
            </button>
        </div>
       <div style="text-align: center;">
    		<input type="button" value="Quay lại" onclick="location.href='jsp/user/dashboard.jsp'"
          	 style="display: inline-block; width: auto; padding: 6px 14px;">
		</div>

    </form>
</div>

<jsp:include page="/jsp/common/footer.jsp" />

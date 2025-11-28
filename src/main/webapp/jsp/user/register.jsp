<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/jsp/common/header.jsp" />

<div class="form-container">
    <h2 style="text-align: center;">Đăng Ký Tài Khoản</h2>
    
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/user" method="post">
        <input type="hidden" name="action" value="register">
        
        <label>Tên đăng nhập</label>
        <input type="text" name="username" placeholder="Chọn tên đăng nhập" required>
        
        <label>Mật khẩu</label>
        <input type="password" name="password" placeholder="Nhập mật khẩu (tối thiểu 6 ký tự)" required>
        
        <input type="submit" value="Đăng Ký" class="btn-register">
    </form>
    
    <p style="text-align: center; margin-top: 15px;">
        Đã có tài khoản? <a href="${pageContext.request.contextPath}/jsp/user/login.jsp" style="color: var(--primary);">Đăng nhập</a>
    </p>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
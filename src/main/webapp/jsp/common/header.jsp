<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Quản Lý Tour</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
    <header>
        <div class="navbar">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index.jsp">TRAVEL PRO</a>
            </div>
            
            <ul class="nav-menu">
                <li><a href="${pageContext.request.contextPath}/tours">Danh Sách Tour</a></li>
                
                <c:if test="${empty user}">
                    <li><a href="${pageContext.request.contextPath}/jsp/user/login.jsp" class="btn-nav btn-login">Đăng Nhập</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/user/register.jsp" class="btn-nav btn-register">Đăng Ký</a></li>
                </c:if>

                <c:if test="${not empty user}">
                    
                    <c:if test="${user.role == 'admin'}">
                        <li><a href="${pageContext.request.contextPath}/bookings">Quản Lý Booking</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/tour/addTour.jsp" style="color: var(--danger); font-weight: bold;">+ Thêm Tour</a></li>
                    </c:if>

                    <c:if test="${user.role != 'admin'}">
                         <li><a href="${pageContext.request.contextPath}/bookings">Lịch Sử Đặt Vé</a></li>
                    </c:if>

                    <li style="display: flex; align-items: center; gap: 15px; margin-left: 20px;">
                        <span style="font-weight: 500;">Hello, <strong>${user.username}</strong></span>
                        
                        <a href="${pageContext.request.contextPath}/user?action=logout" 
                           class="btn-nav" 
                           style="border: 1px solid var(--danger); color: var(--danger); background: transparent; text-decoration: none; padding: 5px 15px; border-radius: 4px; transition: 0.3s;"
                           onmouseover="this.style.background='var(--danger)'; this.style.color='white';"
                           onmouseout="this.style.background='transparent'; this.style.color='var(--danger)';">
                           Thoát
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </header>
    <main>
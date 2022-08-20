<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- AdminSidebar -->
        
        
<ul
	class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="adminMainpage">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-solid fa-carrot"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			MovieProject <sup>Mo_Bee</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="adminMainpage">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>관리자메인화면</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Member Contents</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>Member</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">회원관리:</h6>
				
<%-- 				<c:choose>
				<c:when test="${sessionScope.loginId == null}">
				<a class="collapse-item" href="memberJoinForm">회원관리</a> 
				<a class="collapse-item" href="memberLoginForm">메뉴2</a>
				</c:when>
				<c:otherwise> --%>
				<a class="collapse-item" href="adminMemberPage">회원정보</a>
				<a class="dropdown-item" href="#" >메뉴2</a>
<%-- 				</c:otherwise>
				</c:choose> --%>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Movie Contents</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span>Movie</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">영화관리:</h6>
				<a class="collapse-item" href="adminMoviePage">영화</a> <a
					class="collapse-item" href="adminTheaterPage">극장</a> <a
					class="collapse-item" href="adminSchedulePage">스케쥴</a>
				<div class="collapse-divider"></div>
<!-- 				<h6 class="collapse-header">Other Pages:</h6>
				<a class="collapse-item" href="sampleTest01Page">커뮤니티 게시판</a> <a
					class="collapse-item" href="sampleTest02Page">영화 이벤트</a>
					 -->
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="charts.html"> <i
			class="fas fa-fw fa-chart-area"></i> <span>도움말</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="tables.html"> <i
			class="fas fa-fw fa-table"></i> <span>일정 모음</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

	<!-- Sidebar Message -->
	<!-- 제거됨 -->

</ul>
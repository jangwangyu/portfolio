<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자페이지</title>

 

    <!-- Custom styles for this template-->
     <link href="/css/admin.css" rel="stylesheet">
     <link href="/css/admin.min.css" rel="stylesheet">
 
       <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
  


</head>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-text mx-3">포트폴리오</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fa-solid fa-chalkboard"></i>
                    <span>게시판 관리</span>
                    <span class=”caret“></span></a>
                    <div id="collapseTwo" class="collapse"   data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판 목록</h6>
                        <a class="collapse-item" href="adminListPage?num=1">이벤트</a>
                        <a class="collapse-item" href="adminNotice">공지사항</a>
                    </div>
                </div>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="MemberList">
                   <i class="fa-solid fa-user"></i>
                    <span>회원 관리</span></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="Orderlist">
                 <i class="fa-solid fa-box"></i>
                    <span>배송 관리</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="adminProductPage">
                 <i class="fa-solid fa-box"></i>
                    <span>상품 관리</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

        </ul>
        <!-- Content -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- admin status -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
                            </a>
                                                        <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
</html>
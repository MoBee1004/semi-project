<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<%@ include file="../include/fontcss.jsp" %>
<style type="text/css">
*{font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        
		<%@ include file="../include/Sidebar.jsp" %>
        
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="../include/Topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">
                        MemberView.jsp
                        </h1>
                    </div>





                    <!-- Content Row -->
                    <div class="container-xl px-4 mt-4">
                        <!-- Account page navigation-->
                        
                      
                        <div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Profile Picture</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <c:if test="${sessionScope.kakao == null}">
                                        <img style="width:100px; height:100px" class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath}/resources/mprofileUpLoad/${sessionScope.loginProfile}" alt="">
                                        </c:if>
                                        <c:if test="${sessionScope.kakao != null}">
                                        <img style="width:100px; height:100px" class="img-account-profile rounded-circle mb-2" src="${sessionScope.loginProfile}" alt="">
                                        </c:if>
                                        <!-- Profile picture help block-->
                                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                        <!-- Profile picture upload button-->
                                        <button class="btn btn-primary" type="button">Upload new image</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">Account Details</div>
                                    <div class="card-body">
                                        <form>
                                            
                                            
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (id)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputFirstName">아이디</label>
                                                    <input class="form-control" id="id" type="text" placeholder="Enter your ID" value="${member.mid}">
                                                </div>
                                                <!-- Form Group (password)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLastName">비밀번호</label>
                                                    <input class="form-control" id="pw" type="password" placeholder="Enter your PASSWORD" value="${member.mpw}">
                                                </div>
                                            </div>
                                            
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">                                    
                                                <!-- Form Group (name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputOrgName">이름</label>
                                                    <input class="form-control" id="name" type="text" placeholder="Enter your NAME" value="${member.mname}">
                                                </div>
                                                <!-- Form Group (birth)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLocation">생년월일</label>
                                                    
                                                    <c:if test="${member.mbirth != null}">
                                                    <input class="form-control" id="birth" type="date" placeholder="Enter your BIRTH" value="${member.mbirth}">
                                                	</c:if>
                                                	 <c:if test="${member.mbirth == null}">
                                                    <input class="form-control" id="birth" type="date" placeholder="Enter your BIRTH" >
                                                	</c:if>
                                                </div>
                                            </div>
                                            
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">이메일</label>
                                                <input class="form-control" id="email" type="email" placeholder="Enter your EMAIL" value="${member.memail}">
                                            </div>
                                            
                                            
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">                                    
                                                <!-- Form Group (post)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputOrgName">우편번호</label>
                                                    <input class="form-control" id="post" type="text" placeholder="Enter your ADDRESS" value="${member.mpost}">
                                                </div>
                                                <!-- Form Group (addraddr)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLocation">주소</label>
                                                    <input class="form-control" id="addr" type="text" placeholder="Enter your ADDRESS" value="${member.maddr}">
                                                </div>
                                            </div>
                                            
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">                                    
                                                <!-- Form Group (daddr)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputOrgName">상세주소</label>
                                                    <input class="form-control" id="daddr" type="text" placeholder="Enter your ADDRESS" value="${member.mdetailaddr}">
                                                </div>
                                                <!-- Form Group (eaddr)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLocation">참고주소</label>
                                                    <input class="form-control" id="exaddr" type="text" placeholder="Enter your ADDRESS" value="${member.mextraaddr}">
                                                </div>
                                            </div>
                                            
                                            <button class="btn btn-primary" type="button">Save changes</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <!-- Content Row -->



                    <!-- Content Row -->


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
 
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <!-- 제거됨 -->

    <!-- Page level custom scripts -->
     <!-- 제거됨 -->

</body>
<script type="text/javascript">


</script>

</html>
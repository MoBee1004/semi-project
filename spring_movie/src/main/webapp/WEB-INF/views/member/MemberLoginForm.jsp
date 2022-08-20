<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        
		<%@ include file="/WEB-INF/views/include/Sidebar.jsp" %>
        
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="/WEB-INF/views/include/Topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">MemberLoginForm.jsp</h1>
                    </div>
                    
                    
                <div  class="row" style="width:800px; margin:auto;">
                   
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Log in !</h1>
                            </div>
                            <form class="user" action="memberLogin" method="post"  onsubmit="return LoginFormCheck()">
                            
                                
                                
                                    <div class="form-group">
                                    
                                    아이디 &nbsp;&nbsp; <span id="idCheckMsg"></span>
                                        <input type="text" class="form-control form-control-user" id="mid" name="mid"
                                            placeholder="아이디를 입력하세요" >
                                            
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                    비밀번호&nbsp;&nbsp; <span id="pwCheckMsg"></span>
                                        <input type="password" class="form-control form-control-user" id="mpw" name="mpw"
                                            placeholder="비밀번호를 입력하세요" >
                                    </div>
                                	
                                                
                                <button  class="btn btn-primary btn-user btn-block" >
                                    로그인
                                </button>
                               
                            </form>
                            <br>
                            <br>
                            <br>
                            <div style="text-align:center;">
                            <a id="kakaoLoginBtn"></a>
                            </div>
                            
                            
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- Content Row -->


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
 <form id="submitForm" action="" method="post">

</form>

</body>
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



<script type="text/javascript">
var loginMsg = '${loginMsg}'
if(loginMsg.length >0){
	alert(loginMsg);
}
	function LoginFormCheck() {

		if ($("#mid").val().length == 0) {
			alert("아이디를 입력해주세요");
			$("#mid").focus();
			return false;
		}

		if ($("#mpw").val().length == 0) {
			alert("비밀번호를 입력해주세요");
			$("#mpw").focus();
			return false;
		}
		
		return true;
	}
	


var checkMsg ='${msg}';
if(checkMsg.length >0){
	alert(checkMsg);
}


	
	
</script>
<!-- 카카오 JavaScript SDK  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 카카오 JavaScript SDK   -->

<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('b97f6706a8c69d9e1a92e4f095ca9d1c');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
</script>

<script type="text/javascript">


Kakao.Auth.createLoginButton({
	  container: '#kakaoLoginBtn',
	  size: 'large',
	  success: function(response) {
		  
	    console.log(response);
	    
	    Kakao.API.request({
	    	  url: '/v2/user/me',
	    	  success: function(response) {
	    	    console.log(response);
	    	    
	    	    console.log(response.id);
	    	    console.log(response.kakao_account.profile.nickname);
	    	    console.log(response.kakao_account.email);
	    	    console.log(response.kakao_account.profile.thumbnail_image_url);
				
				
				
				
				

				$("#submitForm").attr("action", "memberKaKaoLogin?kakaoId="+response.id+"&kakaoNickname="+response.kakao_account.profile.nickname
						+"&kakaoEmail="+response.kakao_account.email+"&kakaoProfile="+response.kakao_account.profile.thumbnail_image_url);

				$("#submitForm").submit();
				
				
				
				
	    	  },
	    	  fail: function(error) {
	    	    console.log(error);
	    	  },
	    	})	      
	    	
	  },	 
	  fail: function(error) {
	    console.log(error);
	  },
	});
	
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/memberJs/daumPostCode.js"></script>

</html>
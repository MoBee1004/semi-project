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
                        <h1 class="h3 mb-0 text-gray-800">MemberJoinForm.jsp</h1>
                    </div>
                    
                    
                <div  class="row" style="width:800px; margin:auto;">
                   
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" action="memberJoin" method="post" enctype="multipart/form-data"
                            onsubmit= "return joinFormCheck()">
                            
                                <div class="form-group">
                                
                                    <div class="form-group">
                                    
                                    ????????? &nbsp;&nbsp; <span id="idCheckMsg"></span>
                                        <input type="text" class="form-control form-control-user" id="mid" name="mid"
                                            placeholder="???????????? ???????????????" >
                                            
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                    ????????????&nbsp;&nbsp; <span id="pwCheckMsg"></span>
                                        <input type="password" class="form-control form-control-user" id="mpw" name="mpw"
                                            placeholder="??????????????? ???????????????" >
                                    </div>
                                	
                                    <div class="form-group row">
                                    
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                   ??????&nbsp;&nbsp; <span id="nameCheckMsg"></span>
                                        <input type="text" class="form-control form-control-user" name="mname"
                                            id="mname" placeholder="????????? ???????????????">
                                    </div>
                                    <div class="col-sm-6">
                                    ????????????&nbsp;&nbsp; <span id="birthCheckMsg"></span>
                                        <input type="date" class="form-control form-control-user" name="mbirth"
                                            id="mbirth" placeholder="??????????????? ???????????????">
                                    </div>
                                    </div>
                                    
                                    
                                	<div class="form-group">
                                	?????????&nbsp;&nbsp; <span id="emailCheckMsg"></span>
                                    <input type="text" class="form-control form-control-user" id="memail" name="memail"
                                        placeholder="???????????? ???????????????">
                                	</div>
                                	
		                            <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    ??????&nbsp;&nbsp; <span id="addrCheckMsg"></span>
                                        <input type="text" class="form-control form-control-user"
                                            id="sample6_postcode" name="mpost" placeholder="????????????">
                                    </div>
                                    
                                    <div class="col-sm-6">
                                    <br>
                                    <input type="button"  class="btn btn-primary btn-user btn-block" onclick="sample6_execDaumPostcode()" value="???????????? ??????">
                                    </div>     
  		                           </div>
                             
  		                           <div class="form-group">
                                    
                                        <input type="text" class="form-control form-control-user" id="sample6_address" name="mAddr"
                                            placeholder="??????">
                                    </div>
                             
                             
                             
  		                           <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                   
                                        <input type="text" class="form-control form-control-user"
                                            id="sample6_detailAddress" placeholder="????????????" name="mdetailAddr">
                                    </div>
                                    
                                    <div class="col-sm-6">
                                    
                                    <input type="text" class="form-control form-control-user"
                                            id="sample6_extraAddress" placeholder="????????????" name="mextraAaddr">
                                    </div>     
                            	 </div>  
                            	 
                            	 <div class="form-group">
                                	????????? ?????????&nbsp;&nbsp; <span id="profileMsg"></span>
                                	<input type="file" style="display:none;" id="mfile" onchange="fileName()" name="mfile">
                                    <button type="button" class="btn btn-primary btn-user btn-block" onclick="fileupLoad()" style = " background-color: white; color:gray;">
                                    ????????? ?????? ??????
                                </button>                                                                                        
                                </div>                            
                                <button  class="btn btn-primary btn-user btn-block" >
                                    ????????????
                                </button>
                                </div>
                            </form>
                            
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
 
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <!-- ????????? -->

    <!-- Page level custom scripts -->
     <!-- ????????? -->

</body>


<script type="text/javascript">
function fileupLoad(){
	$("#mfile").click();
}
function fileName(){
	$("#profileMsg").text($("#mfile").val());
}

var inputidCheck = false;

$(document).ready(function(){

	$("#mid").focusout(function(){
		var inputId = $("#mid").val();
		if(inputId.length == 0){
			$("#idCheckMsg").text("???????????? ??????????????????").css("color","red").css("font-size","14px");	
			inputidCheck = false;
		}else{
			
			
			$.ajax({
				type : "get",
				url : "memberIdCheck",
				data : {"inputId" : inputId },						
				success : function(result){			
					console.log(result);
					if(result.length ==0){
						
						$("#idCheckMsg").text("?????????????????????").css("color","green").css("font-size","14px");	
						inputidCheck = true;
					}else{
						
						$("#idCheckMsg").text("???????????????").css("color","red").css("font-size","14px");
						inputidCheck = false;
					}			
				}
			});	
		}
	});
	
});


function joinFormCheck(){
	
	if(inputidCheck == false){		
		alert("???????????? ??????????????????");
		$("#mid").focus();
		return false;
	}
	
	if($("#mpw").val().length == 0){
		alert("??????????????? ??????????????????");
		$("#mpw").focus();
		return false;
	}
	

	if($("#mname").val().length == 0){
		alert("????????? ??????????????????");
		$("#mname").focus();
		return false;
	}

	if($("#mbirth").val().length == 0){
		alert("??????????????? ??????????????????");
		$("#mbirth").focus();
		return false;
	}
	
	
	if($("#memail").val().length == 0){
		alert("???????????? ??????????????????");
		$("#memail").focus();
		return false;
	}
	
	
	if($("#sample6_address").val().length == 0){
		alert("????????? ??????????????????");
		$("#sample6_address").focus();
		return false;
	}
	

	
	
	return true ;
}


</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/memberJs/daumPostCode.js"></script>

</html>
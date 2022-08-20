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

<style type="text/css">

</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        
		<%@ include file="include/Sidebar.jsp" %>
        
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="include/Topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">
                        WebsoketTest.jsp
                        </h1>
                    </div>

                    <!-- Content Row -->
                        <p>세션값 확인 아이디: ${sessionScope.loginId} / 프로필 : ${sessionScope.loginProfile}</p>


                    <!-- Content Row -->
						<hr>
						
						<div class="row">	
											
							<div class=" col-sm-12  col-lg-8">	
								<div class="card ">		
									<div class="bg-primary card-header text-gray-100"> 채팅창 내용 </div>				
									<div class="card-body" id="receiveMsg" style="height:300px; overflow-y:auto;"></div>
								</div>
							</div>
						
							<div class="col-sm-12  col-lg-4">
								<div class="card ">		
									<div class="card-header bg-primary text-gray-100">채팅 입력</div>			
									<div class="card-body">				
																		
											<input class = "form-control" type="text" id="comment" placeholder="내용">
											<button class = "btn-block btn btn-success " onclick="msgSend()"> 채팅입력 버튼 </button>
										
									</div>
								</div>
							</div>
						</div>


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
    
   <div class="modal fade" id="reservModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">예약되었습니다</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="text-align:center; vertical-align:middle;">
                <div class="row">
                	<div class="col-6">
                	<img style = " font-size:16px; width:150px;" src="${reservInfoflash.mvposter}">
                	</div>
                	<div class="col-6" style="padding-top:5px;">
                	${reservInfoflash.mvname} <br><br>${reservInfoflash.thname} <br><br> ${reservInfoflash.scroom} <br><br> ${reservInfoflash.rescdate}<br> <br>인원 수 : ${reservInfoflash.reamount}명</div>
                	</div>
                </div>
                
                
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
 </body>

 
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Sockjs -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>




<script type="text/javascript">
var scMsg ='${scMsg}';
if(scMsg.length >0){
	alert(scMsg);
}


var reInfoFlash= '${reservInfoflash}';
	console.log("flashAttri출력"+reInfoFlash);
if(reInfoFlash.length>0){
	$("#reservModal").modal('show');
}

</script>
 
 
 <script type="text/javascript">//websoket 전용 기본 함수, 변수선언
 var testUrl ='${pageContext.request.contextPath}/testWskMessage'; //우리가 직접 만든 변수임. url정보를 입력하기 위한 변수임.
 var sock = new SockJS(testUrl);
 
 sock.onopen = function() {
     console.log('open');
 };
 
 
 

 sock.onmessage = function(e) {
     console.log('message', e.data);
     var recieveData = JSON.parse(e.data);
     console.log(recieveData);
     
     var output = "<p style=\"font-size:10px;\">"+recieveData.msgUserId+"</p>"; 
	  output += "<p style=\"text-align:left\"><span class=\"btn bg-primary text-gray-100\" >"+recieveData.msgComment+"</span></p>";
	 $("#receiveMsg").append(output);
	 
 };
 
 
 

 sock.onclose = function() {
     console.log('close');
 };
 
 </script>
 
 <script type="text/javascript">
 


 function msgSend(userId){
	 console.log("msgSend실행");
	 
	
	 var comment = $("#comment").val();
	 if(comment.trim().length >0){
	 var output ="<p style=\"text-align:right\"><span class=\"btn bg-success text-gray-100\" >"+comment+"</span></p>";
	 $("#receiveMsg").append(output);
	 $("#comment").val("");
	 
	 var msgData = {
			 
		"msgUserId" : '${sessionScope.loginId}',
		"msgComment" : comment
		
	 };
	 
	 console.log(msgData);
	 console.log(JSON.stringify(msgData));

	 sock.send(JSON.stringify(msgData));
	 }
 }
 
 
 
 </script>
 
 </html>

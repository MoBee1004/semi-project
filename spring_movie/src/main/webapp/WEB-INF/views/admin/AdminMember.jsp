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
       <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style type="text/css">
img{
width:50px;
heigh:50px;
}


</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        
		<%@ include file="../include/AdminSidebar.jsp" %>
        
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="../include/AdminTopbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">
                        AdminMember.jsp
                        </h1>
                    </div>

                    <!-- Content Row -->
                        <p>세션값 확인 아이디: ${sessionScope.loginId} / 프로필 : ${sessionScope.loginProfile}</p>


                    <!-- Content Row -->
						<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>비밀번호</th>
                                            <th>이름</th>
                                            <th>생일</th>
                                            <th>이메일</th>
                                            <th>주소</th>
                                            <th>프로필</th>
                                            <th>상태</th>
                                            <th>차단/해제</th>
                                            <th>회원정보수정</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>비밀번호</th>
                                            <th>이름</th>
                                            <th>생일</th>
                                            <th>이메일</th>
                                            <th>주소</th>
                                            <th>프로필</th>
                                            <th>상태</th>
                                            <th>차단/해제</th>
                                            <th>회원정보수정</th>
                                           
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${memberList}" var="mbList">
                                    		<tr>
                                           		<td>${mbList.mid}</td>
                                            	<td>${mbList.mpw}</td>
                                            	<td>${mbList.mname}</td>
                                           	 	<td>${mbList.mbirth}</td>
                                            	<td>${mbList.memail}</td>
                                            	<td>${mbList.maddress}</td>
                                            	<td>
	                                            	<c:if test="${mbList.mstate == 0 || mbList.mstate==1}">
    	                	                        	<img src="${pageContext.request.contextPath}/resources/mprofileUpLoad/${mbList.mprofile}">
        	                                    	</c:if>
            	                                	<c:if test="${mbList.mstate == 2 || mbList.mstate==3}">
                	        	                    	<img src="${mbList.mprofile}">
                    	                        	</c:if>
                                            	</td>
                                            	<td id ="${mbList.mid}">
                                            		<c:if test="${mbList.mstate == 0 || mbList.mstate==2}">사용중</c:if>
                                            		
                                            		<c:if test="${mbList.mstate == 1 || mbList.mstate==3}">중지중</c:if>
                                            	
                                            	</td>
                                            	<td>
                                            		<c:if test="${mbList.mstate == 0 || mbList.mstate==2}">
	                                            		<button class="btn bg-danger text-gray-100" onclick="tobbleBlock(this,'${mbList.mid}')">차단</button>
                                            		</c:if>
                                            		<c:if test="${mbList.mstate == 1 || mbList.mstate==3}">
														<button class="btn bg-primary text-gray-100" onclick="tobbleBlock(this,'${mbList.mid}')">해제</button>						
                                            		</c:if>
                                            	</td>
                                            	<td>회원정보수정</td>
                                        	</tr>
                                        </c:forEach>
                                        
                                        
                                    <!-- 
                                         <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                            <td>$170,750</td>
                                            <td>차단/해제</td>
                                            
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                            <td>$170,750</td>
                                            <td>차단/해제</td>
                                        </tr>  -->

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
					
                    <!-- Content Row -->


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

						


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
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
    <!-- Page level plugins -->
    <!-- 제거됨 -->

    <!-- Page level custom scripts -->
     <!-- 제거됨 -->


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

function tobbleBlock(btnObj,inputMid){

	console.log("tobbleBlock 호출:"+$(btnObj).text());
	if($(btnObj).text()=='차단'){
		console.log("차단요청");
		inputState = 1;
	}else{
		console.log("해제요청");
		inputState = -1;
	}
	
	$.ajax({
		
		type:"get",
		url:"changeState",
		data: {"inputState": inputState,"inputMid": inputMid},		
		async: false,
		success: function(result){
			if(result=='OK'){
				if(inputState==1){
					$(btnObj).toggleClass("bg-primary bg-danger");
					$(btnObj).text("해제");
					var num = Number($("#"+inputMid).text());
					$("#"+inputMid).text("중지중");
				}else{
					$(btnObj).toggleClass("bg-primary bg-danger");
					$(btnObj).text("차단");
					var num = $("#"+inputMid).text();
					$("#"+inputMid).text("사용중");
				}
			}
		}
	});
	
	
}


</script>

</html>
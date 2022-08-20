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
        <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/3b0042e53f.js" crossorigin="anonymous"></script>
<style type="text/css">

a{
appearance:none;
}
.divbg{
width:30px; height:30px; background-color:black; border-radius:5px; text-align:center; float:left;
}
.live{
text-shadow: 0px 0px 5px white; font-size: 25px; color:white; padding-top:3px;
}
.dead{
color:gray; font-size: 25px; padding-top:3px;
}

input[type="text"]{
border-radius:5px;
border:1px solid gray; 
padding:5px;
margin:3px;
}

input[type="text"]:read-only,input[type="text"]:focus{

border:0px;
background-color:white;
outline: none;

}

</style>
</head>
<script type="text/javascript">
console.log('${msg}');
if(${msg != null}){
	
	alert('${msg}');
}


</script>
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
                        AdminTheater.jsp
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
                                            <th>극장코드</th>
                                            <th>극장이름</th>                                            
                                            <th>극장주소</th>
                                            <th>극장전화번호</th>
                                            <th>정보수정</th>
                                            <th>상태토글</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>극장코드</th>
                                            <th>극장이름</th>                                            
                                            <th>극장주소</th>
                                            <th>극장전화번호</th>
                                            <th>정보수정</th>
                                            <th>상태토글</th>
                                            
                                           
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	
                                    	<c:forEach items="${theaterList}" var="thList" varStatus="Num">
                                        <tr>
                                			<td>${thList.thcode}
                                            </td>
                                            
                                            <td id="${thList.thcode}1">${thList.thname}</td>
                                            
                                           
                                            <td id="${thList.thcode}2">${thList.thaddr}</td>
                                            
                                            <td id="${thList.thcode}3">${thList.thtel}</td>
                                            
                                            <td><button class="btn bg-primary text-gray-100" onclick="openModal('${thList.thcode}')">정보수정</button>
                                            </td>
                                            
                                            <td>
                                            <c:if test="${thList.thstate == 0}"><!-- 활성화 상태입니다. 밝은전구+상영중 표시상태입니다. -->
                                             	<div><div  class="divbg"><i onclick = "toggleThState(this,'${thList.thcode}','${Num.index}')"  class="fa-solid fa-building live"></i></div><span id="whiteI${Num.index}">상영중</span>
                                            	 </div>
                                           	 
                                             </c:if>
                                             <c:if test="${thList.thstate == 1}"><!-- 비활성화 상태입니다. 꺼진전구+중지중 표시상태입니다. -->
                                             	<div><div class="divbg"><i onclick = "toggleThState(this,'${thList.thcode}','${Num.index}')"  class="fa-solid fa-building dead"></i></div><span id="BlackI${Num.index}">중지중</span>
                                             	</div>
                                           
                                             </c:if>
                                            
                                            </td>
                                            
                                            
                                          
                                            
                                        </tr>
                                      
                                        
                                        
                                        
                                        </c:forEach> 
                                     

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
    
   <div class="modal fade" id="thInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
        aria-hidden="true" >
        <div class="modal-dialog" role="document" style="margin-left: 500px;">
            <div class="modal-content" style="width:1000px;" >
            
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">영화 정보 수정</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                	
              		  <div class="modal-body" style="text-align:center; vertical-align:middle; " >
					
						 <input type="text" name="thcode" id="thcode" readonly>
						 <input type="text" name="thname" id="thname" >	
                		 <input type="text" name="thaddr" id="thaddr" >
                		 <input type="text" name="thtel" id="thtel">
		
              	 	</div>
              		<div class="modal-footer" style="text-align:center; vertical-align:middle; " >
              		   <button onclick= "modifyThInfo()">전송</button>
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

    <!-- Page level plugins -->
    <!-- 제거됨 -->

    <!-- Page level custom scripts -->
     <!-- 제거됨 -->


<script type="text/javascript">



var thcodeF = "";

function openModal(thcode){
	console.log("보여줄내용:"+thcode);
		
	 $("#thcode").val(thcode);
	 $("#thname").val($("#"+thcode+"1").text());
	 $("#thaddr").val($("#"+thcode+"2").text());
	 $("#thtel").val($("#"+thcode+"3").text());
	 thcodeF = thcode;
	
	$("#thInfoModal").modal('show'); 
}

function checkModiInfo(){
	console.log($("#thcode").val());
	console.log($("#thname").val());
	console.log($("#thaddr").val());
	console.log($("#thtel").val());
	
	 if($("#thname").val().length ==0){
		 console.log("입력값없음");
		 return false;
	 } 
	 if($("#thaddr").val().length ==0){
		 console.log("입력값없음");
		 return false;
	 } 
	 if($("#thtel").val().length ==0){
		 console.log("입력값없음");
		 return true;
	 } 

	 
	return true;
}

function toggleThState(thObj,thcode,num){
	var thstate ="";
	if($(thObj).hasClass("live")){
		thstate= '1';
	}else{
		thstate= '0';
	}
	
	$.ajax({
		type : "get",
		url : "toggleThState_ajax",		
		data : {"thcode": thcode,"state":thstate},		
		async: false,
		success : function(result){
			
			if(result=='OK'){
			$(thObj).toggleClass("live dead");
			
			
			if(thstate=='0'){
				$("#whiteI"+num).text("상영중");
				$("#BlackI"+num).text("상영중");
			}else{

				$("#whiteI"+num).text("중지중");
				$("#BlackI"+num).text("중지중");
			}			
			}		
		}		
	});
		
} 


function modifyThInfo(){
	var thcode = $("#thcode").val();
	var thname = $("#thname").val();
	var thaddr = $("#thaddr").val();
	var thtel = $("#thtel").val();
	if(thname.length>0 && thaddr.length>0 && thtel.length>0 ){
		console.log("업데이트 가능");
		$.ajax({
			type : "get",
			url : "adminModifyTheater",		
			data : {"thcode": thcode,"thname":thname,"thaddr":thaddr,"thtel":thtel},		
			async: false,
			success : function(result){
				if(result != null){
					 
					 $("#thname").val(thname);
					 $("#thaddr").val(thaddr);
					 $("#thtel").val(thtel);
					 
					 
					 $("#"+thcodeF+"1").text(thname);
					 $("#"+thcodeF+"2").text(thaddr);
					 $("#"+thcodeF+"3").text(thtel);
				
				}
			}
				
		});
		
		
	}else{
		alert("빈값으로 수정 할 수 없습니다.");
	}
	
}



</script>
    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>


</html>
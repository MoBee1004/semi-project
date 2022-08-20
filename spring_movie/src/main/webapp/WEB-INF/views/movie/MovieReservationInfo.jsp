<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/3b0042e53f.js" crossorigin="anonymous"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>예매내역</title>

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
.table td{
vertical-align: middle;
font-weight:bold;
}

div.mx-3{

	margin-bottom:22px;
}
.reviewbtn{

width:89px;
height:50px;
border-radius:5px; 
border:2px solid dodgerblue;

}

.reviewbtn:hover{

border-radius:5px; 
border: 6px solid dodgerblue;
}
sup{
top:0.5em;
}
a:link{
text-decoration: none;
	
}
a:visited{
text-decoration: none;
}

.ticket{
background:none;
background-image: url(${pageContext.request.contextPath}/resources/img/MovieTicket_Blue.png);
background-size: 100%;
background-repeat: no-repeat;
background-position: center;

}

.textA{
resize:none; 
border-radius:5px;
width:80%; 
height:60px;
border:none;
overflow-y:auto;
background-color:rgb(236, 236, 236);
}
textarea::placeholder{
  color: lightgray;
  
}
textarea:focus{
    outline: none;
}
input[type="radio"]{
	-webkit-appearance: none;
    appearance: none;

}
input[type="radio"]+label i{
    color: rgb(137, 221, 255); 
    
}
input[type="radio"]:checked+label i{
    

    color: white;   
	text-shadow: 0px 0px 9px rgb(137, 221, 255);
}
    



</style>
</head>

<script type="text/javascript">
console.log("예약내역 페이지 실행 -reInfoMsg:"+'${reInfoMsg}');
if(${reInfoMsg != null}){
	console.log("알람실행"+'${reInfoMsg}');
	alert('${reInfoMsg}');
}

</script>
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
                        MovieReservationInfo.jsp
                        </h1>
                    </div>

                    <!-- Content Row -->
                        <p>세션값 확인 아이디: ${sessionScope.loginId}</p>


                    <!-- Content Row -->

				

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
                                            <th></th>
                                            <th>영화제목</th>
                                            <th>극장이름</th>
                                            <th>상영관</th>
                                            <th>상영일시</th>
                                            <th>인원수</th>
                                            <th>${today}</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th>영화제목</th>
                                            <th>극장이름</th>
                                            <th>상영관</th>
                                            <th>상영일시</th>
                                            <th>인원수</th>
                                            <th>${today}</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:set var="today" value="<%=new Date() %>"> </c:set>
                                    	<c:forEach items="${rdtoList}" var="reservationInfo">
                                        <tr id="${reservationInfo.recode}">
                                       			 
                                       			 
                                            	<fmt:parseDate value="${reservationInfo.rescdate }" var="scdate_fm" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                                            	
                                            	
                                            <td ><a href="movieView?mvcode=${reservationInfo.mvcode}"><img src="${reservationInfo.mvposter}" style="width:60px;"></a></td>
                                            <td ><a href="movieView?mvcode=${reservationInfo.mvcode}" class="text-secondary">${reservationInfo.mvname}</a></td>
                                            <td>${reservationInfo.thname}</td>
                                            <td>${reservationInfo.scroom}</td>
                                            <td>${reservationInfo.rescdate}</td>
                                            <td>${reservationInfo.reamount}명</td>
                                            <td style="text-align:center;">
                                            	
                                            	
                                            	<c:choose>
                                            	<c:when test="${scdate_fm < today}">
                                            	
                                            	<c:if test="${reservationInfo.checkRv==0}">
                                            	<button onclick="comentModal('${reservationInfo}')" class="bg-gradient-primary text-gray-100" style="padding:10px; border-radius:5px; border:none;">관람평작성</button>
                                            	</c:if>
                                            	<c:if test="${reservationInfo.checkRv==1}">
                                            	<button onclick="getcomentInfo('${reservationInfo}')" class="bg-gradient-secondary text-gray-100" style="padding:10px; border-radius:5px; border:none;">관람평보기</button>
                                            	</c:if>
                                            	</c:when>
                                            	<c:otherwise>
                                            	
                                            	<a href="deleteReserv?recode=${reservationInfo.recode}">
                                            	<button class="bg-gradient-danger text-gray-100" style="padding:10px; border-radius:5px; border:none;">예매취소</button>
                                            	</a>
                                            	</c:otherwise>
                                            	</c:choose>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        <!-- <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                        </tr> -->

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




    <!-- Write Coment Modal-->
    
   <div class="modal fade" id="comentModal" >
        <div class="modal-dialog" role="document">
            <div class="modal-content ticket" style="width:680px; border:none; box-sizing: border-box; color:white;">
            
            	<div class="row" style="padding:6px;padding-left:20px;padding-right:20px;">
            		<div class="col-9">    
                    <h5 class="modal-title"  style="text-align:right;">영화는 어땠나요? 감상평을 남겨주세요.</h5>
                    </div>
                    <div class="col-3"> 
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    </div>
               </div>
                
               <form action="insertReview" method="post" onsubmit="return checkComment()">
                	<div class="row">
                		
                		<div class="col-3" >
                		<img id="comvposter" style = "padding-left:70px; font-size:16px; width:150px;" src="">
                		</div>
                		<div class="col-9" style="padding-top:5px;box-sizing: border-box; width:290px; height:120px;">
                		
                			<div class="row" style="box-sizing: border-box; width:340px; height:50px; ">
                				<p id="comvname" style="vertical-align: bottom;">영화이름</p> 
                			</div>
                			<div class="row" style="box-sizing: border-box; width:100%; height:70px;">
                				
                					<div class="col-4">
                						<div id="cothname" style="font-size:12px; float:left;">극장이름</div> 
                						<div id="coroom" style="font-size:12px; float:left;">상영관</div>  
                						<div id="codate" style="font-size:12px; clear:both">날짜및시간</div> 
                						<div id="coamount" style="font-size:12px;">인원수</div>
                					</div>
                 		
                 					<div class="col-4" style="text-align:right;">
                 						<div>
                 						
                 						<input id="check1" checked type="radio" name="rvrecommend" style="width:20px; height:20px;" value="1">
                 						<label for="check1"><i style="font-size:30px;" class="fa-regular fa-thumbs-up"></i></label>
                 						<br>
                 						<input id="check2" type="radio" name="rvrecommend" style="width:20px; height:20px;" value="0">
                 						<label for="check2"><i style="font-size:30px;" class="fa-regular fa-thumbs-down"></i></label>
                 						
                 						</div>
                					</div>
                					<div class="col-3" style="padding-top:20px; text-align:right;">
                						<div >	  <button  class="reviewbtn">확인</button>  </div>     
                					</div>  
                				       		
                			</div>
                		</div>
               		</div>
                
               
                	<table style="width:100%; margin:7px;">
                	<tr>
                	<th style="text-align:center; "><textarea name="rvcomment" id="coText"class="textA" placeholder="감상평을 남겨주세요"></textarea></th>
                	
                	</tr>
                	</table>
                	<input type="hidden" id="rvrecode" name="rvrecode">
                	<input type="hidden" id="rvmvcode" name="rvmvcode">
                	<input type="hidden" name="rvmid" value="${sessionScope.loginId}">
                </form>
                
                
           
        </div>
    </div>
  </div>
  
  <!-- Write Coment Modal-->
  
  
  <!-- read Coment Modal-->
  
     <div class="modal fade" id="readCommentModal" >
        <div class="modal-dialog" role="document">
            <div class="modal-content ticket" style="width:680px; border:none; box-sizing: border-box; color:white;">
            
            	<div class="row" style="padding:6px;padding-left:20px;padding-right:20px;">
            		<div class="col-9">    
                    <h5 class="modal-title" id="titleModal" style="text-align:right;">내가 쓴 감상평.</h5>
                    </div>
                    <div class="col-3"> 
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    </div>
               </div>
                
               <form action="updateReview?checkView=0" method="post" onsubmit="return checkModireview()">
                	<div class="row">
                		
                		<div class="col-3" >
                		<img id="readcomvposter" style = "padding-left:70px; font-size:16px; width:150px;" src="">
                		</div>
                		<div class="col-9" style="padding-top:5px;box-sizing: border-box; width:290px; height:120px;">
                			<div class="row" style=" box-sizing: border-box; width:340px; height:50px;">
                				<p id="readcomvname" style="vertical-align: bottom;">영화이름</p> 
                			</div>
                			<div class="row" style="box-sizing: border-box; width:100%; height:70px;">
                				<div class="row" style="width:100%;">
                					<div class="col-4">
                						<div id="readcothname" style="font-size:12px; float:left;">극장이름</div> 
                						<div id="readcoroom" style="font-size:12px; float:left;">상영관</div>  
                						<div id="readcodate" style="font-size:12px; clear:both">날짜및시간</div> 
                						<div id="readcoamount" style="font-size:12px;">인원수</div>
                					</div>
                 		
                 					<div class="col-3" style="text-align:right;">
                 						<div>
                 						<input id="checkUp" type="radio" name="rvrecommend" style="width:20px; height:20px;" value="1">
                 						<label for="checkUp"><i style="font-size:30px;" class="fa-regular fa-thumbs-up"></i></label>
                 						<br>
                 						<input id="checkDown" type="radio" name="rvrecommend" style="width:20px; height:20px;" value="0">
                 						<label for="checkDown"><i style="font-size:30px;" class="fa-regular fa-thumbs-down"></i></label>
                 						</div>
                					</div>
                					<div class="col-5" >
                					
                						<div id="Modibtn"><button  type ="button" onclick= "toggleSubmit()" class="reviewbtn">수정</button> 
                						
                						<button class="reviewbtn" type ="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">확인</span></button>  
                						</div>     
                						
                						<div id="Subbtn" style="display:none;"><button  type ="button"  onclick= "toggleModify()" class="reviewbtn">수정취소</button>
                						<button class="reviewbtn"><span aria-hidden="true">수정확인</span></button>  
                						</div>     
                						
                					</div>  
                				</div>        		
                			</div>
                		</div>
               		</div>
                
               
                	<table style="width:100%; margin:7px;">
                	<tr>
                	<th style="text-align:center; "><textarea name="rvcomment" id="readcoText"class="textA" placeholder="감상평을 남겨주세요"></textarea></th>
                	
                	</tr>
                	</table>
                	<input type="hidden" id="readrvrecode" name="rvrecode">
                	<input type="hidden" id="readrvmvcode" name="rvmvcode">
                	<input type="hidden" name="rvmid" value="${sessionScope.loginId}">
                </form>
                
                
           
        </div>
    </div>
  </div>
  
  <!-- read Coment Modal-->
    
 <!--   <div class="modal fade" id="comentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ticket" >
            
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">영화는 어땠나요? 감상평을 남겨주세요.</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                
                <div class="modal-body" style="text-align:center; vertical-align:middle;">
                	<div class="row">
                		<div class="col-6">
                		<img id="comvposter" style = " font-size:16px; width:150px;" src="">
                		</div>
                		<div class="col-6" style="padding-top:5px;">
                		<div id="comvname">영화이름</div> 
                		<div id="cothname">극장이름</div> 
                		<div id="coroom">상영관</div>  
                		<div id="codate">날짜및시간</div> 
                		<div id="coamount">인원수</div>
                		</div>
               		</div>
                 </div>
                
                <div class="modal-footer">
                	<table style="width:100%;">
                	<tr>
                	<th><textarea style="width:80%;">감상평을 입력하세요</textarea></th>
                	<th><i class="fa-regular fa-thumbs-up"></i><input type="checkbox" name="up">추천 <button >확인</button></th>
                	</tr>
                	</table>
                	
                </div>
                
           
        </div>
    </div>
  </div> -->
     
    
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
var deleteMsg = '${deleteMsg}';
var reviewF = {};

if(deleteMsg.length >0){
	alert(deleteMsg);
}


function comentModal(reservInfo){
	console.log("관람평 모달 실행"+reservInfo);
	console.log(reservInfo.replaceAll(", ",","));
	console.log(reservInfo.replaceAll(", ",",").split('(')[1].split(')')[0]);
	
	//한줄의 데이터를 json형식으로 바꿔주는 과정 reservInfo --> reserveDate
	var row = reservInfo.replaceAll(", ",",").split('(')[1].split(')')[0].split(',');
	var reserveData={};
	for(var i =0; i<row.length; i++){
		
		var key = row[i].split('=')[0];
		var val = row[i].split('=')[1];
		reserveData[key] = val;
		
	}
	

	$("#rvrecode").val(reserveData.recode);
	$("#rvmvcode").val(reserveData.mvcode);
	
 	$("#comvposter").attr("src",reserveData.mvposter);
	$("#comvname").text(reserveData.mvname);
    $("#cothname").text(reserveData.thname);
    $("#coroom").text(reserveData.scroom);
    $("#codate").text(reserveData.rescdate);
    $("#coamount").text("인원수: "+reserveData.reamount);
    
	$("#comentModal").modal('show'); 
	$("#coText").val("");
}

function checkComment(){
	var comment = $("#coText").val();
	console.log($("#coText").val());
	if(comment.length == 0){
		alert("관람평을 작성해주세요");
		return false;
	}
	return true;
	
}

function getcomentInfo(reservInfo){
	console.log("보여줄 관람평내용:"+reservInfo);
	var row = reservInfo.replaceAll(", ",",").split('(')[1].split(')')[0].split(',');
	var reserveData={};
	for(var i =0; i<row.length; i++){
		
		var key = row[i].split('=')[0];
		var val = row[i].split('=')[1];
		reserveData[key] = val;
		
	}
	//modal버튼 초기화
	$("#Modibtn").css("display","");
	$("#Subbtn").css("display","none");
	
	
	$("#readrvrecode").val(reserveData.recode);
	$("#readrvmvcode").val(reserveData.mvcode);
	
 	$("#readcomvposter").attr("src",reserveData.mvposter);
	$("#readcomvname").text(reserveData.mvname);
    $("#readcothname").text(reserveData.thname);
    $("#readcoroom").text(reserveData.scroom);
    $("#readcodate").text(reserveData.rescdate);
    $("#readcoamount").text("인원수: "+reserveData.reamount);
    
   
	
	$.ajax({
		
		type:"get",
		url:"getcomentInfo",
		data: {"recode" : reserveData.recode},
		dataType:"json",
		async: false,
		success: function(review){
			console.log(review);
			reviewF = review;
			
			$("#readcoText").val(review.rvcomment);			
			$("#readcoText").attr("readonly","readonly");
			if(review.rvrecommend == 0){
				console.log("비추천"+review.rvrecommend);
				
				$("#checkUp").prop("checked","false");
				$("#checkDown").prop("checked","true");
				
				
			}else{
				console.log("추천"+review.rvrecommend);
				
				$("#checkDown").prop("checked","false");
				$("#checkUp").prop("checked","true");
				
			}
			$("#checkUp").attr("disabled","disabled");
			$("#checkDown").attr("disabled","disabled");			
		}		
	});

	$("#readCommentModal").modal('show'); 
	
}
function toggleSubmit(){

	$(Modibtn).css("display","none");
	$(Subbtn).css("display","");
	$("#readcoText").removeAttr("readonly");
	$("#checkUp").removeAttr("disabled");
	$("#checkDown").removeAttr("disabled");

}


function toggleModify(){

	if(reviewF.rvrecommend == 0){
		console.log("비추천"+reviewF.rvrecommend);
		
		$("#checkUp").prop("checked","false");
		$("#checkDown").prop("checked","true");
		console.log("비추천완료");
		
	}else{
		console.log("추천"+reviewF.rvrecommend);
		
		$("#checkDown").prop("checked","false");
		$("#checkUp").prop("checked","true");
		console.log("추천완료");
	}

	
	$("#readcoText").val(reviewF.rvcomment);			
	$("#readcoText").attr("readonly","readonly");
	
	$("#checkUp").attr("disabled","disabled");
	$("#checkDown").attr("disabled","disabled");	
	
	$("#Modibtn").css("display","");
	$("#Subbtn").css("display","none");
		
}

function checkModireview(){
	
	var comment = $("#readcoText").val();
	console.log($("#readcoText").val());
	if(comment.length == 0){
		alert("관람평을 작성해주세요");
		return false;
	}
	return true;
	
}

</script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</html>
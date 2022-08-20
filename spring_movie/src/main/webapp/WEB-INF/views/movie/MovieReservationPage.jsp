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

.pd{
	padding:10px; 
	border:0px;
}

.ht{
	height:250px;
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
                       	 MovieReservationPage.jsp
                        </h1>
                    </div>
                    <!-- Content Row -->
                        <p>세션값 확인 아이디: ${sessionScope.loginId} </p>





                    <!-- Content Row -->
					<!-- 영화,극장,날짜및 시간, 상영관 선택 -->
					<div class="row">
					
						<div class="col-4" >
							<div class="card mb-4">
                            <div class="card-header">
                               영화목록
                            </div>
                            <div class="card-body listArea" id="mvList" style="height:300px; overflow-y:scroll;">
 								  
 								<c:forEach items="${reMvList}" var="MvInfo">
 								
 									
 									<div id = "${MvInfo.mvcode}" class="card pd" onclick="clickMovie(this,'${MvInfo.mvname}','${MvInfo.mvcode}','${MvInfo.mvposter}')">
 									${MvInfo.mvname}
 									</div>
 									
 								                       
                                </c:forEach>    
							
                            </div>
						
						  	</div>
						</div>
						
						<div class="col-3 " >
						
						 	<div class="card" style="width:100%">
								<div class="card-header">
                               		극장목록
                           		</div>
                           		<div class="card-body" id="thListdiv" style="height:300px;">
									
								</div>
								
							</div>
							
						</div>
						
						<div class="col-2">
						
							<div class="card" style="width:100%">
								<div class="card-header">
                               		날짜목록
                           		</div>
                           		<div class="card-body" id="scdateListdiv" style="height:300px;">
									
								</div>
								
							</div>
						
						</div>
						
						<div class="col-3" >
							<div class="card" style="width:100%">
								<div class="card-header">
                               		상영관, 시간
                           		</div>
                           		<div class="card-body" id="scroomtimediv" style="height:300px ; " >
									
								</div>
								
							</div>
						</div>
						
						
					</div>




                    <!-- Content Row -->
					<!-- 선택항목 확인 -->
					<div class="row">
					
						<div class="col-3  " >
							<div class="card" style="height:250px;">
								<div class="card-header">
                               	선택한 영화
                           		</div>
                           		
                           		<div class="card-body" id="reMvName" style="border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
                           			<div class="row" >
                           							                          			
                           			</div>
									
									
								</div>
								
							</div>
						</div>
						
						<div class="col-4 " >
							<div class="card" style="height:250px;" >
								<div class="card-header" >
                               		선택한 극장,날짜,상영관&시간
								</div>
								<div class="card-body" style="text-align:center; width:100%;" >
									<div class="row" style="height:50%;">
										<div class="col-6" >
											<div id="showThInfo" style="padding:20px; overflow:auto;">
											</div>
											</div>	
										<div class="col-6">
											<div id="showScdate" style="padding:20px; overflow:auto;">
												
											</div>
										</div>
										</div>	
									
									<div class="row" style="height:50%;">
										<div class="col-6">
											<div  id="showscroomtime" style="padding:20px; overflow:auto;">
																								
												<!-- 상영관 및 시간 -->
											</div>
										
										</div>
										<div class="col-6">
											<div  id="showAmount" style="padding:20px; overflow:auto;">
												<!-- 인원수 -->
											</div>
										
										</div>
									</div>
											
									
								</div>
                           	</div>
								
						</div>
						
						<div class="col-2">
							<div class="card"  style="height:250px;">
								<div class="card-header">
								인원 수 입력
								</div>
								<div class="card-body">
								<div class="" id="toggleAmount" style="display:none; text-align:center;">
									<button onclick="clickAmount(this)" class="btn text-gray-100 bg-gradient-secondary btn-circle " style="margin:10px;">1</button>
									<button onclick="clickAmount(this)" class="btn text-gray-100 bg-gradient-secondary btn-circle " style="margin:10px;">2</button>
									<button onclick="clickAmount(this)" class="btn text-gray-100 bg-gradient-secondary btn-circle " style="margin:10px;">3</button>
									<button onclick="clickAmount(this)" class="btn text-gray-100 bg-gradient-secondary btn-circle " style="margin:10px;">4</button>
									<button onclick="clickAmount(this)" class="btn text-gray-100 bg-gradient-secondary btn-circle " style="margin:10px;">5</button>
									<button onclick="clickAmount(this)" class="btn text-gray-100 bg-gradient-secondary btn-circle " style="margin:10px;">6</button>

								</div>
								</div>
							</div>
						</div>
						
						<div class="col-3" >
							<div class="card" style="height:250px;">
								<div class="card-header">
									예매확인
								</div>
								<div class="card-body" style="text-align:center;">
									<form action="insertReservation" onsubmit="return checkSubmit()">
								<input type="hidden" id="inputid" name="remid" value="${sessionScope.loginId}">
								<input type="hidden" id="inputthcode" name="rescthcode">
								<input type="hidden" id="inputscdate" name="rescdate">
								<input type="hidden" id="inputscroom" name="rescroom">
								<input type="hidden" id="inputreamount" name="reamount">
								<button class="card bg-gradient-danger" style="padding:20px 10px; margin-top:50px; margin-right:auto; margin-left:auto;">예매하기</button>
								</form>
								</div>
							</div>
						</div>
						
					</div>




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
var selectReMvcode=""; //선택한 영화코드
var selectReThcode=""; //선택한 극장코드
var selectScdate=""; //선택한 날짜
var scdateAll="";
if(${sessionScope.loginId == null}){
	alert("로그인 후 이용가능 합니다");
	location.href="memberLoginForm";
}

var remvcode ='${remvcode}';
if(remvcode.length >0){
	$("#${remvcode}").click();
}


function clickMovie(mvObj,mvname,mvcode,mvposter){//영화를 클릭할때 실행되는 부분
	selectReMvcode = mvcode;
	$("#inputscdate").val("");
	$("#inputthcode").val("");
	$("#inputscdate").val("");
	$("#inputscroom").val("");
	$("#inputreamount").val("");
	console.log("clickMovie 실행");
	$("#showThInfo").text("");
	$("#showScdate").text("");
	$("#showscroomtime").html("");
	$("#showscroomtime").removeClass("card bg-gradient-secondary text-gray-100 pd"); 
	$("#toggleAmount").css("display","none");
	$("#showAmount").text("");
	$("#showAmount").removeClass("card bg-gradient-secondary text-gray-100 pd");
	$("#toggleAmount button").removeClass("bg-gradient-primary");
	$("#toggleAmount button").addClass("bg-gradient-secondary");
	
	$("#showThInfo").removeClass("bg-gradient-secondary text-gray-100");
	$("#showScdate").removeClass("bg-gradient-secondary text-gray-100");
	$("#mvList div").removeClass("bg-gradient-primary text-gray-100");
	$(mvObj).toggleClass("bg-gradient-primary text-gray-100");
	 $("#scdateListdiv").html("");
	 $("#scroomtimediv").html("");
	console.log("영화제목"+ mvname );
	console.log("영화코드" + mvcode);
	console.log("영화포스터" + mvposter);
	
	$("#reMvName div").html("<div class='col-4' style='text-align:center;'><img style = 'width:100px;'"
						+"src='"+mvposter+"'}></div><div class='col-8' style='text-align:center; "
						+"margin-top:auto; margin-bottom:auto;'>"+mvname+"</div>");
	$("#reMvName").addClass("bg-gradient-secondary text-gray-100");
	
	$.ajax({
		type:"get",
		url:"getThList",
		data: {"mvcode" : mvcode},
		dataType:"json",
		async: false,
		success: function(thList){
			
			console.log(thList);	
			var output ="";
			
			for(var i =0; i<thList.length; i++){
				console.log(thList[i].thname);
				output+= "<div class='p-2 card pd' onclick='thSelect(this,\""+thList[i].thcode+"\")'>"+thList[i].thname+"</div>";
			}
			
		 $("#thListdiv").html(output);
			
		}
		
		
	});
	
}




function thSelect(thObj,thcode){//극장을 클릭할때 실행되는 부분
	selectReThcode = thcode;
	$("#inputscdate").val("");
	$("#inputthcode").val(thcode);
	$("#inputscdate").val("");
	$("#inputscroom").val("");
	$("#inputreamount").val("");
	console.log("thSelect호출"+thObj+"와"+thcode);
	$("#showScdate").text("");
	$("#showScdate").removeClass("bg-gradient-secondary text-gray-100");
	$("#scroomtimediv").html("");
	$("#showscroomtime").html("");
	$("#showscroomtime").removeClass("card bg-gradient-secondary text-gray-100 pd"); 
	$("#toggleAmount").css("display","none");
	$("#showAmount").text("");
	$("#showAmount").removeClass("card bg-gradient-secondary text-gray-100 pd");
	$("#toggleAmount button").removeClass("bg-gradient-primary");
	$("#toggleAmount button").addClass("bg-gradient-secondary");
	
	$("#thListdiv div").removeClass("bg-gradient-primary text-gray-100");
	$(thObj).toggleClass("bg-gradient-primary text-gray-100");
	
	
	$("#showThInfo").html($(thObj).text());
	$("#showThInfo").addClass("card bg-gradient-secondary text-gray-100 pd");
	
	/* 예매가능한 날짜 목록 조회 및 출력 */
	$.ajax({
		type:"get",
		url:"getScDateList",
		data: {"mvcode" : selectReMvcode,"thcode" : selectReThcode},
		dataType:"json",
		async: false,
		success: function(scDateList){			
			console.log(scDateList);	
			var output="";

			for(var i =0; i<scDateList.length; i++){
				console.log(scDateList[i].scdate_after);
				output+= "<div class='p-2 card pd' onclick='scdateSelect(this,\""+scDateList[i].scdate+"\")'>"+scDateList[i].scdate_after+"</div>";
			}
			
		 $("#scdateListdiv").html(output);
			
		}
		
		
	});
	
}



function scdateSelect(scdateObj,scdate){//날짜를 클릭할때 실행되는 부분
	$("#inputscdate").val(scdate);
	selectScdate = scdate;
	scdateAll=selectScdate;	
	$("#inputscroom").val("");
	$("#inputreamount").val("");
	console.log("scdateSelect호출"+scdateObj+"와"+scdate);
  	$("#scdateListdiv div").removeClass("bg-gradient-primary text-gray-100");
	$(scdateObj).toggleClass("bg-gradient-primary text-gray-100");
	$("#showscroomtime").html("");
	$("#showscroomtime").removeClass("card bg-gradient-secondary text-gray-100 pd");
	$("#toggleAmount").css("display","none");
	$("#showAmount").text("");
	$("#showAmount").removeClass("card bg-gradient-secondary text-gray-100 pd");
	$("#toggleAmount button").removeClass("bg-gradient-primary");
	$("#toggleAmount button").addClass("bg-gradient-secondary");
	
	
	$("#showScdate").html($(scdateObj).text());
	$("#showScdate").addClass("card bg-gradient-secondary text-gray-100 pd");  
	 
	$.ajax({
		type:"get",
		url:"getScRoomTimeList",
		data: {"mvcode" : selectReMvcode,"thcode" : selectReThcode, "scdate" : selectScdate},
		dataType:"json",
		async: false,
		success: function(scRoomTimeList){			
			console.log(scRoomTimeList);	
			var output="";
			
			for(var i =0; i<scRoomTimeList.length; i++){
				
				console.log("상영관:"+scRoomTimeList[i].scroom+"상영시간"+scRoomTimeList[i].sctime);
				output+= "<div class='p-2 card pd' onclick='scroomtimeselect(this,\""+scRoomTimeList[i].scroom+"\",\""+scRoomTimeList[i].sctime+ "\")'>"+scRoomTimeList[i].scroom+", "+ scRoomTimeList[i].sctime+"</div>";
			}
			
			
		 $("#scroomtimediv").html(output);
		}
		
				
	});
	
}

function scroomtimeselect(scrtObj,scroom,sctime){
	console.log("scroomtimeselect() 실행: 오브잭트"+scrtObj+"/상영관:"+scroom+"/시간:"+sctime);
	$("#inputscdate").val(scdateAll+" "+sctime);
	$("#inputscroom").val(scroom);
	$("#inputreamount").val("");
	$("#scroomtimediv div").removeClass("bg-gradient-primary text-gray-100");
	$(scrtObj).toggleClass("bg-gradient-primary text-gray-100");
	
	
	
	$("#showscroomtime").html($(scrtObj).text());
	$("#showscroomtime").addClass("card bg-gradient-secondary text-gray-100 pd"); 
	
	$("#toggleAmount").css("display","");
	
	
}


function clickAmount(buttonObj){	
	var amount = $(buttonObj).text();
	$("#inputreamount").val(amount);
	$("#toggleAmount button").removeClass("bg-gradient-primary");
	$("#toggleAmount button").addClass("bg-gradient-secondary");
	$(buttonObj).removeClass("bg-gradient-secondary");
	$(buttonObj).addClass("bg-gradient-primary");
	console.log(amount);
	$("#showAmount").text(amount+"명");
	$("#showAmount").addClass("card bg-gradient-secondary text-gray-100 pd");
}

function checkSubmit(){

	
	if($("#inputthcode").val().length==0){
		console.log("inputthcode는 빈값입니다.");
		alert("극장을 선택해주세요");
		return false;	
	}
	if($("#inputscdate").val().length==0){
		console.log("inputscdate는 빈값입니다.");
		alert("날짜를 선택해주세요");
		return false;	
	}
	if($("#inputscroom").val().length==0){
		console.log("inputscroom는 빈값입니다.");
		alert("상영관과 시간을 선택해주세요");
		return false;		
	}

	if($("#inputreamount").val().length==0){
		console.log("inputeamount는 빈값입니다.");
		alert("인원수를 선택해주세요");
		return false;	
	}
	

	return true;
}
</script>

</html>
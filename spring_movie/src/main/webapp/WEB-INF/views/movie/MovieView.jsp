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
i.downcolor{

	color:gray; 
	text-shadow: 0px 0px 9px rgb(200,200,200);
	font-size:30px;
}
i.upcolor{

    color: rgb(119,194,255);   
	text-shadow: 0px 0px 9px rgb(124,255,255);
	font-size:30px;
}

.modicolor{
	color:white;
	text-shadow: 1px 0px 2px black,-1px 0px 2px black,0px -1px 2px black,0px 1px 2px black;
	font-size:30px;
}
.customBtn{

padding:5px;
border:0px;
border-radius:5px;

}

textarea{
width:100%; height:99%; resize:none;
border:0px solid black;
outline:0px;
border-radius:10px;
background-color: rgb(245,245,245);
}

textarea:disabled{
width:100%; height:99%; resize:none;
border:0px solid black;
background-color:white;
}
input[type="radio"]{
	-webkit-appearance: none;
    appearance: none;

}/* 
input[type="radio"]+label i{
    color: rgb(137, 221, 255); 
    
}
input[type="radio"]:checked+label i{
    

    color: white;   
	text-shadow: 0px 0px 9px rgb(137, 221, 255);
} */


</style>
</head>
<script src="https://kit.fontawesome.com/3b0042e53f.js" crossorigin="anonymous"></script>
<script type="text/javascript">
var reInfoMsg = '${reInfoMsg}';
if(reInfoMsg.length>0){
	alert(reInfoMsg);
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
                        MovieView.jsp
                        </h1>
                    </div>

                    <!-- Content Row -->
                        <p>세션값 확인 아이디: ${sessionScope.loginId} </p>


                    <!-- Content Row -->
                    
             <div style="width:80%; margin-left:auto; margin-right:auto;">
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-12 col-md-8 mb-4" >
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        
                                        <div class="col-auto">
                                             <img src="${mvContents.mvposter}" alt="${mvContents.mvname}" style="width:300px;">
                                        </div>
                                        <div class="col mr-2" style="padding-left:30px;">
                                        
                                            <div class="text-xs font-weight-bold text-primary" style="font-size:30px;">
                                                ${mvContents.mvname} </div><span>좋아유: ${mvContents.thumbsup} | 싫어유: ${mvContents.thumbsdown}| 예매율:${mvContents.reRate}  %</span><br>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
										감독 : ${mvContents.mvpd}<br><br> 배우 : ${mvContents.mvactor}<br><br>
										장르 : ${mvContents.mvgenre}<br><br> 관람연령 : ${mvContents.mvage}<br><br>
										시간 : ${mvContents.mvtime}<br><br> 개봉일 : ${mvContents.mvopen}<br><br>
										<a href="movieReservation?remvcode=${mvContents.mvcode}"><span class="bg-gradient-primary text-gray-100" style="border-radius:5px; padding:3px;">예약</span></a>
										</div>
                                            
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
						<div class="card bg-primary text-white shadow" style="text-align:center;"><br>관람평 목록<br><br></div>
						</div>

                    </div>
                    


					<!-- 감상평 보는곳 -->
					<div class="row">
					
					<div class="col-12">
					
						<div class="row">
						
						
						
						<c:forEach items="${reviewList}" var="rvList" varStatus="Num"> 
						
						<div class="col-6">
							<div class="card shadow mb-4">
							<form action="updateReview?checkView=1" method="post" onsubmit="return checkSubmit('${Num.index}')">
								<div class="card-header py-3">
									<div class="row">
										<div class="col-9" >
										
										 <img src="${pageContext.request.contextPath}/resources/mprofileUpLoad/${rvList.mprofile}"  style="width:50px; height: 50px; border-radius:10px; float:left;"><div class="m-0 font-weight-bold text-primary" style="float:left; padding-left:20px; padding-top:12px;">${rvList.rvmid} </div>
										
										</div>
										
										
										<div id="modiRecommend${Num.index}" class="col-3" style="text-align:right; display:none;">
											<input id="up${Num.index}" type="radio" name="rvrecommend" value="1"><label for="up"><i id="upthumb${Num.index}" onclick="toggleThumb('up','${Num.index}')" class="fa-solid fa-thumbs-up modicolor" ></i></label>
											<input id="down${Num.index}" type="radio" name="rvrecommend" value="0"><label for="down"><i id="downthumb${Num.index}" onclick="toggleThumb('down','${Num.index}')" class="fa-solid fa-thumbs-down modicolor"></i></label>
											
											<input type="hidden" name="rvrecode" value="${rvList.rvrecode}">
											<input type="hidden" name="rvmvcode" value="${rvList.rvmvcode}">
											<input type="hidden" id="rvCMD${Num.index}" value="${rvList.rvrecommend}">
										</div>
										
										<div id="Recommend${Num.index}" class="col-3" style="text-align:right; ">
										<c:choose>
										<c:when test="${rvList.rvrecommend == 0}">
											<i  class="fa-solid fa-thumbs-down downcolor"></i>
										</c:when>
										<c:otherwise>
											<i  class="fa-solid fa-thumbs-up upcolor"></i>
										</c:otherwise>
										</c:choose>
										</div>		
																		
									</div>
								</div>
								<div class="card-body">
								
										<div style="width:100%; height:100px;">
										<textarea id="commentTA${Num.index}" disabled="disabled" name= "rvcomment" >${rvList.rvcomment}</textarea>
										</div>
										
										<div style="text-align:center; width:100%">	
										<hr>
												<c:if test="${sessionScope.loginId == rvList.rvmid}">
												<div id="modibtn${Num.index}"style="float:right;"><button type="button" onclick="toggleModi('${rvList.rvrecommend}','${Num.index}')" class="customBtn bg-gray-300">수정</button></div>
												<div id="subbtn${Num.index}"style="float:right; display:none;"><button type="button" onclick="tolgglereset('${Num.index}')" class="customBtn bg-gray-300">취소</button><button class="customBtn bg-gray-300">확인</button></div>
												</c:if>
												<div style="padding:5px;">${rvList.rvdate}</div>
										
										
												
											
										</div>
																			
									
									
								</div>
								</form>
							</div>
						</div>
					 	</c:forEach> 
						</div>
					</div>
					</div>
										
					
		</div>			
					
					<!-- 감상평 끝-->
					
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
var recommendF="";
var rvcommentF="";
function toggleModi(recommend,Num){ //수정버튼 눌렀을때
	$("#Recommend"+Num).css("display","none"); //열자마자 보이는 따봉 가리기
	$("#modiRecommend"+Num).css("display",""); //수정시 쌍따봉 보이기
	
	if(recommend == 0){ //비추따봉일경우
		$("#upthumb"+Num).css("display","none"); //추천따봉가림(쌍따봉)
		$("#downthumb"+Num).css("display",""); //비추따봉보임(쌍따봉)
		$("#up"+Num).prop("checked","false");
		$("#down"+Num).prop("checked","true");
	}else{
		$("#downthumb"+Num).css("display","none"); //비추천따봉가림(쌍따봉)
		$("#upthumb"+Num).css("display",""); //추따봉보임(쌍따봉)
		$("#down"+Num).prop("checked","false");
		$("#up"+Num).prop("checked","true");
	}
	$("#modibtn"+Num).css("display","none");//수정버튼 가림
	$("#subbtn"+Num).css("display","");//취소,확인버튼 보이기
	$("#commentTA"+Num).removeAttr("disabled","");//관람평내용 수정가능
	console.log("rvcommentF 전:"+rvcommentF);
	rvcommentF=$("#commentTA"+Num).text();
	recommendF=$("#rvCMD"+Num).val();
}

function tolgglereset(Num){ //취소눌렀을때
	console.log("취소누를때 rvcommentF:"+rvcommentF);
	$("#modibtn"+Num).css("display",""); //수정버튼 보이기
	$("#subbtn"+Num).css("display","none"); //취소,확인버튼 숨기기
	$("#commentTA"+Num).attr("disabled","disabled"); //관람평내용 비활성화
	if(recommendF==0){ //전역따봉이 비추천이면
		$("#upthumb"+Num).css("display","none"); //추천따봉가리기
		$("#downthumb"+Num).css("display",""); //비추따봉보이기
	}else{
		$("#downthumb"+Num).css("display","none"); //비추천따봉가리기
		$("#upthumb"+Num).css("display",""); //추따봉보이기
	}
	//쌍따봉 div가리기
	$("#modiRecommend"+Num).css("display","none");
	$("#Recommend"+Num).css("display","");
	//관람평내용 초기화하기
	
	$("#commentTA"+Num).val(rvcommentF);
	$("#commentTA"+Num).attr("disabled","disabled");
	
}

function toggleThumb(upNdown,Num){ //쌍따봉 토글명령
	console.log("업다운:"+upNdown+"/번호:"+Num);
	if(upNdown =='up'){//업따봉 눌름(비추)
		$("#upthumb"+Num).css("display","none");
		$("#downthumb"+Num).css("display","");
		
		$("#up"+Num).prop("checked","false");
		$("#down"+Num).prop("checked","true");
		
	}else{//비추따봉누름(추천)
		$("#upthumb"+Num).css("display","");
		$("#downthumb"+Num).css("display","none");
		
		$("#down"+Num).prop("checked","false");
		$("#up"+Num).prop("checked","true");
	}
}

function checkSubmit(Num){
	if($("#commentTA"+Num).val().length == 0 ){
		alert("관람평 내용을 입력해주세요");
		return false;
	}
	return true;
}
</script>

</html>
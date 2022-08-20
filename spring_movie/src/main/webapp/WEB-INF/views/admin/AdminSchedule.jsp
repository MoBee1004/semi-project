<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.CustomdNone{
display:none;
}

.dainput{
background-color:purple;
}
.selDiv{
background-color:pink;
}
.selDiv2{
background-color:pink;
}

input[type="checkbox"]+label{
	display:inline-block;
	width:40px;
	font-size:12px;
	color:white;
	padding:0px;
	padding-top:5px;
	padding-bottom:5px;
	border-radius:5px;
	background-color:gray;

}
input[type="checkbox"]:disabled+label{	
	background-color:purple;
}
input[type="checkbox"]:checked+label{	
	background-color:pink;
}

input[type="checkbox"]+label:hover{
	color:white;	
	background-color:lightblue;
}
input[type="checkbox"]:disabled+label:hover{	
	background-color:purple;
}
.customDiv{
display:inline-block;
width:35px;
margin:10px;

}


.m1{ /* 중 */

 
  animation: ani1 0.5s both;
}
.m2{ /* 상 */

 
  animation: ani2 0.5s both;
}
.m3{ /* 하 */

 
  animation: ani3 0.8s both;
}
@keyframes ani1{
 from {width: 50px; background-color:white;}
  to {width: 55%; background-color:pink;}
}
@keyframes ani2{
 from {width: 55%; background-color:pink;}
  to {width: 100%; background-color:hotpink;}
}
@keyframes ani3{
 from {width: 100%;background-color:hotpink;}
  to {width: 50px; background-color:white;}
}

.ohmyGod{
width:50px; height:40px; background-color:white; border-radius:19px; font-size:15px;
text-align:center;  padding-top:9px; color:black;
background-image: repeating-linear-gradient(pink, white,hotpink);
}
</style>
</head>

<script type="text/javascript">
console.log('msg내용 ${msg}');
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
                       	 AdminSchedule.jsp
                        </h1>
                    </div>
                    <!-- Content Row -->
                        <p>세션값 확인 아이디: ${sessionScope.loginId} </p>





                    <!-- Content Row -->
					<!-- 영화,극장,날짜및 시간, 상영관 선택 -->
					<div class="row">
					
						<div class="col-5" >
							<div class="card mb-4">
                            <div class="card-header">
                               영화목록
                            </div>
                            <div class="card-body listArea" style="height:320px; overflow-y:auto;">
 								  
 								<c:forEach items="${movieList}" var="movieList">
 								
 									
 									<div id = "${movieList.mvcode}" class="card pd" onclick="selectMovie('${movieList.mvcode}')">
 									${movieList.mvname}
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
                           		<div class="card-body listArea" style="height:320px; overflow-y:auto;">
                           		<c:forEach items="${theaterList}" var="theaterList">
 								
 									
 									<div  id = "${theaterList.thcode}" class="card pd" onclick="selectTheater('${theaterList.thcode}')">
 									${theaterList.thname}
 									</div>
 									
 								                       
                                </c:forEach>  
								</div>
							</div>
							
						</div>
						
						<div class="col-4">
						
							<div class="card" style="width:100%">
								<div class="card-header">
                               		날짜
                           		</div>
                           		<div class="card-body listArea"  style="height:320px; overflow:auto;">
                           			<div  class="card pd" >
                           			
										<div id="datepicker"></div>
										
										
									</div>																	
								</div>								
							</div>						
						</div>
					</div>
						
		


                    <!-- Content Row -->
					<!-- 선택항목 확인 -->
					<div class="row">
					
						<div class="col-7  " >
							<div class="card" style="height:250px; overflow-y:auto;">
								<div class="card-header">
                               	상영관및 시간 선택
                           		</div>
                           		<form id="formTag"action="insertScdata" method="post">
                           		<div class="card-body" id="reMvName" style="border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
                           			
									<input type="hidden" name="scmvcode" id="selmvcode">
									<input type="hidden" name="scthcode" id="selthcode">
									<input type="hidden" name="scdate" id="seldate">	
									<div id ="painput2" style="display:none; ">							
									<div class="row" id="imcrazy"  >
										
										<%-- <c:forEach var="theaterList" varStatus="Num" begin="1" end="6" step="1"> --%>
											<!-- <div  class="col-6" style="	font-size:0px;"> -->
											
 												<%-- <div class="customDiv" style="	font-size:20px;">${Num.index}관</div>
 												<input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and1" value="${Num.index}관09:30"> <label class="btn"onclick="selRoomTime('${Num.index}and1')" for="${Num.index}and1">09:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and2" value="${Num.index}관10:30"> <label class="btn"onclick="selRoomTime('${Num.index}and2')" for="${Num.index}and2">10:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and3" value="${Num.index}관11:30"> <label class="btn"onclick="selRoomTime('${Num.index}and3')" for="${Num.index}and3">11:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and4" value="${Num.index}관12:30"> <label class="btn"onclick="selRoomTime('${Num.index}and4')" for="${Num.index}and4">12:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and5" value="${Num.index}관13:30"> <label class="btn"onclick="selRoomTime('${Num.index}and5')" for="${Num.index}and5">13:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and6" value="${Num.index}관14:30"> <label class="btn"onclick="selRoomTime('${Num.index}and6')" for="${Num.index}and6">14:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and7" value="${Num.index}관15:30"> <label class="btn"onclick="selRoomTime('${Num.index}and7')" for="${Num.index}and7">15:30</label>
 										        <input style="display:none" type="checkbox" name="scdateList" id="${Num.index}and8" value="${Num.index}관16:30"> <label class="btn"onclick="selRoomTime('${Num.index}and8')" for="${Num.index}and8">16:30</label>   --%>             
                                			
                                			<!-- </div> -->
                                		<%-- </c:forEach>  --%>
                                		
                                	</div> 
                                	</div>
									
									 
								</div>
								</form>
							</div>
						</div>
						
						
					
					
						<div class="col-3  " >
							<div class="card" style="height:250px;">
								<div class="card-header">
                               	상영관및 시간 선택
                           		</div>
                           		
                           		<div class="card-body"  style="border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
                           			
									<div class="row" id="imcrazy2" style="display:none;">
										<div class="col-12">
											<div style="width:100%; background-image: repeating-linear-gradient(orange, yellow, brown); height:50px; border-radius:6px;"><div style="width:100%; height:50px; box-shadow: 5px 5px 5px 0px black inset; background-color:purple; border: 5px solid brown; border-radius:25px;"><div class="ohmyGod"   id="aniBox" onclick="changeBox(this)">클릭</div></div></div><br>
											<div onclick="selRandom()"><button class="btn bg-danger text-gray-100">랜덤생성</button></div>
											<div onclick="resetRandom()"><button class="btn bg-primary text-gray-100">초기화</button></div>
										</div>
                                	</div> 
									
									
								</div>
								
							</div>
						</div>
						
						


						<div class="col-2" >
							<div class="card" style="height:250px;">
								<div class="card-header">
								스케쥴 입력
								</div>
								<div class="card-body" style="text-align:center;">
									

								<button onclick="submitForm()"class="card bg-gradient-danger" style="padding:20px 10px; margin-top:50px; margin-right:auto; margin-left:auto;">입력확인</button>
								
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

	          
    <!-- datepicker -->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">	 
	 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	  

</body>
 <script>
 $.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});
 
  
  </script>


  
<script type="text/javascript">


var selectMvcodeF= null;
var selectThcodeF= null;
var selectDateF= null;

console.log("selectMvcodeF:"+selectMvcodeF);

function selectMovie(mvcode){
	console.log(mvcode);
	selectMvcodeF = mvcode;
	$("#selmvcode").val(selectMvcodeF);
	$(".selDiv").removeClass("selDiv");
	$("#"+mvcode).addClass("selDiv");
	openTime();
}

function selectTheater(thcode){
	console.log(thcode);
	selectThcodeF = thcode;
	$("#selthcode").val(selectThcodeF);
	$(".selDiv2").removeClass("selDiv2");
	$("#"+thcode).addClass("selDiv2");
	openTime();
}

$( function() {
    $( "#datepicker" ).datepicker({
    	onSelect:function(selDate){
    		console.log(selDate);
    		selectDateF=selDate;
    		$("#seldate").val(selectDateF);
    		openTime();
    	}
    });
  });

function openTime(){
	if(selectMvcodeF != null && selectThcodeF != null && selectDateF != null ){
		console.log("시간선택 조건 만족");
		
		
		
		$("#painput2").css("display","");
		
		$("#imcrazy2").css("display","");
		
		var thRoomList=['1관','2관','3관','4관','5관','6관'];
		var thTimeList=['09:30','10:30','11:30','12:30','13:30','14:30','15:30','16:30'];
		var thRoomTimeLength = thRoomList.length*thTimeList.length;
		
		var output="";
		for(var i = 0; i<thRoomList.length; i++){
			output += "<div  class=\"col-6\" style=\"font-size:0px;\">";
			output += "<div class=\"customDiv\" style=\"font-size:20px;\">"+thRoomList[i]+"</div>";
			
			for(var j = 0; j<thTimeList.length; j++){
				
				output +="<input style=\"display:none\" type=\"checkbox\" name=\"scdateList\" id=\""+(i+1)+"and"+(j+1)+"\" ";
				output +="value=\""+thRoomList[i]+thTimeList[j]+"\"> <label class=\"btn\"onclick=\"selRoomTime('"+(i+1)+"and"+(j+1)+"')\" for=\""+(i+1)+"and"+(j+1)+"\">"+thTimeList[j]+"</label>";				
			}
			output += "</div>";
		}
		$("#imcrazy").html(output);
		
		$.ajax({				
			type:"get",
			url:"getrecentroomtime_ajax",
			data: {"scmvcode" : selectMvcodeF,"scthcode": selectThcodeF,"scdate":selectDateF},
			dataType:"json",
			async: false,
			success: function(resultRoomTime){
				
				console.log(resultRoomTime.length);
				
				if(resultRoomTime.length > 0){
					
					for(var i =0; i<resultRoomTime.length; i++){	
						
						for(var j=0; j<thRoomTimeLength; j++){
							
							if(resultRoomTime[i].scdate == $("#imcrazy input").eq(j).val()){
								$("#imcrazy label").eq(j).attr("title",resultRoomTime[i].mvname);
				/* 				$("#imcrazy label").eq(j).css("background-image","url("+resultRoomTime[i].mvposter+")");
								$("#imcrazy label").eq(j).css("background-size","40px"); 
								$("#imcrazy label").eq(j).css("background-position","center");  //포스터입력부분인데 안이뻐서 빼버림*/
								$("#imcrazy input").eq(j).attr("disabled","disabled");
								
							}
							
						}
	
						
					}
						
				}
			}		
		});

	}
}


function selRoomTime(inputId){
	console.log($("#"+inputId).val());
}	

function submitForm(){
	var checkinputNum =$("input[name=scdateList]");
	var inputCount=0;
	for(var i =0; i<checkinputNum.length; i++){
		if(checkinputNum[i].checked){
			inputCount++;
		}
	}
	console.log(inputCount);
	if(inputCount==0){
		alert("상영관 및 시간 입력값 없음");
		return;
	}
	if($("#selmvcode").val().length==0){
		alert("영화 입력값 없음");
		return;
	}
	if($("#selthcode").val().length==0){
		alert("극장 입력값 없음");
		return;
	}if($("#seldate").val().length==0){
		alert("날짜 입력값 없음");
		return;
	}
	
	
	console.log("form태그 실행");
 	$("#formTag").submit();
}


function selRandom(){
	$("#imcrazy input").prop("checked",false);
	var howManyRandom=0;
	if($("#aniBox").hasClass("m3")){
		howManyRandom=8;
	}else if($("#aniBox").hasClass("m1")){
		howManyRandom=20;
	}else if($("#aniBox").hasClass("m2")){
		howManyRandom=39;
	}else{
		howManyRandom=8;
	}
	
	var numberList = [];
	
	
	var randomNum = 0;
	for (var i = 0; i < howManyRandom; i++) {

		randomNum = Math.round(Math.random() * 48) + 1;
				
		var check = true; 
		for (var j = 0; j < numberList.length; j++) {
			if(randomNum == numberList[j]) {
				check = false;
			}
		}
				
		if(check) {
			numberList[i] = randomNum;
					
		}else {
			i--; 	
		}
	}
	
	for(var i = 0; i< numberList.length; i++){
		var State = $("#imcrazy input").eq(numberList[i]).attr("disabled");
		console.log("getState:"+i+State);
 		if(!$("#imcrazy div input").eq(numberList[i]).is(":disabled")){
			
			$("#imcrazy div input").eq(numberList[i]).prop("checked",true);
		} 
	}

}

function changeBox(boxObj){
	console.log("changeBox실행");
	if($(boxObj).hasClass("m1")){
		$(boxObj).toggleClass("m1 m2");
	}else if($(boxObj).hasClass("m2")){
		$(boxObj).toggleClass("m2 m3");
	}else if($(boxObj).hasClass("m3")){
		$(boxObj).toggleClass("m3 m1");
	}else{
		$(boxObj).toggleClass("m1");
	}
		
}

function resetRandom(){
	console.log("resetRandom실행");
	$("#imcrazy input").prop("checked",false);
}
</script>

</html>
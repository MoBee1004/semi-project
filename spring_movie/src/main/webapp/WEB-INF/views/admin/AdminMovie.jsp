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
                        AdminMovie.jsp
                        </h1>
                    </div>

                    <!-- Content Row -->
                        <p>????????? ?????? ?????????: ${sessionScope.loginId} / ????????? : ${sessionScope.loginProfile}</p>


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
                                            <th>????????????</th>
                                            <th>????????????</th>                                            
                                            <th>??????</th>
                                            <th>????????????</th>
                                            <th>?????????</th>
                                            <th>????????????</th>
                                            <th>???????????????</th>
                                            <th>??????/?????????</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>????????????</th>
                                            <th>????????????</th>                                            
                                            <th>??????</th>
                                            <th>????????????</th>
                                            <th>?????????</th>
                                            <th>????????????</th>
                                            <th>???????????????</th>
                                            <th>??????/?????????</th>
                                            
                                           
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	
                                    	<c:forEach items="${mdtoList}" var="mvList" varStatus="Num">
                                        <tr>
                                			<td>${mvList.mvcode}
                                            </td>
                                            
                                            <td ><a href="movieView?mvcode=${mvList.mvcode}" class="text-secondary">${mvList.mvname}</a>
                                            </td>
                                            
                                           
                                            <td>${mvList.mvgenre}
                                            </td>
                                            
                                            <td>${mvList.mvage}
                                            </td>
                                            
                                            <td>${mvList.mvopen}
                                            </td>
                                            
                                            <td><button class="btn bg-primary text-gray-100" onclick="openModal('${mvList}')">????????????</button>
                                            </td>
                                            
                                             <td>
                                            
                                             <c:if test="${mvList.mvstate == 0}"><!-- ????????? ???????????????. ????????????+????????? ?????????????????????. -->
                                             	<div><div  class="divbg"><i id="whiteI${Num.index}" class="fa-solid fa-film live"></i></div><span id="whiteIS${Num.index}">?????????</span>
                                            	 </div>                                         	 
                                             </c:if>
                                             
                                             <c:if test="${mvList.mvstate == 1}"><!-- ???????????? ???????????????. ????????????+????????? ?????????????????????. -->
                                             	<div><div class="divbg"><i id="BlackI${Num.index}" class="fa-solid fa-film dead"></i></div><span id="BlackIS${Num.index}">?????????</span>
                                             	</div>
                                           
                                             </c:if>
                                             
                                            </td>
                                            
                                            <td style="text-align:center;">
                                            <c:choose>
                                            	<c:when test="${mvList.mvstate == 0}"><!-- ???????????? ????????? ??????????????? '????????????'?????????. -->
              										<button id= "btn0${Num.index}" onclick = "toggleState(this,'${mvList.mvcode}',${Num.index})" class="btn bg-gradient-secondary text-gray-100">????????????</button>           										
              									</c:when>
              									<c:otherwise><!-- ??????????????? ????????? ??????????????? '?????????'?????????. -->
              										<button id= "btn1${Num.index}" onclick = "toggleState(this,'${mvList.mvcode}',${Num.index})" class="btn bg-gradient-primary text-gray-100">?????????</button>
              										
              									</c:otherwise>
              								</c:choose>
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
    
   <div class="modal fade" id="mvInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
        aria-hidden="true" >
        <div class="modal-dialog" role="document" style="margin-left: 500px;">
            <div class="modal-content" style="width:1000px;" >
            
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">?????? ?????? ??????</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <form action="adminModifyMovie" onsubmit="return checkModiInfo()" method="post">
              		  <div class="modal-body" style="text-align:center; vertical-align:middle; " >
					
						 <input type="text" name="mvcode" id="mvcode" readonly>
						 <input type="text" name="mvname" id="mvname" readonly>	

                		 <input type="text" name="mvpd" id="mvpd" >

                		 <input type="text" name="mvactor" id="mvactor">

                		 <input type="text" name="mvgenre" id="mvgenre" >
                		 <input type="text" name="mvage" id="mvage" >

                		 <input type="text" name="mvtime" id="mvtime" >
                		 <input type="text" name="mvopen" id="mvopen">
                		 
                		 
                
                	
                	 
                		
              	 	</div>
              		<div class="modal-footer" style="text-align:center; vertical-align:middle; " >
              		   <button>??????</button>
              	   </div>
                </form>

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
    <!-- ????????? -->

    <!-- Page level custom scripts -->
     <!-- ????????? -->


<script type="text/javascript">
var scMsg ='${scMsg}';
if(scMsg.length >0){
	alert(scMsg);
}


var reInfoFlash= '${reservInfoflash}';
	console.log("flashAttri??????"+reInfoFlash);
if(reInfoFlash.length>0){
	$("#reservModal").modal('show');
}

function toggleState(btnObj,mvcode,num){
	
	if($(btnObj).hasClass("bg-gradient-primary")){
		var mvstate= '0';
		
	}else if($(btnObj).hasClass("bg-gradient-secondary")){
		var mvstate= '1';
	}	
	console.log(mvstate);
	 
	
	$.ajax({
		type : "get",
		url : "toggleState_ajax",		
		data : {"mvcode": mvcode,"state":mvstate},		
		async: false,
		success : function(result){
			console.log(result);

			
			if(result == 'OK'){
				$(btnObj).toggleClass("bg-gradient-primary");
				$(btnObj).toggleClass("bg-gradient-secondary");
								
				$("#whiteI"+num).toggleClass("live").toggleClass("dead");				
				$("#BlackI"+num).toggleClass("live").toggleClass("dead");
			
				
				
				if(mvstate=='0'){
					console.log("????????????????????????"); 
					$(btnObj).text("????????????");
					$("#whiteIS"+num).text("?????????");
					$("#BlackIS"+num).text("?????????");
					
				}else{
					console.log(" ?????????????????????");
					$(btnObj).text("?????????");
					$("#whiteIS"+num).text("?????????");
					$("#BlackIS"+num).text("?????????");
				}
			}else{
				console.log("???????????? ??????");
			}
		}
	});	
}

function openModal(mvObj){
	console.log("???????????????:"+mvObj);
	var row = mvObj.replaceAll(", ",",").split('(')[1].split(')')[0].split(',mv');
	
	var movieData={};
	for(var i =0; i<row.length; i++){
		var key = row[i].split('=')[0];
		var val = row[i].split('=')[1];
		movieData[key] = val;
	}
	
	console.log("????????? ????????? ??????:"+movieData.pd);
	console.log("????????? ????????? ??????:"+movieData.actor);
	console.log("????????? ????????? ??????:"+movieData.genre);
	console.log("????????? ????????? ??????:"+movieData.age);
	console.log("????????? ????????? ??????:"+movieData.time);
	console.log("????????? ????????? ??????:"+movieData.open);
	
	 $("#mvcode").val(movieData.mvcode);
	 $("#mvname").val(movieData.name);
	 $("#mvpd").val(movieData.pd);
	 $("#mvactor").val(movieData.actor);
	 $("#mvgenre").val(movieData.genre);
	 $("#mvage" ).val(movieData.age);
	 $("#mvtime" ).val(movieData.time);		
	 $("#mvopen").val(movieData.open);
		
	console.log("movieData.mvcode",movieData.mvcode);
	$("#mvInfoModal").modal('show'); 
}

function checkModiInfo(){
	console.log("checkModiInfo ??????:#mvpd.val()"+$("#mvcode").val());
	 if($("#mvpd").val().length ==0){
		 console.log("???????????????");
		 return false;
	 } 
	 if($("#mvactor").val().length ==0){
		 console.log("???????????????");
		 return false;
	 } 
	 if($("#mvgenre").val().length ==0){
		 console.log("???????????????");
		 return false;
	 } 
	 if($("#mvage" ).val().length ==0){
		 console.log("???????????????");
		 return false;
	 } 
	 if($("#mvtime" ).val().length ==0){
		 console.log("???????????????");
		 return false;
	 } 
	 if($("#mvopen").val().length ==0){
		 console.log("???????????????");
		 return false;
	 } 
	 
	return true;
}

$('#example tfoot th').each( function () {
    var title = $('#example thead th').eq( $(this).index() ).text();
    $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
} );
 
// DataTable
var table = $('#example').DataTable();
 
// Apply the filter
table.columns().every( function () {
    var column = this;
 
    $( 'input', this.footer() ).on( 'keyup change', function () {
        column
            .search( this.value )
            .draw();
    } );
} );
</script>
    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>


</html>
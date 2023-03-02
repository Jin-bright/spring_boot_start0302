<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param  value="Hello springboooooot" name="title" />
</jsp:include>	

<style>
	div.menu-test{width:50%; margin:0 auto; text-align:center;}
	div.result{width:70%; margin:0 auto;}
</style>
<%--  이미 어떤기능에 대해서 url이 다 나와야됨 
	   get /menu   -- select * from menu (모든메뉴조회) 
	   get /menu/type/kr  -- 한식만 조회 
	   get /menu/type/ch  -- 중식만 조회 
	   get /menu/type/jp  -- 일식만 조회 
	   get /menu/taste/mild  -- 순한맛만 조회 
	   get /menu/taste/hot   -- 매운맛만 조회 
	   get /menu/10   -- 10번 메뉴 조회 (한건조회)   // 10을 {id} 이렇게 쓸거임 path variable(경로변수)

	   post /menu  -- 메뉴 한건 등록  create  - 비동기통신 .. script로 요청보낼거임 / 실제 데이터를 json 형식으로 (pom ) 

	   put /menu --  메뉴 한건에 대해 전체 수정 update ?  

	   patch /menu  --  메뉴 한건에 대해 일부 수정 update ?  

	   delete /menu/10  -- 메뉴 한건 삭제 delete   --%>

<%--  	<img src="${pageContext.request.contextPath }/images/logo-spring.png" id="center-image" alt="스프링로고" class="d-block mx-auto mt-5"/> --%>


<div id="menu-container" class="text-center">
<!-- 1.GET /menu -->
      <div class="menu-test">
	  	<h4>전체메뉴조회(GET)</h4>
	    	<input type="button" class="btn btn-block btn-outline-success btn-send" id="btn-menu" value="전송" />
	  </div>
	  <div class="result" id="menu-result"></div>
	       
       
<!-- 2.GET /menu/type/kr /menu/type/ch /menu/type/jp 타입별 조회 -->
     <div class="menu-test">
        <h4>메뉴 타입별 조회(GET)</h4>
        <select class="form-control" id="typeSelector">
			<option value="" disabled selected>음식타입선택</option>
			<option value="kr">한식</option>
			<option value="ch">중식</option>
			<option value="jp">일식</option>
        </select>
    </div>
    <div class="result" id="menuType-result"></div>
    
<!-- 3.GET /menu/type/kr/test/mild  -->
    <div class="menu-test">
        <h4>메뉴 타입/맛별 조회(GET)</h4>
        <form name="menuTypeTasteFrm">
            <div class="form-check form-check-inline">
                <input type="radio" class="form-check-input" name="type" id="get-no-type" value="all" checked>
                <label for="get-no-type" class="form-check-label">모두</label>&nbsp;
                <input type="radio" class="form-check-input" name="type" id="get-kr" value="kr">
                <label for="get-kr" class="form-check-label">한식</label>&nbsp;
                <input type="radio" class="form-check-input" name="type" id="get-ch" value="ch">
                <label for="get-ch" class="form-check-label">중식</label>&nbsp;
                <input type="radio" class="form-check-input" name="type" id="get-jp" value="jp">
                <label for="get-jp" class="form-check-label">일식</label>&nbsp;
            </div>
            <br />
            <div class="form-check form-check-inline">
                <input type="radio" class="form-check-input" name="taste" id="get-no-taste" value="all" checked>
                <label for="get-no-taste" class="form-check-label">모두</label>&nbsp;
                <input type="radio" class="form-check-input" name="taste" id="get-hot" value="hot">
                <label for="get-hot" class="form-check-label">매운맛</label>&nbsp;
                <input type="radio" class="form-check-input" name="taste" id="get-mild" value="mild">
                <label for="get-mild" class="form-check-label">순한맛</label>
            </div>
            <br />
            <input type="submit" class="btn btn-block btn-outline-success btn-send" value="전송" >
        </form>
    </div>
    <div class="result" id="menuTypeTaste-result"></div>
</div>

<script>
const frm = document.menuTypeTasteFrm;
	
frm.addEventListener("submit", (e) => {
	e.preventDefault(); 
	console.log(e);
	const ty = frm.type.value;
	const ta = frm.taste.value;

	$.ajax({
		url : `${pageContext.request.contextPath}/menu/type/\${ty}/taste/\${ta}`,
		method : 'get',
		success(data){
			console.log( data );
			renderMenuTable("#menuTypeTaste-result", data);
		},
		error : console.log
	})
	
	
});

</script>

<script>
document.querySelector("#typeSelector").addEventListener("change", (e) => {
	console.log( e.target.value );
	
	$.ajax({
		url : `${pageContext.request.contextPath}/menu/type/\${e.target.value}`,
		method : 'get',
		success(data){
			console.log( data );
			renderMenuTable("#menuType-result", data);
		},
		error : console.log
	})
});
</script>



<script>
document.querySelector("#btn-menu").addEventListener("click", (e) => {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/menu",
		method : "get",
		success(data){
		//	console.log(data);	
			renderMenuTable("#menu-result", data);
		},
		error : console.log
	});
	
});
</script>

<script>
// selector 하위에 메뉴테이블을 생성 
// 번호 음식점 메뉴명 가격 타입 맛 
const renderMenuTable = (selector, data) => {
 	
  const div = document.querySelector(selector);
	
  let html = `
		<table class='table table-hover'>
			<thead>
				<tr>
					<th scope='col'>번호</th>		
					<th scope='col'>음식점</th>		
					<th scope='col'>메뉴명</th>		
					<th scope='col'>가격</th>		
					<th scope='col'>타입</th>		
					<th scope='col'>맛</th>
				</tr>
			</thead>
			<tbody>
	`;
  
  
//반복처리 
  if(data.length){
	  data.forEach( (e, index)=>{
		  
		  
		  const {id, restaurant, name, price, type, taste} = e;
		  console.log ( e );
	
		  html += `
			  <tr>
				<td>\${id}</td>
				<td>\${restaurant}</td>
				<td>\${name}</td>
				<td>￦\${price.toLocaleString()}</td>
				<td>\${type}</td>
				<td>\${taste}</td>
			</tr>`; 
		  
		});
  }
  else{
	  html += `<tr><td class="text-center" colspan="6">조회된 결과가 없습니다.</td></tr>`
  }

	html += `
		</tbody>
	</table>`;
    
	div.innerHTML += html;

};
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
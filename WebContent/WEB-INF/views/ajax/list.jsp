<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<h1>AJAX LIST</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
      <th scope="col">작성시간</th>
    </tr>
  </thead>
  <tbody id="tBody">
  </tbody>
</table>
<button onclick="goPage('/ajax/insert')">글쓰기</button>
<button onclick="refresh()">재조회</button>
<script>
	function refresh(){
		var xhr = new XMLHttpRequest();
		xhr.open('GET','/ajax/board/list?cmd=list');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					var list = JSON.parse(xhr.responseText);
					var tBody = document.getElementById('tBody');
					var html = '';
					for(var i=0;i<list.length;i++){
						html += '<tr>';
						html += '<td>' + list[i].biNum + '</td>';
						html += '<td><a href="/views/ajax/view?biNum=' + list[i].biNum + '">' + list[i].biTitle + '</a></td>';
						html += '<td>' + list[i].credat + '</td>';
						html += '<td>' + list[i].cretim+ '</td>';
						html += '</tr>';
					}
					tBody.innerHTML = html;
				}
			}
		}
		xhr.send();
	}
	window.onload = refresh;
</script>
</body>
</html>
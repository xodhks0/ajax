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
<div class="container">
	<h3>게시물 작성</h3>
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
			<td><input type="text" id="biTitle" placeholder="제목을 작성해주세요"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="biContent" rows="10" cols="50"></textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="number" id="uiNum" value="3"></td>
		</tr>
		<tr>
			<th colspan="2"><button onclick="save()">저장</button></th>
		</tr>
	</table>
</div>
<script>
	function save(){
		var xhr = new XMLHttpRequest();
		xhr.open('POST','/ajax/board/insert');
		xhr.setRequestHeader('Content-Type','application/json');
		xhr.onreadystatechange = function(){
			if(xhr.readyState!=4) return;
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				alert(res.msg)
			}
		}
		var param = {
				biTitle : document.getElementById('biTitle').value,
				biContent : document.getElementById('biContent').value,
				uiNum : document.getElementById('uiNum').value
		}
		console.log(param);
		param = JSON.stringify(param);
		xhr.send(param);
	}
</script>
</body>
</html>
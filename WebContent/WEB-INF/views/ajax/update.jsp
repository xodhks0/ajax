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
		<h3 align="center">게시물 수정</h3>
		<table class="table table-bordered">
			<tr>
				<th>게시물 번호</th>
				<td>${param.biNum}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" id="biTitle" value="${param.biTitle}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="biContent" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="number" id="uiNum"></td>
			</tr>
			<tr>
				<th colspan="2"><button onclick="update()">수정</button></th>
			</tr>
		</table>
	</div>

	<script>
		function update() {
			var inputs = document.querySelectorAll('[id]');
			var param = {};
			
			for(var idx in inputs) {
				var input = inputs[idx];
				if(input.id) {
					param[input.id] = input.value;
				}
			}
			console.log(param);
		}
		function ajax(conf) {
			var xhr = new XMLHttRequest()
			{
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						conf.callback(xhr.responseText);
					}
				}
			}
		}
		var board = {
			biTitle : '제목',
			biContent : '내용',
			uiNum : 3
		};
		var inputs = document.querySelectorAll('[id]');
		for ( var idx in inputs) {
			var input = inputs[idx];
			if (input.id) {
				input.value = board[input.id];
			}
		}
		var param = (conf.param)?conf.param:'';
		xhr.send(param);

		//var inputs = document.querySelector('#biTitle');
		// == document.getElementById('biTitle');

		var conf = {
			method : 'GET',
			url : '/ajax/board/view?cmd=view&biNum=${param.biNum}',
			callback : function(res) {
				var board = JSON.parse();
				var intputs = document.querySelectorAll('[id]');
				for ( var idx in inputs) {
					var input = inputs[idx];
					if (input.id) {
						input.value = board[input.id];
					}
				}

			}
		}
		ajax(conf);
	</script>
</body>
</html>
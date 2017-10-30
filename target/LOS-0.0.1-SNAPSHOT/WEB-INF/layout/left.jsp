<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="col-xs-12 col-sm-7">
		<div class="tab-wrap">
			<div class="media">
				<div class="parrent pull-left">
					<ul class="nav nav-tabs nav-stacked">
						<li name="N" class=""><a href="${pageContext.request.contextPath }/board/N/boardList.do">Notice</a></li>
						<li name="F" class=""><a href="${pageContext.request.contextPath }/board/F/boardList.do">Board</a></li>
						<li name="Q" class=""><a href="${pageContext.request.contextPath }/board/Q/boardList.do">QnA</a></li>
						<li name="A" class=""><a href="${pageContext.request.contextPath }/board/A/boardList.do">Archive</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
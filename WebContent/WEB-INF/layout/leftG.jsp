<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<li name="G" class=""><a href="${pageContext.request.contextPath }/management/groupList.do">Group</a></li>
						<li name="P" class=""><a href="${pageContext.request.contextPath }/board/F/boardList.do">Project</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="leftt">
   	<form name="form1" action="findIDResult.htm" method="post">
    <fieldset>
     <legend class="hidden"> ID/비밀번호 찾기 </legend>
     <ul id="findID">
      <li>ID찾기</li>
      <li><label>· E-mail </label><input type="text" id="Email" name="Email" /></li>
      <li><label>· 이름 </label> <input type="text" id="name" name="name" /></li>
      <li>
       <input type="button" name="btnFindUid" id="btnFindUid" value="아이디 찾기" />
      </li>
     </ul>
    </fieldset>
   </form>
  </div>
</body>
</html>
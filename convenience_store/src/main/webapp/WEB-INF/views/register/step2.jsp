<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title><spring:message code="user.register" /></title>

    <!-- 부트스트랩 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
        .error {
            color: red; font-weight: bold;
        }
    </style>
  </head>
  <body>
    <h2><spring:message code="user.info" /></h2>
    
    <form:form action="step3" commandName="registerRequest">
        <p>
            <form:label path="email"><spring:message code="email" /></form:label><br>
            <form:input path="email" placeholder="your-mail@mail.com" required="required" />
            <form:errors path="email" cssClass="error"/>
        </p>
        <p>
            <form:label path="nickname"><spring:message code="nickname" /></form:label><br>
            <form:input path="nickname" placeholder="nickname" required="required"/>
            <form:errors path="nickname" cssClass="error"/>
        </p>
        <p>
            <form:label path="password"><spring:message code="password" /></form:label><br>
            <form:password path="password" placeholder="Password" required="required" />
            <form:errors path="password" cssClass="error"/>
        </p>
        <p>
            <form:label path="confirmPassword"><spring:message code="password.confirm" /></form:label><br>
            <form:password path="confirmPassword" placeholder="Conform password" required="required"/>
            <form:errors path="confirmPassword" cssClass="error"/>
        </p>
        
        <input type="submit" value="<spring:message code="register.btn" />" >
    </form:form>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="/resources/js/jQuery-2.1.4.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="contextPath" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Import do Bootstrap -->
    <link rel="stylesheet" href="${contextPath}resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Import de Fonte -->
    <link rel="stylesheet" href="${contextPath}resources/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Importe de icones -->
    <link rel="stylesheet" href="${contextPath}resources/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Importe do Tema AdminLTE -->
    <link rel="stylesheet" href="${contextPath}resources/dist/css/AdminLTE.min.css">
    <!-- Importe do iCheck -->
    <link rel="stylesheet" href="${contextPath}resources/dist/css/blue.css">
    <!-- Importe do Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page login-bg" style="background: linear-gradient(white, lightblue);">
<div class="login-box">
    <div class="login-logo">
        <a href="#">Apostila ADMIN</a>
    </div>
    
    <c:if test="${not empty loginError }">
	    <div class="callout callout-danger">
	        <h4>${loginError }</h4>
	    </div>
    </c:if>  
    
    <div class="login-box-body">
        <p class="login-box-msg">Entre com suas informações para logar</p>
        
        <form action="#" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="login" class="form-control" required>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="senha" class="form-control" required>
            </div>
            <div class="row">
            <div class="col-xs-8">
            </div>
            <!-- /.col -->
            <div class="col-xs-12">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
            </div>
            <!-- /.col -->
            </div>
        </form>
    </div>
</div>
</body>
</html>
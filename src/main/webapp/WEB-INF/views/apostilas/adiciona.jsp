<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:url value="/" var="contextPath" />
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Apostilas | Manutenção</title>
  	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  	<link rel="stylesheet" href="${contextPath}resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  	<!-- Font Awesome -->
  	<link rel="stylesheet" href="${contextPath}resources/bower_components/font-awesome/css/font-awesome.min.css">
  	<!-- Ionicons -->
  	<link rel="stylesheet" href="${contextPath}resources/bower_components/Ionicons/css/ionicons.min.css">
  	<!-- Theme style -->
  	<link rel="stylesheet" href="${contextPath}resources/dist/css/AdminLTE.min.css">
  	<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  	<link rel="stylesheet" href="${contextPath}resources/dist/css/skins/skin-blue.min.css">
  	<!-- Google Font -->
  	<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Header -->
  <c:import url="../comum/header.jsp" />
  
  <!-- Aside -->
  <c:import url="../comum/menu.jsp" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Manutenção
        <small>Adicionar Apostila</small>
      </h1>
      <ol class="breadcrumb">
        <li>Home</li>
        <li>Apostilas</li>
        <li class="active">Adicionar Apostila</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <!-- Horizontal Form -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Informações sobre a apostila - Preencha todos os campos!</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="${s:mvcUrl('AC#adicionar').build() }" method="POST">
              <div class="box-body">
              	<input type="hidden" value="${apostila.idApostila }" name="idApostila">
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Descrição</label>
                  <div class="col-sm-2">
                    <input type="text" value="${apostila.descricao }" class="form-control" name="descricao" id="descricao" disabled>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Páginas</label>
                  <div class="col-sm-2">
                    <input type="text" onkeypress="validate(event)" value="${apostila.paginas }" class="form-control" name="paginas" id="paginas" disabled>
                  </div>
                </div>
                
                <div class="form-group">
                <label class="col-sm-5 control-label">Tipo Apostila</label>
                <div class="col-sm-2">
                	<input type="text" value="${apostila.tipo }" class="form-control" name="tipo" id="tipo" disabled>
                </div>
              </div>
              
              <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Quantidade*</label>
                  <div class="col-sm-2">
                    <input type="text" onkeypress="validate(event)" class="form-control" name="quantidade" id="quantidade" required>
                  </div>
                </div>
              
              </div>
              <div align="center" class="box-footer">
                <button type="submit" class="btn btn-primary btn-md">Adicionar</button>
              </div>  
            </form>
          </div>
    </section>
  </div>
  
  <!-- Rodapé -->
  <c:import url="../comum/rodape.jsp" />

</div>
<script>
function validate(evt) {
	  var theEvent = evt || window.event;
	  var key = theEvent.keyCode || theEvent.which;
	  key = String.fromCharCode( key );
	  var regex = /[0-9]|\./;
	  if( !regex.test(key) ) {
	    theEvent.returnValue = false;
	    if(theEvent.preventDefault) theEvent.preventDefault();
	  }
}
</script>
<!-- jQuery 3 -->
<script src="${contextPath}resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${contextPath}resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}resources/dist/js/demo.js"></script>
<!-- InputMask -->
<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
</body>
</html>
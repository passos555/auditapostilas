<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:url value="/" var="contextPath" />
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Alunos | Manutenção</title>
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
        <small>Alterar Aluno(a)</small>
      </h1>
      <ol class="breadcrumb">
        <li>Home</li>
        <li>Alunos</li>
        <li class="active">Alterar Aluno(a)</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <!-- Horizontal Form -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Informações sobre o(a) aluno(a) - Preencha todos os campos!</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="${s:mvcUrl('AC#alterarAluno').build() }" method="POST">
              <div class="box-body">
              <input type="hidden" value="${aluno.idAluno }" name="idAluno">
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Nome*</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" value="${aluno.nome }" name="nome" id="nome" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Email*</label>
                  <div class="col-sm-2">
                    <input type="email" class="form-control" value="${aluno.email }" name="email" id="email" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Celular*</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" value="${aluno.celular }" name="celular" id="celular" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">Data de Nasc.*</label>
                  <div class="col-sm-2">
                  <fmt:formatDate value="${aluno.dtNasc.time }" pattern="dd/MM/yyyy" var="dtFormat"/>
                    <input type="text" value="${dtFormat }" class="form-control" name="dtNasc" id="dtNasc" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-5 control-label">CPF*</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" value="${aluno.cpf }" name="cpf" id="cpf" required>
                  </div>
                </div>
                
                <div class="form-group">
                <label class="col-sm-5 control-label">Sexo*</label>
                <div class="col-sm-2">
                <select name="sexo" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
                  <c:forEach items="${sexos }" var="sexo">
                  	<c:choose>
                  	<c:when test="${sexo == aluno.sexo }">
                  		<option value="${sexo}" selected>${sexo}</option>
                  	</c:when>
                  	<c:otherwise>
                  		<option value="${sexo}">${sexo}</option>
                  	</c:otherwise>
                  </c:choose>
                  </c:forEach>
                </select>
                </div>
              </div>
              
              <div class="form-group">
              <label class="col-sm-5 control-label">Apostilas</label>
              <div class="col-sm-2"> 
                  <select name="apostilas" multiple="" class="form-control" disabled="">
                  <c:forEach items="${apostilas }" var="apostila">
                  	<option value="${apostila.idApostila}">${apostila.descricao} - ${apostila.tipo}</option>
                  </c:forEach>
                  </select>
              </div>
              </div>
              
              </div>
             
              <div align="center" class="box-footer">
                <button type="submit" class="btn btn-primary btn-md">Alterar</button>
              </div>  
            </form>
          </div>
    </section>
  </div>
  
  <!-- Rodapé -->
  <c:import url="../comum/rodape.jsp" />

</div>

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
<script>
 $(function () {

    //Datemask dd/mm/yyyy
    $('#dtNasc').inputmask('dd/mm/yyyy');
    
    //CPFMask
    $('#cpf').inputmask('999.999.999-99');
    
    //Telefone
    $('#celular').inputmask('(99) 99999-9999');
  })
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<c:url value="/" var="contextPath" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Alunos | Consulta</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${contextPath}resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${contextPath}resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${contextPath}resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="${contextPath}resources/dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Header -->
  <c:import url="../comum/header.jsp" />
  
  <!-- Aside -->
  <c:import url="../comum/menu.jsp" />
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1 style="margin-bottom:10px;">
        Consulta
        <small>Alunos Cadastrados</small>
      </h1>
      <c:if test="${not empty sucesso }">
        <div class="callout callout-success" style="margin-bottom:0px;">
            <h4>${sucesso }</h4>
          </div>
        </c:if>
        <c:if test="${not empty erro }">
        <div class="callout callout-danger" style="margin-bottom:0px;">
            <h4>${erro }</h4>
          </div>
      </c:if>    	
      <ol class="breadcrumb">
        <li>Home</li>
        <li>Alunos</li>
        <li class="active">Consultar</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Alunos cadastrados no sistema</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="tabelaApostilas" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Nome</th>
                  <th>CPF</th>
                  <th>Data Nasc.</th>
                  <th>Email</th>
                  <th>Celular</th>
                  <th>Sexo</th>
                  <th width="5%">Adicionar</th>
                  <th width="5%">Alterar</th>
                </tr>
                </thead>
                <tbody>
                 <c:forEach items="${alunos }" var="aluno">
	                <tr>
	                  <td>${aluno.nome }</td>
	                  <td>${aluno.cpf }</td>
	                  <td><fmt:formatDate value="${aluno.dtNasc.time }" pattern="dd/MM/yyyy"/></td>
	                  <td>${aluno.email }</td>
	                  <td>${aluno.celular }</td>
	                  <td>${aluno.sexo }</td>
	                  <td align="center"><a title="Adicionar apostila" href="${s:mvcUrl('AC#apostilasForm').arg(0,aluno.idAluno).build() }"><i class="fa fa-plus-circle"></i></a></td>
	                  <td align="center"><a href="${s:mvcUrl('AC#detalheAluno').arg(0,aluno.idAluno).build() }"><i class="fa fa-wrench"></i></a></td>
	                </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  
 <!-- Rodapé -->
  <c:import url="../comum/rodape.jsp" />

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<script src="${contextPath}resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${contextPath}resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${contextPath}resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${contextPath}resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}resources/dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $('#tabelaApostilas').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : true,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>
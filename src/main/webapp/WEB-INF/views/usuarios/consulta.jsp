<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
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
  <title>Usuários | Consulta</title>
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
        <small>Usuários Cadastrados</small>
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
        <li>Usuários</li>
        <li class="active">Consultar</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Usuários cadastrados no sistema</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="tabelaApostilas" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Login</th>
                  <th>Senha</th>
                  <th>Permissão</th>
                  <th>Status</th>
                  <th width="8%">Alterar Status</th>
                  <th width="5%">Alterar</th>
                </tr>
                </thead>
                <tbody>
                 <c:forEach items="${usuarios }" var="usuario">
	                <tr>
	                  <td>${usuario.login }</td>
	                  <td>${usuario.senha }</td>
	                  <td>${usuario.permissao }</td>
	                  <c:choose>
	                   <c:when test="${usuario.status == 'Ativo'}">
	                   		<td><span class="label label-success">${usuario.status }</span></td>
	                   		<td align="center">
		                  	<a class="open-Remove" href="#modal-remove" data-usuario-id="${usuario.idUsuario }"
		                  	 data-toggle="modal" data-target=".modal2"><i class="fa fa-remove"></i></a>
	                  </td>
	                   </c:when>
	                   <c:otherwise>
	                   		<td><span class="label label-danger">${usuario.status }</span></td>
	                   		<td align="center">
		                  	<a href="${s:mvcUrl('UC#ativar').arg(0, usuario.idUsuario).build() }"><i class="fa fa-check"></i></a></td>
	                   </c:otherwise>
	                  </c:choose>
	                  <td align="center">
	                  	<a class="open-Alt" href="#modal-altera" data-usuario-id="${usuario.idUsuario }"
	                  	 data-usuario-login="${usuario.login }" data-usuario-senha="${usuario.senha }" data-usuario-permissao="${usuario.permissao }"
	                  	 data-toggle="modal" data-target=".modal1"><i class="fa fa-wrench"></i></a>
	                  </td>
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
  
   <div class="modal fade modal1" id="modal-altera">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Alterar Usuário</h4>
         </div>
         <div class="modal-body">
          <form class="form-horizontal" action="${s:mvcUrl('UC#alterar').build() }" method="POST">
              <div class="box-body">
              	<input type="hidden" value="${usuario.idUsuario }" name="idUsuario" id="idUsuario">
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Login*</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" value="" name="login" id="login" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Senha*</label>
                  <div class="col-sm-5">
                    <input type="text" value="" class="form-control" name="senha" id="senha" required>
                  </div>
                </div>
                
                <div class="form-group">
                <label class="col-sm-4 control-label">Permissão*</label>
                <div class="col-sm-5">
                <select name="permissao" id="permissao" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
                  <c:forEach items="${permissoes }" var="permissao">
                  	<c:choose>
                  	<c:when test="${permissao == usuario.permissao }">
                  		<option value="${permissao}" selected>${permissao}</option>
                  	</c:when>
                  	<c:otherwise>
                  		<option value="${permissao}">${permissao}</option>
                  	</c:otherwise>
                  </c:choose>
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
       <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
 </div>
 
    <div class="modal modal-danger fade modal2" id="modal-remove">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Desativar Usuário</h4>
         </div>
         <div class="modal-body">
          <form class="form-horizontal" action="${s:mvcUrl('UC#remover').build() }" method="POST">
              <div class="box-body">
              	<input type="hidden" value="${usuario.idUsuario }" name="idUsuario" id="idUsuario">
                <div class="form-group">
                  <label for="nome" class="col-sm-2 control-label"></label>
                  <div class="col-sm-8">
                    <p style="font-size:18px;">Tem certeza que deseja desativar este usuário?</p>
                  </div>
                </div>
              </div>
              <div align="center" class="box-footer" style="background-color:#d33724;border-top:0px;">
                <button type="submit" class="btn btn-outline btn-md">Desativar</button>
              </div>  
            </form>
       </div>
       <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
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
$(document).ready(function () {
	
	  //your code here
	$(document).on("click", ".open-Alt", function () {
	     var usuarioId = $(this).data('usuario-id');
	     var usuarioLogin = $(this).data('usuario-login');
	     var usuarioSenha = $(this).data('usuario-senha');
	     var usuarioPermissao = $(this).data('usuario-permissao');
	     $(".modal-body #idUsuario").val( usuarioId );
	     $(".modal-body #login").val( usuarioLogin );
	     $(".modal-body #senha").val( usuarioSenha );
	     $(".modal-body #permissao").val( usuarioPermissao );
	     // As pointed out in comments, 
	     // it is superfluous to have to manually call the modal.
	     // $('#addBookDialog').modal('show');
	});
	  
	$(document).on("click", ".open-Remove", function () {
	     var usuarioId = $(this).data('usuario-id');
	     $(".modal-body #idUsuario").val( usuarioId );
	     // As pointed out in comments, 
	     // it is superfluous to have to manually call the modal.
	     // $('#addBookDialog').modal('show');
	});  
});

</script>
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
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
  <title>Log | Usuários</title>
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
<style>
input{
 	border-width:0px;
 	border:none;
 	width:100%;
 }
</style>
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
        <small>Log Usuário</small>
      </h1> 	
      <ol class="breadcrumb">
        <li>Home</li>
        <li>Logs</li>
        <li class="active">Usuários</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Operações realizadas na tabela usuários</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="tabelaApostilas" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Usuário</th>
                  <th>Data</th>
                  <th>Transação</th>
                  <th>Usuário Modificado</th>
                  <th width="10%">Mais Informações</th>
                </tr>
                </thead>
                <tbody>
                 <c:forEach items="${logs }" var="log">
	                <tr>
	                  <td>${log.userLogado.login }</td>
	                  <td>${log.dt }</td>
	                  <c:choose>
	                   <c:when test="${log.transacao == 'Alteração'}">
	                   		<td><span class="label label-warning">${log.transacao }</span></td>
	                   </c:when>
	                   <c:when test="${log.transacao == 'Ativação'}">
	                   		<td><span class="label label-success">${log.transacao }</span></td>
	                   </c:when>
	                   <c:when test="${log.transacao == 'Inserção'}">
	                   		<td><span class="label label-info">${log.transacao }</span></td>
	                   </c:when>
	                   <c:otherwise>
	                   		<td><span class="label label-danger">${log.transacao }</span></td>
	                   </c:otherwise>
	                  </c:choose>
	                  <td>${log.userModificado.login }</td>
	                  <td align="center"><a class="open-Info" href="#modal-info" data-log-id="${log.idLogUsuario }"
	                  	 data-log-antes="${log.antes }" data-log-depois="${log.depois }"
	                  	 data-target=".modal" data-toggle="modal">
	                  	 <i class="fa fa-plus-circle"></i></a></td>
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
  
  
  <div class="modal fade modal" id="modal-info">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Informações Log</h4>
         </div>
         <div class="modal-body">
          <form class="form-horizontal" action="/auditapostias/logs/alunos" method="POST">
              <div class="box-body">
              	<input type="hidden" value="" name="idLog" id="idLog">
                <div class="form-group">
                <table class="table table-striped" style="border:2px solid;">
                <tbody><tr>
                  <th width="12%" style="border-right:2px solid;">Info.</th>
                  <th width="44%">Antes</th>
                  <th width="44%">Depois</th>
                </tr>
                <tr>
                  <td style="border-right:2px solid;">Login</td>
                  <td>
                  	<input type="text" name="antes0" id="antes0" readOnly>
                  </td>
                  <td>
     				<input type="text" name="depois0" id="depois0" readOnly>
                  </td>
                </tr>
                <tr>
                  <td style="border-right:2px solid;">Senha</td>
                  <td>
                  	<input type="text" name="antes1" id="antes1" readOnly style="background-color:#f9f9f9;">
                  </td>
                  <td>
                    <input type="text" name="depois1" id="depois1" readOnly style="background-color:#f9f9f9;">
                  </td>
                </tr>
                <tr>
                  <td style="border-right:2px solid;">Permissão</td>
                  <td><input type="text" name="antes2" id="antes2" readOnly></td>
                  <td>
                    <input type="text" name="depois1" id="depois2" readOnly>
                  </td>
                </tr>
                <tr>
                  <td style="border-right:2px solid;">Status</td>
                  <td><input type="text" name="antes3" id="antes3" readOnly style="background-color:#f9f9f9;"></td>
                  <td>
                    <input type="text" name="depois3" id="depois3" readOnly style="background-color:#f9f9f9;">
                  </td>
                </tr>
              </tbody></table>
                </div>
              </div>
              <div align="center" class="box-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
              </div>  
            </form>
       </div>
       <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
 </div>	
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
	$(document).on("click", ".open-Info", function () {
	     var logId = $(this).data('log-id');
	     if($(this).data('log-id') != ''){
	    	 var antes = $(this).data('log-antes');
	    	 var depois = $(this).data('log-depois').split(';');
	    	 console.log(antes);
	    	 if(antes != ''){
	    		 antes = $(this).data('log-antes').split(';');
	    		 for(i = 0; i < antes.length; i++){
	    	    	 $(".modal-body #antes"+i+"").val( antes[i] );
	    	     }
	    	 } else {
	    		 for(i = 0; i < depois.length; i++){
	    	    	 $(".modal-body #antes"+i+"").val( '' );
	    	     }
	    	 }
	     }

	     for(i = 0; i < depois.length; i++){
	    	 $(".modal-body #depois"+i+"").val( depois[i] );
	     }
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
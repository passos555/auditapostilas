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
                  <th>Status</th>
 				  <th width="8%">Alterar Status</th>
                  <th width="5%">Adicionar</th>
                  <th width="5%">Alterar</th>
                </tr>
                </thead>
                <tbody>
                 <c:forEach items="${alunos }" var="aluno">
	                <tr>
	                  <td>${aluno.nome }</td>
	                  <td>${aluno.cpf }</td>
	                  <td>${aluno.dtNasc }</td>
	                  <td>${aluno.email }</td>
	                  <td>${aluno.celular }</td>
	                  <td>${aluno.sexo }</td>
	                  <c:choose>
	                   <c:when test="${aluno.status == 'Ativo'}">
	                   		<td><span class="label label-success">${aluno.status }</span></td>
	                   		<td align="center">
		                  	<a class="open-Remove" href="#modal-remove" data-aluno-id="${aluno.idAluno }"
		                  	 data-toggle="modal" data-target=".modal3"><i class="fa fa-remove"></i></a></td>
		                    <td align="center">
		                  	<a class="open-AddApostila" href="#modal-adiciona" data-aluno-id="${aluno.idAluno }"
		                  	 data-aluno-nome="${aluno.nome }" data-aluno-cpf="${aluno.cpf }" data-toggle="modal"
		                  	 data-target=".modal1">
		                  	 <i class="fa fa-plus-circle"></i></a>
	                  		</td>
	                   </c:when>
	                   <c:otherwise>
	                   		<td><span class="label label-danger">${aluno.status }</span></td>
	                   		<td align="center">
		                  	<a href="${s:mvcUrl('AC#ativarAluno').arg(0, aluno.idAluno).build() }"><i class="fa fa-check"></i></a></td>
		                  	<td></td>
	                   </c:otherwise>
	                  </c:choose>
	                  <td align="center">
	                  	<a class="open-Alt" href="#modal-adiciona" data-aluno-id="${aluno.idAluno }"
	                  	 data-aluno-nome="${aluno.nome }" data-aluno-cpf="${aluno.cpf }" data-aluno-email="${aluno.email }"
	                  	 data-aluno-celular="${aluno.celular }" data-aluno-dtnasc="${aluno.dtNasc }" data-aluno-sexo="${aluno.sexo }" 
	                  	 data-aluno-apostilas="${aluno.apostilas }" data-toggle="modal" data-target=".modal2">
	                  	 <i class="fa fa-wrench"></i></a>
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
  
  <div class="modal fade modal1" id="modal-adciona">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Adicionar Apostila</h4>
         </div>
         <div class="modal-body">
          <form class="form-horizontal" action="${s:mvcUrl('AC#adicionarApostila').build() }" method="POST">
              <div class="box-body">
              <input type="hidden" value="${aluno.idAluno }" name="idAluno" id="idAluno">
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Nome</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" value="" name="nome" id="nome" disabled>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">CPF</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" value="" name="cpf" id="cpf" disabled>
                  </div>
                </div>
                
                <div class="form-group">
                <label class="col-sm-4 control-label">Apostila*</label>
                <div class="col-sm-5">
                <select name="idApostila" id="idApostila" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
                  <c:forEach items="${apostilas }" var="apostila">
                  	<option value="${apostila.idApostila}" selected>${apostila.descricao} - ${apostila.tipo}</option>
                  </c:forEach>
                </select>
                </div>
              </div>
              
              </div>
              <div align="center" class="box-footer">
                <button type="submit" class="btn btn-primary btn-md">Adicionar</button>
              </div>  
            </form>   
       </div>
       <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
 </div>
 
 <div class="modal fade modal2" id="modal-adciona">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Alterar Aluno</h4>
         </div>
         <div class="modal-body">
          <form class="form-horizontal" action="${s:mvcUrl('AC#alterarAluno').build() }" method="POST">
              <div class="box-body">
              <input type="hidden" value="${aluno.idAluno }" id="idAluno" name="idAluno">
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Nome*</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" value="" name="nome" id="nome" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Email*</label>
                  <div class="col-sm-5">
                    <input type="email" class="form-control" value="" name="email" id="email" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Celular*</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" value="" name="celular" id="celular" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Data de Nasc.*</label>
                  <div class="col-sm-5">
                    <input type="text" value="" class="form-control" name="dtNasc" id="dtNasc" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">CPF*</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" value="" name="cpf" id="cpf" required>
                  </div>
                </div>
                
                <div class="form-group">
                <label class="col-sm-4 control-label">Sexo*</label>
                <div class="col-sm-5">
               <select name="sexo" id="sexo" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
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
              <label class="col-sm-4 control-label">Apostilas</label>
              <div class="col-sm-5"> 
                  <select name="apostilas" id="apostilas" multiple="" class="form-control" disabled="">
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
  
  <div class="modal modal-danger fade modal3" id="modal-remove">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Desativar Aluno</h4>
         </div>
         <div class="modal-body">
          <form class="form-horizontal" action="${s:mvcUrl('AC#removerAluno').build() }" method="POST">
              <div class="box-body">
              	<input type="hidden" value="" name="idAluno" id="idAluno">
                <div class="form-group">
                  <label for="nome" class="col-sm-2 control-label"></label>
                  <div class="col-sm-8">
                    <p style="font-size:18px;">Tem certeza que deseja desativar este(a) aluno(a)?</p>
                  </div>
                </div>
              </div>
              <div align="center" class="box-footer" style="background-color:#d33724;border-top:0px;">
                <button type="submit" class="btn btn-outline btn-md">Remover</button>
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
<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- page script -->
<script>
$(document).ready(function () {
	$(document).on("click", ".open-AddApostila", function () {
	     var alunoId = $(this).data('aluno-id');
	     var alunoNome = $(this).data('aluno-nome');
	     var alunoCpf = $(this).data('aluno-cpf');
	     $(".modal-body #idAluno").val( alunoId );
	     $(".modal-body #nome").val( alunoNome );
	     $(".modal-body #cpf").val( alunoCpf );
	     // As pointed out in comments, 
	     // it is superfluous to have to manually call the modal.
	     // $('#addBookDialog').modal('show');
	});
	
	$(document).on("click", ".open-Alt", function () {
	     var alunoId = $(this).data('aluno-id');
	     var alunoNome = $(this).data('aluno-nome');
	     var alunoCpf = $(this).data('aluno-cpf');
	     var alunoEmail = $(this).data('aluno-email');
	     var alunoCelular = $(this).data('aluno-celular');
	     var alunoSexo = $(this).data('aluno-sexo');
	     var alunoDtNasc = $(this).data('aluno-dtnasc');
	     var alunoApostilas = $(this).data('aluno-apostilas');
	     
	     if(alunoApostilas != ''){
	    	 var apostilas = alunoApostilas.slice(1, -1).split(",");
		     for(var i = 0; i < apostilas.length; i++){
		    	 $(".modal-body #apostilas").append('<option value=' + i + '>' + apostilas[i] + '</option>');
		     }
	     }
	     
	     $(".modal-body #idAluno").val( alunoId );
	     $(".modal-body #nome").val( alunoNome );
	     $(".modal-body #email").val( alunoEmail );
	     $(".modal-body #celular").val( alunoCelular );
	     $(".modal-body #cpf").val( alunoCpf );
	     $(".modal-body #sexo").val( alunoSexo );
	     $(".modal-body #dtNasc").val( alunoDtNasc );
	     $(".modal-body #apostilas").val( alunoApostilas );
	     
	     // As pointed out in comments, 
	     // it is superfluous to have to manually call the modal.
	     // $('#addBookDialog').modal('show');
	});
	
	$(document).on("click", ".open-Remove", function () {
	     var alunoId = $(this).data('aluno-id');
	     $(".modal-body #idAluno").val( alunoId );
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
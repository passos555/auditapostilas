<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <title>Home</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="resources/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="resources/bower_components/morris.js/morris.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="resources/dist/css/skins/skin-blue.min.css">

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
  <c:import url="comum/header.jsp" />
  <c:import url="comum/menuHome.jsp"></c:import>
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Dashboard
        <small>Informações Gerais</small>
      </h1>
      <ol class="breadcrumb">
        <li>Home</li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    
 	<section class="content" style="min-height:0px;">
 	<input type="hidden" id="entradas" value="${entradas }">
 	<input type="hidden" id="saidas" value="${saidas }">
 	<input type="hidden" id="alunosAtivos" value="${alunosAtivos }">
 	<input type="hidden" id="alunosInativos" value="${alunosInativos }">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${movimentos }</h3>
              <p>Movimento(s) realizado(s) este mês</p>
            </div>
            <div class="icon">
              <i class="ion ion-arrow-move"></i>
            </div>
            <a href="/auditapostilas/movimentos/consulta" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${apostilas }</h3>

              <p>Apostila(s) no estoque</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="/auditapostilas/apostilas/consulta" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${alunos }</h3>
              <p>Aluno(s)</p>
            </div>
            <div class="icon">
              <i class="ion ion-person"></i>
            </div>
            <a href="/auditapostilas/alunos/consulta" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>2</h3>
              <p>Gráficos</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#graficos" class="open-Graficos small-box-footer">Mostrar <i class="fa fa-arrow-circle-down"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
    </section>
    
    <section class="content" id="graficos">
      <!-- Small boxes (Stat box) -->
      <div class="row">
       <div class="col-md-6">
       <div class="box box-danger">
            <div class="box-header with-border">
            <i class="fa fa-bar-chart-o"></i>
              <h3 class="box-title">Tipos de Movimento</h3>
            </div>
            <div class="box-body chart-responsive">
              <div class="chart" id="apostilas-chart" style="height: 300px; position: relative;"><svg height="300" version="1.1" width="756" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><path fill="none" stroke="#3c8dbc" d="M377.75,243.33333333333331A93.33333333333333,93.33333333333333,0,0,0,465.9777551949771,180.44625304313007" stroke-width="2" opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#3c8dbc" stroke="#ffffff" d="M377.75,246.33333333333331A96.33333333333333,96.33333333333333,0,0,0,468.81364732624417,181.4248826052307L510.0916327924656,195.6693795646951A140,140,0,0,1,377.75,290Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#f56954" d="M465.9777551949771,180.44625304313007A93.33333333333333,93.33333333333333,0,0,0,294.03484627831415,108.73398312817662" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#f56954" stroke="#ffffff" d="M468.81364732624417,181.4248826052307A96.33333333333333,96.33333333333333,0,0,0,291.34400205154566,107.40757544301087L256.6620097954186,90.31165416754118A135,135,0,0,1,505.3651459070204,194.03833029452744Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#00a65a" d="M294.03484627831415,108.73398312817662A93.33333333333333,93.33333333333333,0,0,0,377.72067846904883,243.333328727518" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#00a65a" stroke="#ffffff" d="M291.34400205154566,107.40757544301087A96.33333333333333,96.33333333333333,0,0,0,377.71973599126824,246.3333285794739L377.7075884998742,284.9999933380171A135,135,0,0,1,256.6620097954186,90.31165416754118Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="377.75" y="140" text-anchor="middle" font-family="&quot;Arial&quot;" font-size="15px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 15px; font-weight: 800;" font-weight="800" transform="matrix(1.2867,0,0,1.2867,-108.3116,-43.2978)" stroke-width="0.7771577380952381"><tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" dy="6">Download Sales</tspan></text><text x="377.75" y="160" text-anchor="middle" font-family="&quot;Arial&quot;" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 14px;" transform="matrix(1.9444,0,0,1.9444,-356.8524,-143.5556)" stroke-width="0.5142857142857143"><tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" dy="5">12</tspan></text></svg></div>
            </div>
            <!-- /.box-body -->
          </div>
      </div>
      <div class="col-md-6">
       <!-- Donut chart -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-bar-chart-o"></i>

              <h3 class="box-title">Alunos</h3>
            </div>
            <div class="box-body">
              <div class="chart" id="alunos-chart" style="height: 300px; position: relative;"><svg height="300" version="1.1" width="756" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><path fill="none" stroke="#3c8dbc" d="M377.75,243.33333333333331A93.33333333333333,93.33333333333333,0,0,0,465.9777551949771,180.44625304313007" stroke-width="2" opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#3c8dbc" stroke="#ffffff" d="M377.75,246.33333333333331A96.33333333333333,96.33333333333333,0,0,0,468.81364732624417,181.4248826052307L510.0916327924656,195.6693795646951A140,140,0,0,1,377.75,290Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#f56954" d="M465.9777551949771,180.44625304313007A93.33333333333333,93.33333333333333,0,0,0,294.03484627831415,108.73398312817662" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#f56954" stroke="#ffffff" d="M468.81364732624417,181.4248826052307A96.33333333333333,96.33333333333333,0,0,0,291.34400205154566,107.40757544301087L256.6620097954186,90.31165416754118A135,135,0,0,1,505.3651459070204,194.03833029452744Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#00a65a" d="M294.03484627831415,108.73398312817662A93.33333333333333,93.33333333333333,0,0,0,377.72067846904883,243.333328727518" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#00a65a" stroke="#ffffff" d="M291.34400205154566,107.40757544301087A96.33333333333333,96.33333333333333,0,0,0,377.71973599126824,246.3333285794739L377.7075884998742,284.9999933380171A135,135,0,0,1,256.6620097954186,90.31165416754118Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="377.75" y="140" text-anchor="middle" font-family="&quot;Arial&quot;" font-size="15px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 15px; font-weight: 800;" font-weight="800" transform="matrix(1.2867,0,0,1.2867,-108.3116,-43.2978)" stroke-width="0.7771577380952381"><tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" dy="6">Download Sales</tspan></text><text x="377.75" y="160" text-anchor="middle" font-family="&quot;Arial&quot;" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 14px;" transform="matrix(1.9444,0,0,1.9444,-356.8524,-143.5556)" stroke-width="0.5142857142857143"><tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" dy="5">12</tspan></text></svg></div>
            </div>
            <!-- /.box-body-->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        </div>
      <!-- /.row -->
    </section>
    
  	<section class="content">
  		<div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Objetivos Mensais</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <!-- /.col -->
                <div class="col-md-12">
                  <p class="text-center">
                    <strong>Progresso</strong>
                  </p>
                  <div class="progress-group">
                    <span class="progress-text">Novos Aluno</span>
                    <c:choose>
                    <c:when test="${novosAlunos <= 0 }">
                    <span class="progress-number"><b>0</b>/5</span>
                    <div class="progress sm">
                      <div class=""></div>
                    </div>
                    </c:when>
                    <c:when test="${novosAlunos <= 5 }">
                    <span class="progress-number"><b>${novosAlunos}</b>/5</span>
                    <div class="progress sm">
                      <div class="progress-bar progress-bar-aqua" style="width:${porcentagem}%;"></div>
                    </div>
                    </c:when>
                    <c:when test="${novosAlunos > 5 }">
                    <span class="progress-number"><b>${novosAlunos}</b>/5</span>
                    <div class="progress sm">
                      <div class="progress-bar progress-bar-green" style="width:100%;"></div>
                    </div>
                    </c:when>
                    </c:choose>
                  </div>
                  <!-- /.progress-group -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- ./box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
  	</section> 
  
  </div>
  <!-- Rodapé -->
  <c:import url="comum/rodape.jsp" />


<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script src="${contextPath}resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextPath}resources/bower_components/raphael/raphael.min.js"></script>
<script src="${contextPath}resources/bower_components/morris.js/morris.min.js"></script>

<!-- SlimScroll -->
<script src="${contextPath}resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${contextPath}resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}resources/dist/js/demo.js"></script>
<script>
  $(function () {
	
  $(document).on("click", ".open-Graficos", function () {
	     $("#graficos").toggle();
	});
	  
   "use strict";
   //DONUT CHART
   var donut = new Morris.Donut({
     element: 'apostilas-chart',
     resize: true,
     colors: ["#3c8dbc", "#f56954"],
     data: [
       {label: "Entradas", value: $('#entradas').val()},
       {label: "Saídas", value: $('#saidas').val()},
     ],
     hideHover: 'auto'
   });
   
   var donut = new Morris.Donut({
	     element: 'alunos-chart',
	     resize: true,
	     colors: ["#009551", "#c64333"],
	     data: [
	       {label: "Ativos", value: $('#alunosAtivos').val()},
	       {label: "Inativos", value: $('#alunosInativos').val()},
	     ],
	     hideHover: 'auto'
	   });
  });
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel" style="margin-bottom:15px;">
        <div class="pull-left image">
          <img src="resources/dist/img/usuario.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${usuarioLogado.login }</p>
          <p>${date }</p>
          <p><i class="fa fa-circle text-success"></i>Online - <a href="logout">Logout</a></p>
        </div>
      </div>
        
      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <!-- Optionally, you can add icons to the links -->
        <!--<li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>-->
        <li class="treeview">
          <a href="#"><i class="fa fa-users"></i> <span>Alunos</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/auditapostilas/alunos/consulta"><i class="fa fa-search"></i> Consultar</a></li>
            <li><a href="/auditapostilas/alunos/novo"><i class="fa fa-plus-circle"></i> Novo</a></li>
          </ul>
        </li>
         <li class="treeview">
          <a href="#"><i class="fa fa-book"></i> <span>Apostilas</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/auditapostilas/apostilas/consulta"><i class="fa fa-search"></i> Consultar</a></li>
            <li><a href="/auditapostilas/apostilas/novo"><i class="fa fa-plus-circle"></i> Novo</a></li>
          </ul>
        </li>
        <c:if test="${usuarioLogado.permissao == 'Audit'}">
        <li class="treeview">
          <a href="#"><i class="fa fa-book"></i> <span>Usu�rios</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
	          <ul class="treeview-menu">
	            <li><a href="/auditapostilas/usuarios/consulta"><i class="fa fa-search"></i> Consultar</a></li>
	            <li><a href="/auditapostilas/usuarios/novo"><i class="fa fa-plus-circle"></i> Novo</a></li>
	          </ul>
        </li>
        </c:if>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
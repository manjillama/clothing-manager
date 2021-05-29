<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="/" class="logo" style="background:#000;color:#FFF !important;border-bottom: 1px solid hsla(0,0%,100%,.2);">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><img src="/public/images/favicon.ico" style="height: 27px;vertical-align: text-bottom;"><b> DASHBOARD</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <%-- <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i> ${pageContext.request.userPrincipal.name}<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out</a></li>
            </ul>
          </li>
        </ul>
      </div> --%>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <div class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <!-- <li class="header">MAIN NAVIGATION</li> -->
        <li>
          <a href="/">
            <i class="fa fa-cubes"></i> <span>Orders</span>
          </a>
        </li>
        <li>
          <a href="/customers">
            <i class="fa fa-users" aria-hidden="true"></i>
            <span>Customers</span>            
          </a>
        </li>
        <li>
          <a href="/referrals">
            <i class="fa fa-star" aria-hidden="true"></i>
            <span>Pending Referrals</span>            
          </a>
        </li>
        <li>
          <a href="/todo">
            <i class="fa fa-sticky-note" aria-hidden="true"></i>
            <span>To Do</span>            
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-area-chart" aria-hidden="true"></i>
            <span>Analytics</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">            
			<li><a href="/analytics/sales"><small><i class="fa fa-circle-o"></i></small> Sales</a></li>
			<li><a href="/analytics/demographics"><small><i class="fa fa-circle-o"></i></small> Demographics</a></li>
			<li><a href="/analytics/men"><small><i class="fa fa-circle-o"></i></small> Men</a></li>
			<li><a href="/analytics/women"><small><i class="fa fa-circle-o"></i></small> Women</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /.sidebar -->
  </aside>
  
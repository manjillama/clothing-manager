<%@ include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12" style="margin-top: 15px">
				<button id="yearDec" class="btn btn-primary"><i class="fa fa-chevron-left"></i> Prev Year</button>
		        <button id="yearInc" class="btn pull-right btn-primary">Next Year <i class="fa fa-chevron-right"></i></button>
			</div>
		</div>
		<div class="col-md-12 a-chart">
			<canvas id="myChart" height="400"></canvas>
		</div>
		
		<div class="col-md-12 a-chart">
			<canvas id="myProfit" height="400"></canvas>
		</div>
      
	</div>
	<!-- Container fluid -->
</div>
<!-- Content Wrapper -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.bundle.min.js"></script> 
<script src="/public/chart.js"></script>
<%@ include file="../includes/footer.jsp" %>

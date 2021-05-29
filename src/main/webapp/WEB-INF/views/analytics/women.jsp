<%@ include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="col-md-12 a-chart">
			<div>
				<h3>Sold Product Type Distribution For Women</h3>
			</div>
			<div>
				<canvas id="myTypesCtx" data-type="women" height="400"></canvas>
			</div>
		</div>
      
	</div>
	<!-- Container fluid -->
</div>
<!-- Content Wrapper -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.bundle.min.js"></script> 
<script src="/public/chart.js"></script>
<%@ include file="../includes/footer.jsp" %>

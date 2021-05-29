<%@ include file="includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">        
   		<div class="row">
			<div class="col-md-12">
				<br/><br/>
				<h2 class="text-center" style="margin:0">AWESOME CONGRATS!!!</h2>
				<br/>
				<div class="text-center" style="max-width:700px;margin:0 auto">
					<h4 style="font-size: 16px;">${customer.fullname} will have Gravty credit of worth Rs.</h4>
					<form:form method="POST" action="/referrals/resolve" commandName="customer">
						<form:input type="hidden" value='${param["referredBy_id"]}' path="id"/>
						<input type="hidden" value='${param["referredTo_id"]}' name="referredTo_id"/>
						<div class="form-group">
							<form:input class="form-control" type="number" path="credits" required="required" placeholder="Credits" style="font-size: 24px;height: 40px;"/>
						</div>					
						<button class="btn btn-success">RESOLVE</button>
						<a href="/referrals" class="btn btn-default">CANCEL</a>
						
					</form:form>
				</div>
			</div><!-- End job list -->
		</div>
	</div>
	<!-- Couidntainer fl -->
</div>
<!-- Content Wrapper -->
<%@ include file="includes/footer.jsp" %>

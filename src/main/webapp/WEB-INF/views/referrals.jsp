<%@ include file="includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
		<h3>Pending Referrals</h3>
		<div class="row">
	        <div class="col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-red"><i class="fa fa-exclamation" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Pending Referrals</span>
	              <span class="info-box-number">${referralCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
      </div><!-- Stat box -->    
        
      <div class="row">
	  	<div class="col-md-12">
			<h4>Customers</h4>
			<table class="table table-responsive table-hover">
				<tr class="success">
					<th>Referred By</th>
					<th>Referred To</th>
					<th>Referred Date</th>
					<th>Action</th>
				</tr>
				<c:forEach items="${referrals}" var="referral">
					<tr>
						<td><a href="/view/customer/${referral.referredBy.id}" class="btn btn-sm btn-default">${referral.referredBy.fullname}</a></td>
						<td><a href="/view/customer/${referral.customer.id}" class="btn btn-sm btn-default">${referral.customer.fullname}</a></td>
						<td><fmt:formatDate type = "date" value = "${referral.customer.joinedDate}" /></td>
						<td><a href="referrals/resolve?referredBy_id=${referral.referredBy.id}&referredTo_id=${referral.customer.id}" class="btn btn-sm btn-warning">RESOLVE</a></td>
					</tr>
				</c:forEach>
			</table>
			
			<c:if test="${fn:length(referrals) < 1}">
			   <p class="text-center"><i class="fa fa-check-square-o" aria-hidden="true"></i> No Referrals Pending</p>
			</c:if>
			
			<nav aria-label="Page navigation" class="text-center">
		        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
		    </nav>
		    
		    
		</div>
	  </div><!-- End job list -->
      
	</div>
	<!-- Couidntainer fl -->
</div>
<!-- Content Wrapper -->
<!-- <script src="/public/dist/jquery.twbsPagination.js"></script> -->
<%@ include file="includes/footer.jsp" %>

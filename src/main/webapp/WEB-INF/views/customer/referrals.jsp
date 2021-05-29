<%@ include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
			<a href="/view/customer/${customer.id}" style="margin-top:15px;display:block"><i class="fa fa-chevron-left" aria-hidden="true"></i> Back To Customer</a>
	
		<h3><i class="fa fa-user-circle-o" aria-hidden="true"></i> ${customer.fullname}</h3>
		<div class="row" style="margin-top: 15px;">
		
			<div class="col-sm-6 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="fa fa-star" aria-hidden="true" style="line-height: 90px;"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Total Referrals</span>
	              <span class="info-box-number">${referralsCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        
			 <div class="col-sm-6 col-sm-6 col-xs-12">
		          <div class="info-box">
		            <span class="info-box-icon bg-success"><i class="fa fa-usd" aria-hidden="true" style="line-height: 90px;"></i></span>
	        	    <div class="info-box-content">
		              <span class="info-box-text">Credits</span>
		              <h3 style="margin:0;margin-top:5px"><small>Rs.</small> ${customer.credits}</h3>
		            </div>
		            <!-- /.info-box-content -->
		          </div>
		          <!-- /.info-box -->
	        </div>	        
	        
		</div><!-- row -->     
        
      <div class="row">
		<div class="col-md-12">
			<h4>Referred Customers</h4>
				<table class="table table-responsive table-hover">
					<tr class="success">
						<th>Name</th>
						<th>Referred Date</th>
						<th>Contact Number</th>
						<th>Status</th>
					</tr>
					<c:forEach items="${referrals}" var="referral">
						<tr>
							<td><a href="/view/customer/${referral.id}" class="btn btn-sm btn-default">${referral.fullname}</a></td>
							<td><fmt:formatDate type = "date" value = "${referral.joinedDate}" /></td>
							<td>${referral.contactNumber }</td>
							<td>
								<c:choose>
									<c:when test="${referral.referralPending eq true}">
										<span class="label label-warning">Pending</span>
									</c:when>
									<c:otherwise>
										<span class="label label-success">Resolved</span>
									</c:otherwise>
								</c:choose>
								
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<c:if test="${fn:length(referrals) < 1}">
				   <p class="text-center">No Referrals Yet :(</p>
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
<script src="/public/dist/jquery.twbsPagination.js"></script> 
<%@ include file="../includes/footer.jsp" %>

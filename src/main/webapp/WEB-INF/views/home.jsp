<%@ include file="includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
		<h3>Recent Orders</h3>
		<div class="row">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-green"><i class="fa fa-shopping-bag" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Total Items Sold</span>
	              <span class="info-box-number">${soldItemCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <a href="/customers" class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="fa fa-users" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Total Customers</span>
	              <span class="info-box-number">${customerCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	
	        <!-- fix for small devices only -->
	        <div class="clearfix visible-sm-block"></div>
	
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-yellow"><i class="fa fa-calendar-check-o" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Current Month Orders</span>
	              <span class="info-box-number">${currentMonthOrderCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <a href="/referrals" class="info-box">
	            <span class="info-box-icon bg-red"><i class="fa fa-exclamation" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Pending Referrals</span>
	              <span class="info-box-number">${pendingReferralCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
      </div><!-- Stat box -->    
        
      <div class="row">
      	<div class="col-md-12">
			<div class="row">
				<form action="/" method="GET">
					<div class="form-group col-md-4">
						<input type="text" class="form-control" style="width: 100%"
							value='${param["order_id"]}' name="order_id"
							placeholder="Search using order id" required />
					</div>
					<div class="form-group col-md-2">
						<button class="btn btn-success" style="width: 100%" type="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
      	
		<div class="col-md-12">
			<h4>Recent Orders</h4>
			
			<div class="table-responsive">
				<table class="table table-hover">
					<tr class="success">
						<th>Id</th>
						<th>Grand Total</th>
						<th>Ordered Date</th>
						<th>Customer Name</th>
						<th>Contact No.</th>
						<th>Source</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${orders}" var="order">
						<tr>
							<td>${order.id}</td>
							<td>Rs. ${order.grandTotal}</td>
							<td><fmt:formatDate type = "date" value = "${order.orderedDate}" /></td>
							<td><a style="color:#337ab7 !important" href="/view/customer/${order.customer.id}">${order.customer.fullname}</a></td>
							<td>${order.customer.contactNumber}</td>
							<td>
								<c:choose>
									<c:when test="${order.customer.source eq 'Instagram' }">
										<span class="label bg-maroon">${order.customer.source}</span>
									</c:when>
									<c:when test="${order.customer.source eq 'Facebook' }">
										<span class="label label-primary">${order.customer.source}</span>
									</c:when>
									<c:otherwise>
										<span class="label label-default">${order.customer.source}</span>										
									</c:otherwise>
								</c:choose>								
							</td>
							<td>
								<a href="/order/view/${order.id}" class="btn btn-default"><i class="fa fa-eye" aria-hidden="true"></i></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
							
			<c:if test="${fn:length(orders) < 1}">
			   <p class="text-center">No Orders Yet :(</p>
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
<%@ include file="includes/footer.jsp" %>

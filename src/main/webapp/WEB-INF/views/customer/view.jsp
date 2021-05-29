<%@ include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
		<c:if test="${param.success!=null}">
			<div class="alert alert-success alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
				</button>
				<i class="fa fa-check" aria-hidden="true"></i> Action Successful!</b>
			</div>
		</c:if>	
	
		<h3><i class="fa fa-user-circle-o" aria-hidden="true"></i> ${customer.fullname}</h3>

		<div class="row" style="margin-top: 15px;">
			 <div class="col-sm-3 col-sm-6 col-xs-12">
		          <div class="info-box">
		            <span class="info-box-icon bg-blue"><i class="fa fa-credit-card" aria-hidden="true" style="line-height: 90px;"></i></span>
		            <div class="info-box-content">
		              <span class="info-box-text">Credits</span>
		              <h3 style="margin:0;margin-top:5px"><small>Rs.</small> ${customer.credits}</h3>
		            </div>
		            <!-- /.info-box-content -->
		          </div>
		          <!-- /.info-box -->
	        </div>
	        	        
			 <div class="col-sm-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-olive"><i class="fa fa-shopping-bag" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Total Orders</span>
	             <span class="info-box-number">${fn:length(customer.customerOrders)}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        
	        <div class="col-sm-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-purple"><i class="fa fa-shopping-bag" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Items Brought</span>
	             <span class="info-box-number">${itemsCount}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        
	        
	        <div class="col-sm-3 col-sm-6 col-xs-12">
	          <a href="/view/customer/referral/${customer.id}" class="info-box">
	            <span class="info-box-icon bg-maroon"><i class="fa fa-star" aria-hidden="true" style="line-height: 90px;"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">${customer.fullname.split(" ")[0]}'s Referrals</span>
	              <span class="info-box-number">${countReferrals}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
	        
	        <div class="col-xs-6">
		          <div class="info-box">
		            <span class="info-box-icon bg-success"><i class="fa fa-usd" aria-hidden="true" style="line-height: 90px;"></i></span>
		            <div class="info-box-content">
		              <span class="info-box-text">Total Spending</span>
		              <h3 style="margin:0;margin-top:5px"><small>Rs.</small> ${totalSpending}</h3>
		            </div>
		            <!-- /.info-box-content -->
		          </div>
		          <!-- /.info-box -->
	        </div>
	        
	        <div class="col-xs-6">
	          <a href="#" data-toggle="modal" data-target="#myModal" class="info-box">
	            <span class="info-box-icon bg-orange"><i class="fa fa-plus" aria-hidden="true" style="line-height: 90px;"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text"><strong>Create Order</strong></span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
		</div><!-- row -->    
	
		<div class="row">
			<div class="col-md-12">
				<div style="background: #FFF; padding:15px;border-radius: 10px;}">
					<h4>Information</h4>
					<ul class="list-unstyled" style="line-height: 26px;">
						<li><i class="fa fa-user-o" aria-hidden="true"></i> ${customer.gender}</li>
						<li><i class="fa fa-phone" aria-hidden="true"></i> ${customer.contactNumber}</li>
						<li><i class="fa fa-map-marker" aria-hidden="true"></i> ${customer.address}</li>
						<li>Joined Date: <fmt:formatDate type = "date" value = "${customer.joinedDate}" /></li>
						<li>Source: ${customer.source}</li>
					</ul>
				</div>
				
			</div>
			<div class="col-md-12">
				<h4>Orders</h4>
				<table class="table table-responsive table-hover">
					<tr class="success">
						<th>Id</th>
						<th>Grand Total</th>
						<th>Ordered Date</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${customer.customerOrders}" var="order">
						<tr>
							<td>${order.id}</td>
							<td>Rs. ${order.grandTotal}</td>
							<td><fmt:formatDate type = "date" value = "${order.orderedDate}" /></td>
							<td>
								<a href="/order/view/${order.id}" class="btn btn-default"><i class="fa fa-eye" aria-hidden="true"></i></a>
								<a href="/order/delete/${customer.id}/${order.id}" onclick="return confirm('Are you sure to delete?')"  class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<c:if test="${fn:length(customer.customerOrders) < 1}">
				   <p class="text-center">No Orders Yet :(</p>
				</c:if>
				
			</div><!-- End of column -->
			<div class="col-md-12 text-right">
				<br/>
				<a href="/customers/delete/${customer.id}" onclick="return confirm('Are you sure to delete?')" class="label label-danger">Delete Customer</a>
			</div>
		</div>      
	</div>
	<!-- Container fluid -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="/order/${customer.id}/create" method="GET">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-truck" aria-hidden="true"></i> Delivery price</h4>
	      </div>
	      <div class="modal-body">
        	<div class="form-group">
        		<label for="dPrice">Delivery Price</label>
        		<input id="dPrice" name="deliveryPrice" class="form-control" value="0" placeholder="Delivery Price" type="number" required/>
        	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">Create</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp" %>

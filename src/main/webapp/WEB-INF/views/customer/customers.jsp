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
		<h3>Customers</h3>
		<div class="row">
			 <div class="col-sm-6 col-xs-12">
	          <a href="/customers/add" class="info-box">
	            <span class="info-box-icon bg-orange"><i class="fa fa-user-plus" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text"><strong>Add Customer</strong></span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
	        
	        <div class="col-sm-6 col-xs-12">
	          <a href="/customers" class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="fa fa-users" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Total Customers</span>
	              <span class="info-box-number">${totalCustomers}</span>
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
				<form action="/customers" method="GET">
					<div class="form-group col-md-4">
						<input type="text" class="form-control" style="width: 100%"
							value='${param["contact_no"]}' name="contact_no"
							placeholder="Search using contact number" required />
					</div>
					<div class="form-group col-md-2">
						<button class="btn btn-success" style="width: 100%" type="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-12">
			<h4>Customers</h4>
			<div class="table-responsive">
				<table class="table table-hover">
					<tr class="success">
						<th>Id</th>
						<th>Customers Name</th>
						<th>Contact No.</th>
						<th>Source</th>
						<th>Address</th>
						<th>Gender</th>
						<th>Credits</th>
						<th>Edit</th>
					</tr>
					<c:forEach items="${customers}" var="customer">
						<tr>
							<td>${customer.id}</td>
							<td><a href="/view/customer/${customer.id}" class="btn btn-sm btn-default">${customer.fullname}</a></td>
							<td>${customer.contactNumber}</td>
							<td>
								<c:choose>
									<c:when test="${customer.source eq 'Instagram' }">
										<span class="label bg-maroon">${customer.source}</span>
									</c:when>
									<c:when test="${customer.source eq 'Facebook' }">
										<span class="label label-primary">${customer.source}</span>
									</c:when>
									<c:otherwise>
										<span class="label label-default">${customer.source}</span>										
									</c:otherwise>
								</c:choose>								
							</td>
							<td>${customer.address}</td>
							<td>${customer.gender}</td>
							<td>${customer.credits}</td>
							<td><a href="/customers/edit/${customer.id}" class="btn btn-sm btn-warning"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
				
			<c:if test="${fn:length(customers) < 1}">
			   <p class="text-center">No Customers Yet :(</p>
			</c:if>
			
			<nav aria-label="Page navigation" class="text-center">
		        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
		    </nav>
		</div>
	 </div><!-- End job list -->
  </div>
  <!-- Container fluid -->
</div>
<!-- Content Wrapper -->
<script src="/public/dist/jquery.twbsPagination.js"></script> 
<%@ include file="../includes/footer.jsp" %>

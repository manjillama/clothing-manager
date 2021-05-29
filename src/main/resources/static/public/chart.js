$(document).ready(function () {
	var BASE_URL = '/analytics/api';
	var year = new Date().getFullYear();
	
	let yearlySalesFn = function(year){
		var elem = document.getElementById("myChart");
		
		if(elem){
			var ctx = elem.getContext('2d');
			var months = [];
			var sales = [];

			$.get(`${BASE_URL}/sales/${year}`, function(response){
				for(data of response){
					months.push(data.month);
					sales.push(data.sales);
				}

				var myChart = new Chart(ctx, {
				    type: 'line',
				    data: {
				        labels: months,
				        datasets: [{
				            label: year +' Monthly Sales',
				            data: sales,
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255,99,132,1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				    	responsive: true,
			    	    maintainAspectRatio: false,
//			    	    elements: {
//			                line: {
//			                    tension: 0, // disables bezier curves
//			                }
//			            }
				    }
				});
			});
		}
	} 
	
	yearlySalesFn(year);	
	
	var profitChart;
	let yearlyProfitFn = function(year){
		var elem = document.getElementById("myProfit");
		if(elem){
			var ctx = elem.getContext('2d');
			

			var months = [];
			var sales = [];

			$.get(`${BASE_URL}/profit/${year}`, function(response){
				for(data of response){
					months.push(data.month);
					sales.push(data.sales);
				}
				
				if (profitChart) {
					profitChart.destroy();
				}

				profitChart = new Chart(ctx, {
				    type: 'bar',
				    data: {
				        labels: months,
				        datasets: [{
				            label: year+' Monthly Profit',
				            data: sales,
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255,99,132,1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				    	responsive: true,
			    	    maintainAspectRatio: false,
			    	    scales: {
			                xAxes: [{
			                    stacked: true
			                }],
			                yAxes: [{
			                    stacked: true
			                }]
			            }			    
				    }
				});
			});
		}
	}
	
	yearlyProfitFn(year);
	
	$('#yearInc').click(function(){
		year++;
		yearlySalesFn(year);
		yearlyProfitFn(year);
	});
	
	$('#yearDec').click(function(){
		year--;
		yearlySalesFn(year);
		yearlyProfitFn(year);
	});
	
	(function(){
		var elem = document.getElementById("myGenderCtx");
		if(elem){
			var ctx = elem.getContext('2d');
			var data = {
				datasets: [{
			        data: [],
			        backgroundColor: [
			        	'#F06292',
						'#03A9F4',
						'#4CAF50'
					],
			    }],
			    // These labels appear in the legend and in the tooltips when hovering different arcs
			    labels: []
			};
			
			$.get(`${BASE_URL}/gender-count`, function(response){
				for(res of response){
					data.datasets[0].data.push(res.count);
					data.labels.push(res.gender);
				}
				// For a pie chart
				var myPieChart = new Chart(ctx, {
				    type: 'pie',
				    data: data,
				    options: {
				    	responsive: true,
			    	    maintainAspectRatio: false
				    }
				});
			});
				
		}
	})();
	
	(function(){
		var elem = document.getElementById("myItemGenderCtx");
		if(elem){
			var ctx = elem.getContext('2d');
			var data = {
				datasets: [{
			        data: [],
			        backgroundColor: [
			        	'#00B8D4',
						'#FFC107',
						'#4CAF50'
					],
			    }],
			    // These labels appear in the legend and in the tooltips when hovering different arcs
			    labels: []
			};
			
			$.get(`${BASE_URL}/item/gender-count`, function(response){
				for(res of response){
					data.datasets[0].data.push(res.count);
					data.labels.push(res.gender);
				}
				// For a pie chart
				var myPieChart = new Chart(ctx, {
				    type: 'pie',
				    data: data,
				    options: {
				    	responsive: true,
			    	    maintainAspectRatio: false
				    }
				});
			});
				
		}
	})();
	
	(function(){
		var elem = document.getElementById("myTypesCtx");
		if(elem){
			var ctx = elem.getContext('2d');
			var data = {
				datasets: [{
			        data: [],
			        backgroundColor: [
			        	'#00B8D4',
						'#FFC107',
						'#4CAF50',
						'#E91E63',
						'#3F51B5',
						'#FF9800',
						'#9E9E9E',
						'#607D8B',
						'#000000',
						'#8BC34A'
					],
			    }],
			    // These labels appear in the legend and in the tooltips when hovering different arcs
			    labels: []
			};
			
			var gender = elem.dataset.type;
			var url;
			if(gender == 'men'){
				url = `${BASE_URL}/men/sold-item`
			}else{
				url = `${BASE_URL}/women/sold-item`
			}
			
			$.get(url, function(response){
				for(res of response){
					data.datasets[0].data.push(res.count);
					data.labels.push(res.type);
				}
				// For a pie chart
				var myPieChart = new Chart(ctx, {
				    type: 'pie',
				    data: data,
				    options: {
				    	responsive: true,
			    	    maintainAspectRatio: false
				    }
				});
			});
				
		}
	})();
});
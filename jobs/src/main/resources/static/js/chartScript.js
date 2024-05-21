/**
 * 
 */

document.addEventListener('DOMContentLoaded', function(){
	var ctx = document.getElementById('montlyRegistrationsChart').getContext('2d');
	var chart = new Chart(ctx, {
		type:'bar',
		data: {
			labels: [window.currentMonth, window.pastMonth],
			datasets: [
				{
					label: '기업 회원',
					backgroundColor: 'rgba(255,127,0,1)',
					borderColor:'rgba(255,127,0,1)',
					borderWidth: 1,
					data:[window.currentCompanyRegistrations,window.pastCompanyRegistrations]
				},
				{
					label:'개인 회원',
					backgroundColor: 'rgba(75,137,220,1)',
					borderColor: 'rgba(75,137,220,1)',
					borderWidth: 1,
					data:[window.currentMemberRegistrations, window.pastMemberRegistrations]
				}
			]
		},
		options: {
			scales: {
				y:{
					beginAtZero:true
				}
			}
		}
	});
});
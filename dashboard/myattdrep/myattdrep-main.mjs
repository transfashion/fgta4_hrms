import {fgta4slideselect} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs';
import { fgta4ParallelProcess } from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4parallel.mjs'

const cbo_selectperiode = $('#pnl_main-cbo_selectperiode');
const btn_refresh = $('#pnl_main-btn_refresh');



var this_page_id;
var this_page_options;

var option_summary;
var option_late;
var option_workeff;
var option_history;

export async function init(opt) {
	this_page_id = opt.id;
	this_page_options = opt;


	var parallelProcess = fgta4ParallelProcess({
		waitfor: {
			cbo_selectperiode: 1,
		},
		onFinished: () => {
			btn_refresh_click();
		}
	})


	cbo_selectperiode.name = 'pnl_main-cbo_selectperiode'	
	cbo_selectperiode.comp = new fgta4slideselect(cbo_selectperiode, {
		title: 'Pilih Periode',
		returnpage: this_page_id,
		api: 'hrms/dashboard/myattdrep/list-periode',
		fieldValue: 'periode_val',
		fieldValueMap: 'periode_val',
		fieldDisplay: 'periode_display',
		fields: [
			{ mapping: 'periode_display', text: 'Periode' },
		],
		OnDataLoading: (criteria) => {},
		OnDataLoaded: (result, options) => {},
		OnSelected: (value, display, record, options) => {
			options.flashhighlight = false
			btn_refresh_click();
		},
		OnCreated: () => {
			//console.log(global.setup);
			cbo_selectperiode.combo('setValue', '2022-11');
			cbo_selectperiode.combo('setText', '2022 November');
			parallelProcess.setFinished('cbo_selectperiode');
		}
	});

	btn_refresh.linkbutton({ onClick: () => { btn_refresh_click(); } });	
}

async function btn_refresh_click() {
	var periode = cbo_selectperiode.combo('getValue');
	var param = {
		periode: periode
	};
	
	btn_action_click({ action: 'summary', cancel: false, param: param});
	btn_action_click({ action: 'late', cancel: false, param: param});
	btn_action_click({ action: 'workeff', cancel: false, param: param});
	btn_action_click({ action: 'history', cancel: false, param: param});
}



async function compose_reputation_summary(data) {
	var chartDom = document.getElementById('pnl_main-chart-reputation');
	var myChart = echarts.init(chartDom);

	if (option_summary==null) {
		option_summary = {
			series: [
				{
					type: 'gauge',
					startAngle: 205,
					endAngle: 335,
					center: ['50%', '75%'],
					radius: '100%',
					min: 0,
					max: 5,
					splitNumber: 40,
					axisLine: {
						lineStyle: {
							width: 20,
							color: [
								[2.5/5, '#FF6E76'],
								[3.75/5, '#FDDD60'],
								[4.5/5, '#7CFFB2'],
								[1, '#58D9F9']
							]
						}
					},
					pointer: {
						icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
						length: '12%',
						width: 20,
						offsetCenter: [0, '-60%'],
							itemStyle: {
							color: 'inherit'
						}
					},
					
					axisTick: {
						show: false,
						length: 5,
						lineStyle: {
							color: 'inherit',
							width: 1
						}
					},
					
					splitLine: {
						length: 5,
						lineStyle: {
							color: 'inherit',
							width: 1
						}
					},
					
					axisLabel: {
						color: '#464646',
						fontSize: 10,
						distance: -25,
						rotate: 'tangential',
						formatter: function (value) {
							if (value === 4.75) {
								return 'Very Good';
							} else if (value === 4.125) {
								return 'Good';
							} else if (value === 3.25) {
								return 'Fair';
							} else if (value === 1.75) {
								return 'Bad';
							}
							return '';
						}
					},
					title: {
						offsetCenter: [0, '20%'],
						fontSize: 14
					},
					detail: {
						fontSize: 30,
						offsetCenter: [0, '-15%'],
						valueAnimation: true,
						formatter: function (value) {
							return value;//Math.round(value * 100) + '';
						},
						color: 'inherit'
					},
					data: [
						{
							value: data.score,
							name: 'Reputation'
						}
					]
				}
			]
		};
	
		myChart.setOption(option_summary);

	} else {
		// update data chart
		myChart.setOption({
			series: [{data: [{ value: data.score, name: 'Reputation' }]}]
		});
	}
}

async function compose_reputation_late(data) {
	var chartDom = document.getElementById('pnl_main-chart-late');
	var myChart = echarts.init(chartDom);

	if (option_late==null) {
		option_late = {
			series: [
				{
					type: 'gauge',
					startAngle: 200,
					endAngle: 340,
					center: ['50%', '75%'],
					radius: '90%',
					min: 0,
					max: 4,
					splitNumber: 16,
					axisLine: {
						lineStyle: {
							width: 10,
							color: [
								[2/4, '#FF6E76'],
								[3/4, '#FDDD60'],
								[4/4, '#7CFFB2']
							]
						}
					},
					pointer: {
						icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
						length: '12%',
						width: 20,
						offsetCenter: [0, '-60%'],
							itemStyle: {
							color: 'inherit'
						}
					},
					
					axisTick: {
						show: false,
						length: 5,
						lineStyle: {
							color: 'inherit',
							width: 1
						}
					},
					
					splitLine: {
						show: false,
						length: 5,
						lineStyle: {
							color: 'inherit',
							width: 1
						}
					},
					
					axisLabel: {
						color: '#464646',
						fontSize: 10,
						distance: -25,
						rotate: 'tangential',
						formatter: function (value) {
							if (value === 3.5) {
								return 'Good';
							} else if (value === 2.5) {
								return 'Fair';
							} else if (value === 1) {
								return 'Bad';
							}
							return '';
						}
					},
					title: {
						//offsetCenter: [0, '-5%'],
						fontSize: 12
					},
					detail: {
						fontSize: 18,
						offsetCenter: [0, '-20%'],
						valueAnimation: true,
						formatter: function (value) {
							return value;//Math.round(value * 100) + '';
						},
						color: 'inherit'
					},
					data: [
						{
							value: data.score,
							name: 'Late'
						}
					]
				}
			]
		};
	
		myChart.setOption(option_late);

	} else {
		// update data chart
		myChart.setOption({
			series: [{data: [{ value: data.score, name: 'Late' }]}]
		});
	}
}

async function compose_reputation_workeff(data) {
	var chartDom = document.getElementById('pnl_main-chart-workeff');
	var myChart = echarts.init(chartDom);

	if (option_workeff==null) {
		option_workeff = {
			series: [
				{
					type: 'gauge',
					startAngle: 200,
					endAngle: 340,
					center: ['50%', '75%'],
					radius: '90%',
					min: 0,
					max: 4,
					splitNumber: 16,
					axisLine: {
						lineStyle: {
							width: 10,
							color: [
								[2/4, '#FF6E76'],
								[3/4, '#FDDD60'],
								[4/4, '#7CFFB2']
							]
						}
					},
					pointer: {
						icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
						length: '12%',
						width: 20,
						offsetCenter: [0, '-60%'],
							itemStyle: {
							color: 'inherit'
						}
					},
					
					axisTick: {
						show: false,
						length: 5,
						lineStyle: {
							color: 'inherit',
							width: 1
						}
					},
					
					splitLine: {
						show: false,
						length: 5,
						lineStyle: {
							color: 'inherit',
							width: 1
						}
					},
					
					axisLabel: {
						color: '#464646',
						fontSize: 10,
						distance: -25,
						rotate: 'tangential',
						formatter: function (value) {
							if (value === 3.5) {
								return 'Good';
							} else if (value === 2.5) {
								return 'Fair';
							} else if (value === 1) {
								return 'Bad';
							}
							return '';
						}
					},
					title: {
						//offsetCenter: [0, '-10%'],
						fontSize: 10
					},
					detail: {
						fontSize: 18,
						offsetCenter: [0, '-20%'],
						valueAnimation: true,
						formatter: function (value) {
							return value;//Math.round(value * 100) + '';
						},
						color: 'inherit'
					},
					data: [
						{
							value: data.score,
							name: 'Working Hour'
						}
					]
				}
			]
		};
	
		myChart.setOption(option_workeff);

	} else {
		// update data chart
		myChart.setOption({
			series: [{data: [{ value: data.score, name: 'Working Hour' }]}]
		});
	}
}

async function compose_reputation_history(data) {
	var axis = [];
	var series1 = [];
	var series2 = [];
	var series3 = [];
	for (var modata of data) {
		console.log(modata);
		axis.push(modata.hratdsum_dt);
		series1.push(modata.score_late);
		series2.push(modata.score_workeff);
		series3.push(modata.score_total);
	}

	var chartDom = document.getElementById('pnl_main-chart-history');
	var myChart = echarts.init(chartDom);

	var xAxis = {
		type: 'category',
		data: axis
	}

	var seriesdata = [
		{
			name: 'late',
			data: series1,
			type: 'line',
			smooth: true,
			lineStyle: {color: '#439A97'},
			showSymbol: false,
		},
		{
			name: 'work hour',
			data: series2,
			type: 'line',
			smooth: true,
			lineStyle: {color: '#FFDB89'},
			showSymbol: false,
		},
		{
			name: 'reputation',
			data: series3,
			type: 'line',
			smooth: true,
			lineStyle: {color: '#E98EAD'},
			showSymbol: false,
		},		
	];


	if (option_history==null) {
		option_history = {
			title: {
				text: 'History',
				textStyle: {
					fontSize: 10
				},
				top: 20,
				left: 'center'

			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data: ['Late', 'Work Hour', 'Total Reputation']
			},

			xAxis: xAxis,
			yAxis: {
				type: 'value',
				max: 5,
				min: 0
			},
			animation: true,
			series: seriesdata
		}
		myChart.setOption(option_history);
		window.onresize = function() {
			myChart.resize();
		};
	} else {
		// update data chart
		myChart.setOption({
			xAxis: xAxis,
			series: seriesdata
		});
	}

}



async function btn_action_click(args) {
	Object.assign(args, {
		id: '',
		act_url: null,
		act_msg_quest: '',
		act_msg_result: '',
		act_do: null,
		use_otp: false,
		otp_message: '',
	});

	switch (args.action) {
		case 'summary' :
			args.act_url = `${global.modulefullname}/xtion-reputation-summary`;
			args.act_do = (result) => {
				compose_reputation_summary(result.dataresponse)
			}
			break;

		case 'late' :
			args.act_url = `${global.modulefullname}/xtion-reputation-late`;
			args.act_do = (result) => {
				compose_reputation_late(result.dataresponse);
			}
			break;

		case 'workeff' :
			args.act_url = `${global.modulefullname}/xtion-reputation-workeff`;
			args.act_do = (result) => {
				compose_reputation_workeff(result.dataresponse);
			}
			break;

		case 'history' :
			args.act_url = `${global.modulefullname}/xtion-reputation-history`;
			args.act_do = (result) => {
				compose_reputation_history(result.dataresponse);
			}
			break;		

	}

	
	try {
		//$ui.mask('wait..');
		var { doAction } = await import('../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4xtion.mjs');
		await doAction(args, (err, result) => {
			if (err) {
				$ui.ShowMessage('[WARNING]' + err.message);	
			} else {
				if (result.dataresponse!=undefined) {
					args.act_do(result);
				}
			}
		});
	} catch (err) {
		console.error(err);
		$ui.ShowMessage('[ERROR]' + err.message);
	} finally {
		//$ui.unmask();
	}
}	
	
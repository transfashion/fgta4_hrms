import { fgta4slideselect } from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'
import { fgta4ParallelProcess } from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4parallel.mjs'

let grd_list, opt;
var this_page_id;
var this_page_options;

const cbo_search_site = $('#pnl_list-cbo_search_site');
const cbo_search_dept = $('#pnl_list-cbo_search_dept');

export function init(param, fn_callback) {
	grd_list = param.grd_list;
	opt = param.opt;
	this_page_id = opt.id;
	this_page_options = opt;	

	grd_list.autoload = false;

	var parallelProcess = fgta4ParallelProcess({
		waitfor: {
			cbo_search_site_created: 1,
			cbo_search_dept_created: 1
		},
		onFinished: () => {
			grd_list.doLoad();
		}
	})

	cbo_search_site.name = 'pnl_list-cbo_search_site'	
	new fgta4slideselect(cbo_search_site, {
		title: 'Pilih Site',
		returnpage: this_page_id,
		api: $ui.apis.load_site_id,

		fieldValue: 'site_id',
		fieldValueMap: 'site_id',
		fieldDisplay: 'site_name',
		fields: [
			{ mapping: 'site_name', text: 'Site' },
		],
		OnDataLoading: (criteria) => {
			// console.log('loading...');
			criteria.site_isdisabled=0;
		},
		OnDataLoaded: (result, options) => {
			result.records.unshift({ site_id: 'ALL', site_name: 'ALL' });
		},
		OnSelected: (value, display, record, options) => {
			// console.log(record);
			options.flashhighlight = false
			grd_list.doLoad();
		},
		OnCreated: () => {
			cbo_search_site.combo('setValue', 'ALL');
			cbo_search_site.combo('setText', 'ALL');
			parallelProcess.setFinished('cbo_search_site_created');
		}
	});
	

	cbo_search_dept.name = 'pnl_list-cbo_search_dept'	
	new fgta4slideselect(cbo_search_dept, {
		title: 'Pilih Dept',
		returnpage: this_page_id,
		api: $ui.apis.load_dept_id,

		fieldValue: 'dept_id',
		fieldValueMap: 'dept_id',
		fieldDisplay: 'dept_name',
		fields: [
			{ mapping: 'dept_name', text: 'Dept' },
		],
		OnDataLoading: (criteria) => {
			//var brand_id = cbo_search_brand.combo('getValue');
			criteria.dept_isdisabled=0;
		},
		OnDataLoaded: (result, options) => {
			result.records.unshift({ dept_id: 'ALL', dept_name: 'ALL' });
		},
		OnSelected: (value, display, record, options) => {
			// console.log(record);
			options.flashhighlight = false
			grd_list.doLoad();
		},
		OnCreated: () => {
			cbo_search_dept.combo('setValue', 'ALL');
			cbo_search_dept.combo('setText', 'ALL');
			parallelProcess.setFinished('cbo_search_dept_created');
		}
	});


	cbo_search_site.combo('disableValidation');
	cbo_search_dept.combo('disableValidation');
	

	fn_callback();
}


export function customsearch(options) {
	var site_id = cbo_search_site.combo('getValue');
	if (site_id!='ALL') {
		options.criteria.site_id = site_id;
	}

	var dept_id = cbo_search_dept.combo('getValue');
	if (dept_id!='ALL') {
		options.criteria.dept_id = dept_id;
	}
}	
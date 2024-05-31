var this_page_id;
var this_page_options;

import {fgta4slideselect} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'
import * as hnd from  './empl-edit-hnd.mjs'


const btn_edit = $('#pnl_edit-btn_edit')
const btn_save = $('#pnl_edit-btn_save')
const btn_delete = $('#pnl_edit-btn_delete')






const pnl_form = $('#pnl_edit-form')
const obj = {
	txt_empl_id: $('#pnl_edit-txt_empl_id'),
	txt_empl_nik: $('#pnl_edit-txt_empl_nik'),
	txt_empl_name: $('#pnl_edit-txt_empl_name'),
	chk_empl_isdisabled: $('#pnl_edit-chk_empl_isdisabled'),
	dt_empl_dtjoin: $('#pnl_edit-dt_empl_dtjoin'),
	dt_empl_dtexit: $('#pnl_edit-dt_empl_dtexit'),
	txt_empl_birthplace: $('#pnl_edit-txt_empl_birthplace'),
	dt_empl_birthdate: $('#pnl_edit-dt_empl_birthdate'),
	cbo_gender_id: $('#pnl_edit-cbo_gender_id'),
	cbo_religion_id: $('#pnl_edit-cbo_religion_id'),
	txt_empl_addressline1: $('#pnl_edit-txt_empl_addressline1'),
	txt_empl_addressline2: $('#pnl_edit-txt_empl_addressline2'),
	txt_empl_addressline3: $('#pnl_edit-txt_empl_addressline3'),
	txt_empl_city: $('#pnl_edit-txt_empl_city'),
	txt_empl_postcode: $('#pnl_edit-txt_empl_postcode'),
	txt_empl_prov: $('#pnl_edit-txt_empl_prov'),
	cbo_country_id: $('#pnl_edit-cbo_country_id'),
	txt_empl_mobilephone: $('#pnl_edit-txt_empl_mobilephone'),
	txt_empl_phone: $('#pnl_edit-txt_empl_phone'),
	txt_empl_email: $('#pnl_edit-txt_empl_email'),
	cbo_edu_id: $('#pnl_edit-cbo_edu_id'),
	txt_empl_kk: $('#pnl_edit-txt_empl_kk'),
	txt_empl_ktp: $('#pnl_edit-txt_empl_ktp'),
	txt_empl_npwp: $('#pnl_edit-txt_empl_npwp'),
	cbo_marital_id: $('#pnl_edit-cbo_marital_id'),
	txt_empl_bpjstk: $('#pnl_edit-txt_empl_bpjstk'),
	txt_empl_bpjskes: $('#pnl_edit-txt_empl_bpjskes'),
	txt_empl_namaibu: $('#pnl_edit-txt_empl_namaibu'),
	txt_empl_rek1: $('#pnl_edit-txt_empl_rek1'),
	txt_empl_rek2: $('#pnl_edit-txt_empl_rek2'),
	cbo_hrstatus_id: $('#pnl_edit-cbo_hrstatus_id'),
	cbo_dept_id: $('#pnl_edit-cbo_dept_id'),
	cbo_hrjob_id: $('#pnl_edit-cbo_hrjob_id'),
	cbo_site_id: $('#pnl_edit-cbo_site_id'),
	cbo_auth_id: $('#pnl_edit-cbo_auth_id')
}




let form;
let rowdata;

export async function init(opt) {
	this_page_id = opt.id;
	this_page_options = opt;


	var disableedit = false;

	if (opt.settings.btn_edit_visible===false) {
		btn_edit.hide();
	} 

	if (opt.settings.btn_save_visible===false) {
		btn_save.hide();
	} 

	if (opt.settings.btn_delete_visible===false) {
		btn_delete.hide();
	} 

	form = new global.fgta4form(pnl_form, {
		primary: obj.txt_empl_id,
		autoid: true,
		logview: 'mst_empl',
		btn_edit: disableedit==true? $('<a>edit</a>') : btn_edit,
		btn_save: disableedit==true? $('<a>save</a>') : btn_save,
		btn_delete: disableedit==true? $('<a>delete</a>') : btn_delete,		
		objects : obj,
		OnDataSaving: async (data, options) => { await form_datasaving(data, options) },
		OnDataSaveError: async (data, options) => { await form_datasaveerror(data, options) },
		OnDataSaved: async (result, options) => {  await form_datasaved(result, options) },
		OnDataDeleting: async (data, options) => { await form_deleting(data, options) },
		OnDataDeleted: async (result, options) => { await form_deleted(result, options) },
		OnIdSetup : (options) => { form_idsetup(options) },
		OnViewModeChanged : (viewonly) => { form_viewmodechanged(viewonly) },
		OnRecordStatusCreated: () => {
			undefined			
		}		
	});
	form.getHeaderData = () => {
		return getHeaderData();
	}

	// Generator: Print Handler not exist
	// Generator: Commit Handler not exist
	// Generator: Approval Handler not exist
	// Generator: Xtion Handler not exist
	// Generator: Object Handler not exist

	// Generator: Upload Handler not exist


	obj.cbo_gender_id.name = 'pnl_edit-cbo_gender_id'		
	new fgta4slideselect(obj.cbo_gender_id, {
		title: 'Pilih gender_id',
		returnpage: this_page_id,
		api: $ui.apis.load_gender_id,
		fieldValue: 'gender_id',
		fieldDisplay: 'gender_name',
		fields: [
			{mapping: 'gender_id', text: 'gender_id'},
			{mapping: 'gender_name', text: 'gender_name'}
		],

	})				
				
	obj.cbo_religion_id.name = 'pnl_edit-cbo_religion_id'		
	new fgta4slideselect(obj.cbo_religion_id, {
		title: 'Pilih religion_id',
		returnpage: this_page_id,
		api: $ui.apis.load_religion_id,
		fieldValue: 'religion_id',
		fieldDisplay: 'religion_name',
		fields: [
			{mapping: 'religion_id', text: 'religion_id'},
			{mapping: 'religion_name', text: 'religion_name'}
		],

	})				
				
	obj.cbo_country_id.name = 'pnl_edit-cbo_country_id'		
	new fgta4slideselect(obj.cbo_country_id, {
		title: 'Pilih country_id',
		returnpage: this_page_id,
		api: $ui.apis.load_country_id,
		fieldValue: 'country_id',
		fieldDisplay: 'country_name',
		fields: [
			{mapping: 'country_id', text: 'country_id'},
			{mapping: 'country_name', text: 'country_name'}
		],

	})				
				
	obj.cbo_edu_id.name = 'pnl_edit-cbo_edu_id'		
	new fgta4slideselect(obj.cbo_edu_id, {
		title: 'Pilih edu_id',
		returnpage: this_page_id,
		api: $ui.apis.load_edu_id,
		fieldValue: 'edu_id',
		fieldDisplay: 'edu_name',
		fields: [
			{mapping: 'edu_id', text: 'edu_id'},
			{mapping: 'edu_name', text: 'edu_name'}
		],

	})				
				
	obj.cbo_marital_id.name = 'pnl_edit-cbo_marital_id'		
	new fgta4slideselect(obj.cbo_marital_id, {
		title: 'Pilih marital_id',
		returnpage: this_page_id,
		api: $ui.apis.load_marital_id,
		fieldValue: 'marital_id',
		fieldDisplay: 'marital_name',
		fields: [
			{mapping: 'marital_id', text: 'marital_id'},
			{mapping: 'marital_name', text: 'marital_name'}
		],

	})				
				
	obj.cbo_hrstatus_id.name = 'pnl_edit-cbo_hrstatus_id'		
	new fgta4slideselect(obj.cbo_hrstatus_id, {
		title: 'Pilih hrstatus_id',
		returnpage: this_page_id,
		api: $ui.apis.load_hrstatus_id,
		fieldValue: 'hrstatus_id',
		fieldDisplay: 'hrstatus_name',
		fields: [
			{mapping: 'hrstatus_id', text: 'hrstatus_id'},
			{mapping: 'hrstatus_name', text: 'hrstatus_name'}
		],

	})				
				
	obj.cbo_dept_id.name = 'pnl_edit-cbo_dept_id'		
	new fgta4slideselect(obj.cbo_dept_id, {
		title: 'Pilih dept_id',
		returnpage: this_page_id,
		api: $ui.apis.load_dept_id,
		fieldValue: 'dept_id',
		fieldDisplay: 'dept_name',
		fields: [
			{mapping: 'dept_id', text: 'dept_id'},
			{mapping: 'dept_name', text: 'dept_name'}
		],

	})				
				
	obj.cbo_hrjob_id.name = 'pnl_edit-cbo_hrjob_id'		
	new fgta4slideselect(obj.cbo_hrjob_id, {
		title: 'Pilih hrjob_id',
		returnpage: this_page_id,
		api: $ui.apis.load_hrjob_id,
		fieldValue: 'hrjob_id',
		fieldDisplay: 'hrjob_name',
		fields: [
			{mapping: 'hrjob_id', text: 'hrjob_id'},
			{mapping: 'hrjob_name', text: 'hrjob_name'}
		],

	})				
				
	obj.cbo_site_id.name = 'pnl_edit-cbo_site_id'		
	new fgta4slideselect(obj.cbo_site_id, {
		title: 'Pilih site_id',
		returnpage: this_page_id,
		api: $ui.apis.load_site_id,
		fieldValue: 'site_id',
		fieldDisplay: 'site_name',
		fields: [
			{mapping: 'site_id', text: 'site_id'},
			{mapping: 'site_name', text: 'site_name'}
		],

	})				
				
	obj.cbo_auth_id.name = 'pnl_edit-cbo_auth_id'		
	new fgta4slideselect(obj.cbo_auth_id, {
		title: 'Pilih auth_id',
		returnpage: this_page_id,
		api: $ui.apis.load_auth_id,
		fieldValue: 'auth_id',
		fieldDisplay: 'auth_name',
		fields: [
			{mapping: 'auth_id', text: 'auth_id'},
			{mapping: 'auth_name', text: 'auth_name'}
		],

	})				
				




	document.addEventListener('keydown', (ev)=>{
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			if (ev.code=='KeyS' && ev.ctrlKey==true) {
				if (!form.isInViewMode()) {
					form.btn_save_click();
				}
				ev.stopPropagation()
				ev.preventDefault()
			}
		}
	}, true)
	
	document.addEventListener('OnSizeRecalculated', (ev) => {
		OnSizeRecalculated(ev.detail.width, ev.detail.height)
	})	

	document.addEventListener('OnButtonBack', (ev) => {
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			ev.detail.cancel = true;
			if (form.isDataChanged()) {
				form.canceledit(()=>{
					$ui.getPages().show('pnl_list', ()=>{
						form.setViewMode()
						$ui.getPages().ITEMS['pnl_list'].handler.scrolllast()
					})
				})
			} else {
				$ui.getPages().show('pnl_list', ()=>{
					form.setViewMode()
					$ui.getPages().ITEMS['pnl_list'].handler.scrolllast()
				})
			}
		
		}
	})

	document.addEventListener('OnButtonHome', (ev) => {
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			if (form.isDataChanged()) {
				ev.detail.cancel = true;
				$ui.ShowMessage('Anda masih dalam mode edit dengan pending data, silakan matikan mode edit untuk kembali ke halaman utama.')
			}
		}
	})

	//button state
	if (typeof hnd.init==='function') {
		hnd.init({
			form: form,
			obj: obj,
			opt: opt,
			btn_action_click: (actionargs) => {
				if (typeof btn_action_click == 'function') {
					btn_action_click(actionargs);
				}
			}
		})
	}

}

export function OnSizeRecalculated(width, height) {
}

export function getForm() {
	return form
}

export function getCurrentRowdata() {
	return rowdata;
}

export function open(data, rowid, viewmode=true, fn_callback) {

	rowdata = {
		data: data,
		rowid: rowid
	}

	var pOpt = form.getDefaultPrompt(false)
	var fn_dataopening = async (options) => {
		options.criteria[form.primary.mapping] = data[form.primary.mapping]
	}

	var fn_dataopened = async (result, options) => {
		var record = result.record;
		updatefilebox(record);

		/*
		if (result.record.auth_id==null) { result.record.auth_id='--NULL--'; result.record.auth_name='NONE'; }

		*/
		for (var objid in obj) {
			let o = obj[objid]
			if (o.isCombo() && !o.isRequired()) {
				var value =  result.record[o.getFieldValueName()];
				if (value==null ) {
					record[o.getFieldValueName()] = pOpt.value;
					record[o.getFieldDisplayName()] = pOpt.text;
				}
			}
		}
  		updaterecordstatus(record)

		/* handle data saat opening data */   
		if (typeof hnd.form_dataopening == 'function') {
			hnd.form_dataopening(result, options);
		}


		form.SuspendEvent(true);
		form
			.fill(record)
			.setValue(obj.cbo_gender_id, record.gender_id, record.gender_name)
			.setValue(obj.cbo_religion_id, record.religion_id, record.religion_name)
			.setValue(obj.cbo_country_id, record.country_id, record.country_name)
			.setValue(obj.cbo_edu_id, record.edu_id, record.edu_name)
			.setValue(obj.cbo_marital_id, record.marital_id, record.marital_name)
			.setValue(obj.cbo_hrstatus_id, record.hrstatus_id, record.hrstatus_name)
			.setValue(obj.cbo_dept_id, record.dept_id, record.dept_name)
			.setValue(obj.cbo_hrjob_id, record.hrjob_id, record.hrjob_name)
			.setValue(obj.cbo_site_id, record.site_id, record.site_name)
			.setValue(obj.cbo_auth_id, record.auth_id, record.auth_name)
			.setViewMode(viewmode)
			.lock(false)
			.rowid = rowid


		/* tambahkan event atau behaviour saat form dibuka
		   apabila ada rutin mengubah form dan tidak mau dijalankan pada saat opening,
		   cek dengan form.isEventSuspended()
		*/   
		if (typeof hnd.form_dataopened == 'function') {
			hnd.form_dataopened(result, options);
		}


		/* commit form */
		form.commit()
		form.SuspendEvent(false); 
		updatebuttonstate(record)


		/* update rowdata */
		for (var nv in rowdata.data) {
			if (record[nv]!=undefined) {
				rowdata.data[nv] = record[nv];
			}
		}

		// tampilkan form untuk data editor
		if (typeof fn_callback==='function') {
			fn_callback(null, rowdata.data);
		}
		
	}

	var fn_dataopenerror = (err) => {
		$ui.ShowMessage('[ERROR]'+err.errormessage);
	}

	form.dataload(fn_dataopening, fn_dataopened, fn_dataopenerror)
	
}


export function createnew() {
	form.createnew(async (data, options)=>{
		// console.log(data)
		// console.log(options)
		form.rowid = null

		// set nilai-nilai default untuk form
		data.empl_isdisabled = '0'
		data.empl_dtjoin = global.now()
		data.empl_dtexit = global.now()
		data.empl_birthdate = global.now()

		data.gender_id = '0'
		data.gender_name = '-- PILIH --'
		data.religion_id = '0'
		data.religion_name = '-- PILIH --'
		data.country_id = '0'
		data.country_name = '-- PILIH --'
		data.edu_id = '0'
		data.edu_name = '-- PILIH --'
		data.marital_id = '0'
		data.marital_name = '-- PILIH --'
		data.hrstatus_id = '0'
		data.hrstatus_name = '-- PILIH --'
		data.dept_id = '0'
		data.dept_name = '-- PILIH --'
		data.hrjob_id = '0'
		data.hrjob_name = '-- PILIH --'
		data.site_id = '0'
		data.site_name = '-- PILIH --'
		data.auth_id = '--NULL--'
		data.auth_name = 'NONE'

		if (typeof hnd.form_newdata == 'function') {
			// untuk mengambil nilai ui component,
			// di dalam handler form_newdata, gunakan perintah:
			// options.OnNewData = () => {
			// 		...
			// }		
			hnd.form_newdata(data, options);
		}




		options.OnCanceled = () => {
			$ui.getPages().show('pnl_list')
		}



	})
}


export function getHeaderData() {
	var header_data = form.getData();
	if (typeof hnd.form_getHeaderData == 'function') {
		hnd.form_getHeaderData(header_data);
	}
	return header_data;
}

export function detil_open(pnlname) {
	if (form.isDataChanged()) {
		$ui.ShowMessage('Simpan dulu perubahan datanya.')
		return;
	}

	//$ui.getPages().show(pnlname)
	let header_data = getHeaderData();
	if (typeof hnd.form_detil_opening == 'function') {
		hnd.form_detil_opening(pnlname, (cancel)=>{
			if (cancel===true) {
				return;
			}
			$ui.getPages().show(pnlname, () => {
				$ui.getPages().ITEMS[pnlname].handler.OpenDetil(header_data)
			})
		});
	} else {
		$ui.getPages().show(pnlname, () => {
			$ui.getPages().ITEMS[pnlname].handler.OpenDetil(header_data)
		})
	}

	
}


function updatefilebox(record) {
	// apabila ada keperluan untuk menampilkan data dari object storage


	if (typeof hnd.form_updatefilebox == 'function') {
		hnd.form_updatefilebox(record);
	}
}

function updaterecordstatus(record) {
	// apabila ada keperluan untuk update status record di sini


	if (typeof hnd.form_updaterecordstatus == 'function') {
		hnd.form_updaterecordstatus(record);
	}
}

function updatebuttonstate(record) {
	// apabila ada keperluan untuk update state action button di sini


	if (typeof hnd.form_updatebuttonstate == 'function') {
		hnd.form_updatebuttonstate(record);
	}
}

function updategridstate(record) {
	// apabila ada keperluan untuk update state grid list di sini


	if (typeof hnd.form_updategridstate == 'function') {
		hnd.form_updategridstate(record);
	}
}

function form_viewmodechanged(viewmode) {
	var OnViewModeChangedEvent = new CustomEvent('OnViewModeChanged', {detail: {}})
	$ui.triggerevent(OnViewModeChangedEvent, {
		viewmode: viewmode
	})
}

function form_idsetup(options) {
	var objid = obj.txt_empl_id
	switch (options.action) {
		case 'fill' :
			objid.textbox('disable') 
			break;

		case 'createnew' :
			// console.log('new')
			if (form.autoid) {
				objid.textbox('disable') 
				objid.textbox('setText', '[AUTO]') 
			} else {
				objid.textbox('enable') 
			}
			break;
			
		case 'save' :
			objid.textbox('disable') 
			break;	
	}
}


async function form_datasaving(data, options) {
	// cek dulu data yang akan disimpan,
	// apabila belum sesuai dengan yang diharuskan, batalkan penyimpanan
	//    options.cancel = true

	// Modifikasi object data, apabila ingin menambahkan variabel yang akan dikirim ke server
	// options.skipmappingresponse = ['auth_id', ];
	options.skipmappingresponse = [];
	for (var objid in obj) {
		var o = obj[objid]
		if (o.isCombo() && !o.isRequired()) {
			var id = o.getFieldValueName()
			options.skipmappingresponse.push(id)
			// console.log(id)
		}
	}

	if (typeof hnd.form_datasaving == 'function') {
		hnd.form_datasaving(data, options);
	}

}

async function form_datasaveerror(err, options) {
	// apabila mau olah error messagenya
	// $ui.ShowMessage(err.errormessage)
	console.log(err)
	if (typeof hnd.form_datasaveerror == 'function') {
		hnd.form_datasaveerror(err, options);
	}
}


async function form_datasaved(result, options) {
	// Apabila tidak mau munculkan dialog
	// options.suppressdialog = true

	// Apabila ingin mengganti message Data Tersimpan
	// options.savedmessage = 'Data sudah disimpan cuy!'

	// if (form.isNewData()) {
	// 	console.log('masukan ke grid')
	// 	$ui.getPages().ITEMS['pnl_list'].handler.updategrid(form.getData())
	// } else {
	// 	console.log('update grid')
	// }


	var data = {}
	Object.assign(data, form.getData(), result.dataresponse)
	/*
	form.setValue(obj.cbo_auth_id, result.dataresponse.auth_name!=='--NULL--' ? result.dataresponse.auth_id : '--NULL--', result.dataresponse.auth_name!=='--NULL--'?result.dataresponse.auth_name:'NONE')

	*/

	var pOpt = form.getDefaultPrompt(false)
	for (var objid in obj) {
		var o = obj[objid]
		if (o.isCombo() && !o.isRequired()) {
			var value =  result.dataresponse[o.getFieldValueName()];
			var text = result.dataresponse[o.getFieldDisplayName()];
			if (value==null ) {
				value = pOpt.value;
				text = pOpt.text;
			}
			form.setValue(o, value, text);
		}
	}
	form.rowid = $ui.getPages().ITEMS['pnl_list'].handler.updategrid(data, form.rowid)
	rowdata = {
		data: data,
		rowid: form.rowid
	}

	if (typeof hnd.form_datasaved == 'function') {
		hnd.form_datasaved(result, rowdata, options);
	}
}



async function form_deleting(data) {
	if (typeof hnd.form_deleting == 'function') {
		hnd.form_deleting(data);
	}
}

async function form_deleted(result, options) {
	$ui.getPages().show('pnl_list')
	$ui.getPages().ITEMS['pnl_list'].handler.removerow(form.rowid)

	if (typeof hnd.form_deleted == 'function') {
		hnd.form_deleted(result, options);
	}
}





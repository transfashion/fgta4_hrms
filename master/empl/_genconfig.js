'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Employee",
	autoid: true,
	icon : "icon-employee-white.png",

	persistent: {
		'mst_empl' : {
			primarykeys: ['empl_id'],
			comment: 'Master Employee',
			data: {
				empl_id: {text:'ID', type: dbtype.varchar(30), null:false, uppercase: true},
				empl_nik: {text:'NIK', type: dbtype.varchar(30), null:true, uppercase: true},
				empl_name: {text:'Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Karyawan harus diisi'}},
				empl_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
				empl_dtjoin: {text:'Join Date', type: dbtype.date, null:false, suppresslist: true, options:{required:true,invalidMessage:'Tanggal masuk harus diisi'}},
				empl_dtexit: {
					id: 'pnl_edit-empl_dtexit',
					text:'Exit Date', type: dbtype.date, null:true, suppresslist: true,},

				empl_birthplace: {text:'Birth Place', type: dbtype.varchar(30), null:false, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'Tempat lahir harus diisi'}},
				empl_birthdate: {text:'Birth Date', type: dbtype.date, null:true, suppresslist: true, options:{required:true,invalidMessage:'Tanggal lahir harus diisi'}},

				gender_id: {
					text:'Gender', type: dbtype.varchar(1), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Gender harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_gender', 
						field_value: 'gender_id', field_display: 'gender_name', 
						api: 'ent/general/gender/list'})				
				},

				religion_id: {
					text:'Religion', type: dbtype.varchar(3), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Religion harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_religion', 
						field_value: 'religion_id', field_display: 'religion_name', 
						api: 'ent/general/religion/list'})				
				},


				empl_addressline1: {
					id: 'pnl_edit-empl_addressline1',
					text:'Address', type: dbtype.varchar(255), null:true, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'Alamat harus diisi'}},
				empl_addressline2: {
					id: 'pnl_edit-empl_addressline2',
					text:'&nbsp;', type: dbtype.varchar(255), null:true, suppresslist: true, uppercase: true},
				empl_addressline3: {
					id: 'pnl_edit-empl_addressline3',
					text:'&nbsp;', type: dbtype.varchar(255), null:true, suppresslist: true, uppercase: true},

				empl_city: {text:'City', type: dbtype.varchar(20), null:true, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'Kota harus diisi'}},
				empl_postcode: {text:'Post Code', type: dbtype.varchar(10), null:false, suppresslist: true},
				empl_prov: {text:'Prov', type: dbtype.varchar(20), null:true, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'Propinsi harus diisi'}},

				country_id: {
					text:'Country', type: dbtype.varchar(10), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Country harus diisi'},
					comp: comp.Combo({
						table: 'mst_country', 
						field_value: 'country_id', field_display: 'country_name', 
						api: 'ent/general/country/list'})					
				},



				empl_mobilephone: {text:'HP', type: dbtype.varchar(30), null:false,  suppresslist: true, options:{required:true,invalidMessage:'HP harus diisi'},},	
				empl_phone: {text:'Phone', type: dbtype.varchar(30), null:false,  suppresslist: true},
				empl_email: {text:'Email', type: dbtype.varchar(120), null:true, suppresslist: true, lowercase: true, options:{required:true,validType:'email',invalidMessage:'Email harus diisi dan dengan format yang benar'}},

				edu_id: {
					text:'Education', type: dbtype.varchar(7), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Education harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_edu', 
						field_value: 'edu_id', field_display: 'edu_name', 
						api: 'hrms/master/edu/list'})				
				},

				empl_kk: {text:'KK', type: dbtype.varchar(30), null:true, suppresslist: true, uppercase: true},
				empl_ktp: {text:'KTP', type: dbtype.varchar(30), null:true, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'No KTP harus diisi'}},
				empl_npwp: {text:'NPWP', type: dbtype.varchar(30), null:true, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'NPWP harus diisi'}},

				marital_id: {
					text:'Marital', type: dbtype.varchar(2), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Status marital harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_marital', 
						field_value: 'marital_id', field_display: 'marital_name', 
						api: 'hrms/master/marital/list'})				
				},


				empl_bpjstk: {text:'BPJS Tk', type: dbtype.varchar(30), null:true, suppresslist: true, uppercase: true},
				empl_bpjskes: {text:'BPJS Kes', type: dbtype.varchar(30), null:true, suppresslist: true, uppercase: true},


				empl_namaibu: {text:'Nama Ibu Kandung', type: dbtype.varchar(90), null:false, suppresslist: true, uppercase: true, options:{required:true,invalidMessage:'Nama ibu kandung harus diisi'}},
				empl_rek1: {text:'Rekening #1', type: dbtype.varchar(90), null:false, suppresslist: true, uppercase: true},
				empl_rek2: {text:'Rekening #2', type: dbtype.varchar(90), null:false, suppresslist: true, uppercase: true},

				hrstatus_id: {
					text:'Status', type: dbtype.varchar(3), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Status harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_hrstatus', 
						field_value: 'hrstatus_id', field_display: 'hrstatus_name', 
						api: 'hrms/master/hrstatus/list'})				
				},


				dept_id: {
					text:'Dept', type: dbtype.varchar(30), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Dept harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', 
						api: 'ent/organisation/dept/list'})				
				},

				hrjob_id: {
					text:'Job', type: dbtype.varchar(20), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Job harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_hrjob', 
						field_value: 'hrjob_id', field_display: 'hrjob_name', 
						api: 'hrms/master/hrjob/list'})				
				},

				site_id: {
					text:'Site', type: dbtype.varchar(30), null:true, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Site harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_site', 
						field_value: 'site_id', field_display: 'site_name', 
						api: 'ent/location/site/list'})				
				},

				auth_id: {
					text:'Auth Override', type: dbtype.varchar(30), null:true, uppercase: true, suppresslist: true,
					options:{prompt:'NONE'},
					comp: comp.Combo({
						table: 'mst_auth', 
						field_value: 'auth_id', field_display: 'auth_name', 
						api: 'ent/organisation/auth/list'})				
				},

			},

			defaultsearch : ['empl_id', 'empl_nik', 'empl_name'],

			uniques: {
				'empl_nik' : ['empl_nik'],
				'empl_email' : ['empl_email']
			}		
		}
	},

	schema: {
		title: 'Employee',
		header: 'mst_empl',
		detils: {


		}
	}
}


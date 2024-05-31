'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Employee Mutation",
	autoid: true,
	committer: true,
	approval: true,
	dept_id_field: 'user_dept_id',
	doc_id: 'HREMPLMUT',
	creatorname: "Agung Nugroho",
	creatoremail: "agung.dhewe@gmail.com", 
	description: `
		program untuk melakukan pemindahan lokasi, organisai, dan job karyawan
	`,

	persistent: {
		'trn_hremplmut' : {
			primarykeys: ['hremplmut_id'],
			comment: 'Mutasi karyawan',
			data: {
				hremplmut_id: { text: 'ID', type: dbtype.varchar(30), null: false},
				hremplmutmodel_id: {
					text:'Model', type: dbtype.varchar(10), null:false,
					options:{required: true, invalidMessage:'Model harus diisi'},
					comp: comp.Combo({
						table: 'mst_hremplmutmodel', 
						api: 'hrms/hrd/hremplmutmodel/list',
						field_value: 'hremplmutmodel_id', field_display: 'hremplmutmodel_name', 
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: true
					})
				},				

				empl_id: {
					text:'Employee', type: dbtype.varchar(30), null:false, 
					options:{required: true, invalidMessage:'Employee harus diisi'},
					comp: comp.Combo({
						table: 'mst_empl', 
						api: 'hrms/master/empl/list',
						field_value: 'empl_id', field_display: 'empl_name', 
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: true
					})
				},	

				site_id: {
					text:'Site', type: dbtype.varchar(30), null:false, suppresslist: true, 
					options:{required: true, invalidMessage:'Site harus diisi'},
					comp: comp.Combo({
						table: 'mst_site', 
						api: 'ent/location/site/list',
						field_value: 'site_id', field_display: 'site_name', 
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: true
					})
				},		

				dept_id: {
					text: 'Dept', type: dbtype.varchar(30), null:true, suppresslist: true, 
					options:{required: true, invalidMessage:'Dept harus diisi'},
					comp: comp.Combo({
						title: 'Pilih Default Sub Account Departemen',
						api: 'ent/organisation/dept/list',
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', 
						field_mappings: [
							`{mapping: 'dept_id', text: 'ID', style: 'width: 100px', hidden: true}`,
							`{mapping: 'dept_name', text: 'Dept', style: 'width: auto'}`,
							`{mapping: 'depttype_name', text: 'Type', style: 'width: 200px'}`,
						], 
						onDataLoadingHandler: false,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: true
					
					
					})				
				},

				deptmodel_id: {
					text:'Dept Model', type: dbtype.varchar(10), null:false, suppresslist: true, hidden: true,
					options:{disabled: true, required: true, invalidMessage:'Dept Model harus diisi'},
					comp: comp.Combo({
						table: 'mst_deptmodel', 
						api: 'ent/organisation/deptmodel/list',
						field_value: 'deptmodel_id', field_display: 'deptmodel_name', 
						onDataLoadingHandler: false,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false
					})
				},	

				hrgrd_value: {
					text:'Grade', type: dbtype.int(4), null:false, default:'0', suppresslist: true, hidden: true,
					options: {disabled: true}},

				hrjob_id: {
					text:'Job', type: dbtype.varchar(20), null:false, suppresslist: true, 
					options:{required: true, invalidMessage:'Dept Model harus diisi'},
					comp: comp.Combo({
						table: 'mst_hrjob', 
						api: 'hrms/hrd/hrjob/list',
						field_value: 'hrjob_id', field_display: 'hrjob_name', 
						onDataLoadingHandler: false,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false
					})
				},	

				hremplmut_effdate: { text: 'Eff.Date', type: dbtype.date, null: false },
				hremplmut_descr: { text: 'Descr', type: dbtype.varchar(255), null: true, options: {} },
				doc_id: {
					text:'Doc', type: dbtype.varchar(30), null:false, suppresslist: true,
					options: {required:true, invalidMessage:'ID harus diisi', disabled:true },
					comp: comp.Combo({
						table: 'mst_doc',
						field_value: 'doc_id', field_display: 'doc_name', field_display_name: 'doc_name',
						api: 'ent/organisation/docs/list'
					})				
				},

				prev_site_id: {
					section: section.Begin('Previous'),
					text:'Site', type: dbtype.varchar(30), null:false, suppresslist: true, 
					options:{disabled: true, required: true, invalidMessage:'Site harus diisi'},
					comp: comp.Combo({
						table: 'mst_site', 
						api: 'ent/location/site/list',
						field_value: 'site_id', field_display: 'site_name', field_display_name: 'prev_site_name'
					})
				},		

				prev_dept_id: {
					text: 'Dept', type: dbtype.varchar(30), null:true, suppresslist: true, 
					options:{disabled:true, required: true, invalidMessage:'Dept harus diisi'},
					comp: comp.Combo({
						title: 'Pilih Default Sub Account Departemen',
						api: 'ent/organisation/dept/list',
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', field_display_name: 'prev_dept_name'
					})				
				},

				prev_deptmodel_id: {
					text:'Dept Model', type: dbtype.varchar(10), null:false, suppresslist: true, 
					options:{disabled: true, required: true, invalidMessage:'Dept Model harus diisi'},
					comp: comp.Combo({
						table: 'mst_deptmodel', 
						api: 'ent/organisation/deptmodel/list',
						field_value: 'deptmodel_id', field_display: 'deptmodel_name', field_display_name: 'prev_deptmodel_name'
					})
				},	

				prev_hrgrd_value: {text:'Grade', type: dbtype.int(4), null:false, default:'0', suppresslist: true, options: {disabled: true}},


				prev_hrjob_id: {
					section: section.End(),
					text:'Job', type: dbtype.varchar(20), null:false, suppresslist: true, 
					options:{disabled: true, required: true, invalidMessage:'Dept Model harus diisi'},
					comp: comp.Combo({
						table: 'mst_hrjob', 
						api: 'hrms/hrd/hrjob/list',
						field_value: 'hrjob_id', field_display: 'hrjob_name', field_display_name: 'prev_hrjob_name'
					})
				},	



				hremplmutmodel_issitemut: {
					section: section.Begin('Settings'),
					text:'Site Mutation', type: dbtype.boolean, null:false, default:'0', suppresslist: true, 
					options: {disabled: true, labelWidth:'200px'}},
				hremplmutmodel_isdeptmut: {
					text:'Departement Mutation', type: dbtype.boolean, null:false, default:'0', suppresslist: true, 
					options: {disabled: true, labelWidth:'200px'}},
				hremplmutmodel_isjobmut: {
					text:'Job Mutation', type: dbtype.boolean, null:false, default:'0',suppresslist: true,  
					options: {disabled: true, labelWidth:'200px'}},
				hremplmutmodel_isgradecheck: {
					text:'Grade Check', type: dbtype.boolean, null:false, default:'0', suppresslist: true, 
					options: {disabled: true, labelWidth:'200px'}},
				hremplmutmodel_gradedir: {
					section: section.End(),
					text:'Direction', type: dbtype.int(1), null:false, default:'0', suppresslist: true,
					options: {disabled: true}
				},


				user_empl_id: {
					section: section.Begin('Requestor'),
					text:'Employee', type: dbtype.varchar(30), null:false, suppresslist: true,
					options:{disabled:true, required: true, invalidMessage:'Employee harus diisi'},
					comp: comp.Combo({
						table: 'mst_empl', 
						api: 'hrms/master/empl/list',
						field_value: 'empl_id', field_display: 'empl_name', field_display_name: 'user_empl_name',
					})
				},						
				user_dept_id: {
					section: section.End(),
					text: 'Dept', type: dbtype.varchar(30), null:true, suppresslist: true, 
					options:{disabled:true, required: true, invalidMessage:'Dept harus diisi'},
					comp: comp.Combo({
						title: 'Pilih Default Sub Account Departemen',
						api: 'ent/organisation/dept/list',
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', field_display_name: 'user_dept_name'
					})				
				},


				hremplmut_version: {
					section: section.Begin('Document Status'),
					text:'Doc Version', type: dbtype.int(4), null:false, default:'0', suppresslist: true, options:{disabled:true}},
				hremplmut_rejectnotes: { text: 'Reject Notes', type: dbtype.varchar(255), null: true,  unset:true, suppresslist: true, options:{disabled: true} },
				hremplmut_iscommit: {text:'Commit', type: dbtype.boolean, null:false, default:'0', unset:true, suppresslist: true, options:{disabled:true}},
				hremplmut_commitby: {text:'CommitBy', type: dbtype.varchar(14), suppresslist: true, unset:true, options:{disabled:true}, hidden: true, lookup:'user'},
				hremplmut_commitdate: {text:'CommitDate', type: dbtype.datetime, suppresslist: true, unset:true, comp:comp.Textbox(), options:{disabled:true}, hidden: true},	
				hremplmut_isapprovalprogress: {text:'Progress', type: dbtype.boolean, null:false, default:'0', unset:true, suppresslist: true, options:{disabled:true}, hidden: true},
				hremplmut_isapproved: { text: 'Approved', type: dbtype.boolean, null: false, default: '0', unset:true, suppresslist: true, options: { disabled: true } },
				hremplmut_approveby: { text: 'Approve By', type: dbtype.varchar(14), suppresslist: true, unset:true, options: { disabled: true }, hidden: true, lookup:'user' },
				hremplmut_approvedate: { text: 'Approve Date', type: dbtype.datetime, suppresslist: true, unset:true, comp: comp.Textbox(), options: { disabled: true }, hidden: true },
				hremplmut_isdeclined: { text: 'Declined', type: dbtype.boolean, null: false, default: '0', unset:true, suppresslist: true, options: { disabled: true } },
				hremplmut_declineby: { text: 'Decline By', type: dbtype.varchar(14), suppresslist: true, unset:true, options: { disabled: true }, hidden: true, lookup:'user' },
				hremplmut_declinedate: { text: 'Decline Date', type: dbtype.datetime, suppresslist: true, unset:true, comp: comp.Textbox(), options: { disabled: true }, hidden: true },
				hremplmut_isexecute: {	text:'Executed', type: dbtype.boolean, null:false, default:'0', unset:true, suppresslist: true, options:{disabled:true}},
				hremplmut_executeby: { text: 'Execute By', type: dbtype.varchar(14), suppresslist: true, unset:true, options: { disabled: true }, hidden: true, lookup:'user' },
				hremplmut_executedate: { 
					section: section.End(),
					text: 'Execute Date', type: dbtype.datetime, suppresslist: true, unset:true, comp: comp.Textbox(), options: { disabled: true }, hidden: true },
	

			},

			defaultsearch : ['hremplmut_id', 'site_id', 'prev_site_id'],

			
		}
	},

	schema: {
		title: 'Employee Mutation',
		header: 'trn_hremplmut',
		detils: {}
	},

	permissions: {
		setting: 'RESTRICT_HREMPLMUTATION',
		data: {
			HREMPLMUT_REQUEST: '',
			HREMPLMUT_APPROVE: ''
		}
	}
}


		
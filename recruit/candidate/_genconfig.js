'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Employee Candidate",
	autoid: true,
	// icon :  "icon-hrjob-white.png",
	notes: `data tampungan candidate employee yang akan digunakan ke employee kontrak`,

	// preloadscripts: ['jslibs/easyui/jquery.texteditor.js'],
	// preloadstyles: ['jslibs/easyui/texteditor.css'],

	persistent: {
		'mst_hrcdt' : {
			primarykeys: ['hrcdt_id'],
			comment: 'Daftar Master Candidate Employee',
			data: {
				hrcdt_id: {text:'ID', type: dbtype.varchar(36), null:false, suppresslist:true },
				hrcdt_name: {text:'Name', type: dbtype.varchar(255), null:false, uppercase: true, options: {required: true, invalidMessage: 'Name harus diisi'}, },
				hrcdt_photo: {text:'Photo', type: dbtype.varchar(100), null:false, suppresslist:true, comp: comp.Filebox(), },
				gender_id: {
					text:'Gender', type: dbtype.varchar(1), null:false, uppercase: true, suppresslist:true, 
					options: {required: true, invalidMessage: 'Gender harus diisi', prompt: '-- PILIH --'}, 
					comp: comp.Combo({
						table: 'mst_gender',
						field_value: 'gender_id', 
						field_display: 'gender_name',
						api: 'ent/general/gender/list'
					})
				},
				hrcdt_birthplace: {text:'Birth Place', type: dbtype.varchar(255), null:false, uppercase: true, suppresslist:true, options: {required: true, invalidMessage: 'Birth Place harus diisi'}, },
				hrcdt_birthdate: {text:'Birth Date', type: dbtype.date, null:false, suppresslist:true, options: {required: true, invalidMessage: 'Birth Date harus diisi'}, },

				hrcdt_ktp: {text:'No. KTP', type: dbtype.varchar(100), null:false, options: {required: true, invalidMessage: 'No. KTP harus diisi'}, },

				hrcdt_address: {
					text:'Address (KTP)', type: dbtype.varchar(255), null:false, suppresslist:true, 
					options: {required: true, multiline: true, invalidMessage: 'Address KTP harus diisi'}, 
					tips: 'Alamat Sesuai KTP',
				},
				hrcdt_addressdom: {
					text:'Address (Domisili)', type: dbtype.varchar(255), null:false, suppresslist:true, 
					options: {required: true, multiline: true, invalidMessage: 'Address Domisili harus diisi'}, 
					tips: 'Alamat Domisili',
				},
				hrcdt_email: {text:'Email', type: dbtype.varchar(255), null:false, options: {required: true, invalidMessage: 'Email harus diisi', validType: 'email'}, },
				hrcdt_handphone: {text:'Handphone', type: dbtype.varchar(20), null:false, options: {required: true, invalidMessage: 'Handphone harus diisi'}, },
				hrcdt_telp: {text:'Telp', type: dbtype.varchar(20), null: true, suppresslist:true, options: {required: false, }, },
				
				marital_id: {
					text:'Marital Status', type: dbtype.varchar(2), null:false, uppercase: true, suppresslist:true, 
					options: {required: true, invalidMessage: 'Marital Status harus diisi', prompt: '-- PILIH --'}, 
					comp: comp.Combo({
						table: 'mst_marital',
						field_value: 'marital_id',
						field_display: 'marital_name',
						api: 'hrms/master/marital/list'
					})
				},

				religion_id: {
					text:'Religion', type: dbtype.varchar(3), null:false, uppercase: true, suppresslist:true, 
					options: {required: true, invalidMessage: 'Religion harus diisi', prompt: '-- PILIH --'}, 
					comp: comp.Combo({
						table: 'mst_religion',
						field_value: 'religion_id', 
						field_display: 'religion_name',
						api: 'ent/general/religion/list'
					})
				},
			},

			defaultsearch: ['hrcdt_name', 'hrcdt_email', 'hrcdt_handphone', 'hrcdt_ktp'],

			uniques: {
				'hrcdt_email' : ['hrcdt_email'],
				'hrcdt_handphone' : ['hrcdt_handphone'],
				'hrcdt_ktp' : ['hrcdt_ktp'],
			},

		},

		'mst_hrcdtedu': {
			primarykeys: ['hrcdtedu_id'],
			data: {
				hrcdtedu_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true },
				edu_id: {
					text:'Level', type: dbtype.varchar(7), null:false, 
					options: {required: true, invalidMessage: 'Level harus diisi'}, 
					comp: comp.Combo({
						table: 'mst_edu',
						field_value: 'edu_id', 
						field_display: 'edu_name',
						api: 'hrms/master/edu/list'
					})
				},
				hrcdtedu_name: {
					text:'Name', type: dbtype.varchar(255), null:false, 
					options: {required: true, invalidMessage: 'Name harus diisi'},
					comment: `Nama institusi pendidikan`
				},
				hrcdtedu_title: {text:'Title', type: dbtype.varchar(255), null: true, options: {required: false, }, },
				hrcdtedu_city: {text:'City', type: dbtype.varchar(255), null:false, options: {required: true, invalidMessage: 'City harus diisi'}, },
				hrcdtedu_gpa: {
					text:'GPA', type: dbtype.int(4), null:false, 
					options: {required: true, invalidMessage: 'GPA harus diisi'}, 
					comment: 'grade nilai kelulusan'
				},
				hrcdt_id: {text:'hrcdt ID', type: dbtype.varchar(36), null:false, hidden: true },
			},
			defaultsearch: ['hrcdtedu_name'],
			uniques: {},
		},

		'mst_hrcdtfam': {
			primarykeys: ['hrcdtfam_id'],
			data: {
				hrcdtfam_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true},
				hrrel_id: {
					text:'Relation', type: dbtype.varchar(3), null:false,
					options: {required: true, invalidMessage: 'Relation harus diisi', prompt: '-- PILIH --'}, 
					comp: comp.Combo({
						table: 'mst_hrrel',
						field_value: 'hrrel_id', 
						field_display: 'hrrel_name',
						api: 'hrms/master/hrrel/list'
					}),
					after: `<?php $cp=__DIR__ . '/candidate-candidatefamform-relationship.phtml'; if (is_file($cp)) { include $cp; } ?>`,
				},

				hrcdtfam_name: {text:'Name', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'Name harus diisi'}, },
				gender_id: {
					text:'Gender', type: dbtype.varchar(1), null:false, uppercase: true, 
					options: {required: true, invalidMessage: 'Gender harus diisi', prompt: '-- PILIH --'}, 
					comp: comp.Combo({
						table: 'mst_gender',
						field_value: 'gender_id', 
						field_display: 'gender_name',
						api: 'ent/general/gender/list'
					})
				},

				hrcdtfam_birthplace: {text:'Birth Place', type: dbtype.varchar(255), null:true, uppercase:true,  options: {required: false, }, },
				hrcdtfam_birthdate: {text:'Birth Date', type: dbtype.date, null: true, options: {required: false, }, },
				hrcdtfam_handphone: {text:'Handphone', type: dbtype.varchar(14), null: true, options: {required: false, }, },

				hrcdt_id: {text:'hrcdt ID', type: dbtype.varchar(36), null:false, hidden: true },
			},
			defaultsearch: ['hrcdtfam_name', 'hrcdtfam_handphone'],
			uniques: {},
		},

		'mst_hrcdttrain': {
			primarykeys: ['hrcdttrain_id'],
			data: {
				hrcdttrain_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true },
				hrcdttrain_name: {text:'Name', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
				hrcdttrain_organizer: {text:'Organizer', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
				hrcdttrain_city: {text:'City', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
				hrcdttrain_year: {text:'Year', type: dbtype.int(4), null:false, options: {required: true, invalidMessage: 'ID harus diisi'}, },
				hrcdttrain_descr: {text:'Descr', type: dbtype.varchar(255), null: true, options: {required: false, multiline: true, }, },
				hrcdt_id: {text:'hrcdt ID', type: dbtype.varchar(36), null:false, hidden: true },
			},
			defaultsearch: ['hrcdttrain_name', 'hrcdttrain_organizer'],
			uniques: {},
		},

		'mst_hrcdtjobexp': {
			primarykeys: ['hrcdtjobexp_id'],
			data: {
				hrcdtjobexp_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true},
				hrcdtjobexp_company: {text:'Company', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'Name harus diisi'}, },
				hrcdtjobexp_position: {text:'Position', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'Position harus diisi'}, },
				hrcdtjobexp_dtjoin: {text:'Date Join', type: dbtype.date, null:false, options: {required: true, invalidMessage: 'Date Join harus diisi'}, },
				hrcdtjobexp_dtleave: {text:'Date Leave', type: dbtype.date, null:false, options: {required: true, invalidMessage: 'Date Leave harus diisi'}, },
				hrcdtjobexp_jobdescr: {
					text:'Job Descr', type: dbtype.varchar(255), null:false, 
					hidden: true,	
					after: `
					<div class="form_row pnl_edithrcdtjobexpform_row" >
						<div class="form_label_col"  style="border: 0px solid black; vertical-align: top; margin-top: 7px;">Job Descr</div>
						<div class="form_input_col" style="border: 0px solid black">
							<input id="pnl_edithrcdtjobexpform-txt_hrcdtjobexp_jobdescr-editor" class="easyui-texteditor" style="width:400px;height:300px;padding:20px">
						</div>
					</div>					
					`
				},



				hrcdtjobexp_reasonleave: {text:'Reason Leave', type: dbtype.varchar(255), null:false, options: {required: true, multiline: true, invalidMessage: 'Reason Leave harus diisi'}, },
				hrcdt_id: {text:'hrcdt ID', type: dbtype.varchar(36), null:false, hidden: true },
			},
			defaultsearch: ['hrcdtjobexp_company', 'hrcdtjobexp_position'],
			uniques: {},
		},

		'mst_hrcdtorg': {
			primarykeys: ['hrcdtorg_id'],
			data: {
				hrcdtorg_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true},
				hrcdtorg_name: {text:'Name', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'Name harus diisi'}, },
				hrcdtorg_city: {text:'City', type: dbtype.varchar(255), null:false, options: {required: true, invalidMessage: 'City harus diisi'}, },
				hrcdtorg_position: {text:'Position', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'Position harus diisi'}, },
				hrcdtorg_descr: {text:'Descr', type: dbtype.varchar(255), null: true, options: {required: false, multiline: true}, },
				hrcdt_id: {text:'hrcdt ID', type: dbtype.varchar(36), null:false, hidden: true},
			},
			defaultsearch: ['hrcdtorg_name'],
			uniques: {},
		},

		'mst_hrcdtreff': {
			primarykeys: ['hrcdtreff_id'],
			data: {
				hrcdtreff_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true },
				hrcdtreff_name: {text:'Name', type: dbtype.varchar(255), null:false, uppercase:true, options: {required: true, invalidMessage: 'Name harus diisi'}, },
				hrcdtreff_relation: {text:'Relation', type: dbtype.varchar(20), null:false, options: {required: true, invalidMessage: 'Relation harus diisi'}, },
				hrcdtreff_handphone: {text:'Handphone', type: dbtype.varchar(14), null: true },
				hrcdt_id: {text:'hrcdt ID', type: dbtype.varchar(36), null:false, hidden: true },
			},
			defaultsearch: ['hrcdtreff_name'],
			uniques: {},
		},

		'mst_hrcdtattch': {
			primarykeys: ['hrcdtattch_id'],
			data: {
				hrcdtattch_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist:true },
				hrcdtattch_name: {text:'Name', type: dbtype.varchar(255), null:false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
				hrcdtattch_filename: {text:'File', type: dbtype.varchar(50), null:false, options: {required: true, invalidMessage: 'File harus diisi'}, comp: comp.Filebox(), },
				hrcdtattch_validity: {text:'Validity', type: dbtype.date, null:false, options: {required: true, invalidMessage: 'Validity harus diisi'}, },
				hrcdtattch_expired: {text:'Expired', type: dbtype.date, null: true, options: {required: false}, },
				hrcdtdate_id: {text:'Candidate ID', type: dbtype.varchar(36), null:false, hidden: true },
			},
			defaultsearch: ['hrcdtattch_name'],
			uniques: {},
		},
	},

	schema: {
		title: 'Employee Candidate',
		header: 'mst_hrcdt',
		detils: {
			'hrcdtedu' : {
				title: 'Education', table: 'mst_hrcdtedu', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
			'hrcdtfam' : {
				title: 'Family', table: 'mst_hrcdtfam', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
			'hrcdttrain' : {
				title: 'Training', table: 'mst_hrcdttrain', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
			'hrcdtjobexp' : {
				title: 'Job Experience', table: 'mst_hrcdtjobexp', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
			'hrcdtorg' : {
				title: 'Organization', table: 'mst_hrcdtorg', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
			'hrcdtreff' : {
				title: 'Reference', table: 'mst_hrcdtreff', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
			'hrcdtattch' : {
				title: 'Attachment', table: 'mst_hrcdtattch', form: true, headerview: 'hrcdt_name',
				editorHandler: true,
				listHandler: true
			},
		}
	}
}






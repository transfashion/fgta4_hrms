'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Attendance Summary",
	autoid: true,

	persistent: {
		'trn_hratdsum' : {
			comment: 'Inquiry item',
			primarykeys: ['hratdsum_id'],
			data: {
				hratdsum_id: { text: 'ID', type: dbtype.varchar(30), null: false },
				hratdsum_dt: { text:'Date', type: dbtype.date, null:false, suppresslist: false},
				empl_id: {
					class: 'head-step2 head-step2-hidden',
					text:'Responsible Empl', type: dbtype.varchar(30), null:true, suppresslist: false,
					options:{prompt:'NONE'},
					autobylogin: 'empl',
					comp: comp.Combo({
						title: 'Pilih Karyawan',
						table: 'mst_empl', 
						field_value: 'empl_id', field_display: 'empl_name',  field_display_name: 'empl_name',
						api: 'hrms/master/empl/list'				
					})
				},	

				position: { text: 'Position', type: dbtype.varchar(60) },
				organisation: { text: 'Organisation', type: dbtype.varchar(60) },

				schd_in: { text: 'Schedule In', type: dbtype.time },
				schd_out: { text: 'Schedule Out', type: dbtype.time },

				actual_in: { text: 'Actual In', type: dbtype.time },
				actual_out: { text: 'Actual Out', type: dbtype.time },

				actual_invar: { text: 'Actual In Var', type: dbtype.int(8) },
				actual_outvar: { text: 'Actual Out Var', type: dbtype.int(8) },
				actual_workeff: { text: 'Working Effective', type: dbtype.int(8) },

				daytype: { text: 'Position', type: dbtype.varchar(30) },
				
				score_late: { text: 'Working Effective', type: dbtype.decimal(4,2) },
				score_workeff: { text: 'Working Effective', type: dbtype.decimal(4,2) },
				score_add: { text: 'Working Effective', type: dbtype.decimal(4,2) },
				score_total: { text: 'Working Effective', type: dbtype.decimal(4,2) },
			},

			uniques: {
				'hratdsum_empldate' : ['hratdsum_dt', 'empl_id']
			}
		}
	},

	schema: {
		title: 'Attendance Summary',
		header: 'trn_hratdsum',
		detils: {
		}
	}
}	
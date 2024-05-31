'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Mutation Model",
	autoid: false,

	persistent: {
		'mst_hremplmutmodel' : {
			primarykeys: ['hremplmutmodel_id'],
			comment: 'Daftar model mutasi karyawan',
			data: {

				hremplmutmodel_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				hremplmutmodel_name: {text:'Model Name', type: dbtype.varchar(90), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama harus diisi'}},
				hremplmutmodel_descr: {text:'Descr', type: dbtype.varchar(255), null:true, suppresslist: true},
				hremplmutmodel_issitemut: {text:'Site Mutation', type: dbtype.boolean, null:false, default:'0', options: {labelWidth:'200px'}},
				hremplmutmodel_isdeptmut: {text:'Departement Mutation', type: dbtype.boolean, null:false, default:'0', options: {labelWidth:'200px'}},
				hremplmutmodel_isjobmut: {text:'Job Mutation', type: dbtype.boolean, null:false, default:'0', options: {labelWidth:'200px'}},
				hremplmutmodel_isgradecheck: {text:'Grade Check', type: dbtype.boolean, null:false, default:'0', options: {labelWidth:'200px'}},
				hremplmutmodel_gradedir: {text:'Direction', type: dbtype.int(1), null:false, default:'0', suppresslist: true},
			},

			defaultsearch: ['hremplmutmodel_id', 'hremplmutmodel_name'],

			uniques: {
				'hremplmutmodel_name' : ['hremplmutmodel_name']
			},


		},
	},

	schema: {
		title: 'Employee Mutation Model',
		header: 'mst_hremplmutmodel',
		detils: {}
	}
}






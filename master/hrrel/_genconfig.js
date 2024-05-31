'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "HR Relation",
	autoid: false,

	persistent: {
		'mst_hrrel' : {
			primarykeys: ['hrrel_id'],
			comment: 'Master HR Grade',
			data: {
				hrrel_id: {text:'ID', type: dbtype.varchar(3), null:false, uppercase: true},
				hrrel_name: {text:'Relation Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Relasi harus diisi'}},
			},

			defaultsearch : ['hrrel_id', 'hrrel_name'],

			uniques: {
				'hrrel_name' : ['hrrel_name']
			},

			values: [
				{hrrel_id:'S', hrrel_name:'SUAMI'},
				{hrrel_id:'I', hrrel_name:'ISTRI'},
				{hrrel_id:'A', hrrel_name:'ANAK'},
			],			
		}
	},

	schema: {
		title: 'HR Relation',
		header: 'mst_hrrel',
		detils: {}
	}
}


'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Kegiatan",
	autoid: true,
	icon: "bitcoin.png",

	persistent: {
		'mst_kegaitan' : {
			primarykeys: ['kegiatan_id'],
			comment: 'Master Kegiatan',
			data: {
				kegiatan_id: {text:'ID', type: dbtype.varchar(14), null:false},
				kegiatan_date: {text:'Tgl', type: dbtype.date, null:false, options:{required:true,invalidMessage:'Tanggal masuk harus diisi'}},
				kegiatan_descr: {text:'Kegiatan', type: dbtype.varchar(90), null:false,  options:{required:true, invalidMessage:'Deskripsi Kegiatan harus diisi'}},
			},
			defaultsearch : ['kegiatan_id', 'kegiatan_descr'],
		
		}
	},

	schema: {
		title: 'Kegiatan',
		header: 'mst_kegaitan',
		detils: {}
	}
}

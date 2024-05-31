'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Candidate Employee",
	autoid: true,
	icon :  "icon-hrjob-white.png",
	notes: `sebagai data tampungan candidate employee yang akan digunakan ke employee kontrak`,

	persistent: {
		'mst_candidate' : {
			primarykeys: ['candidate_id'],
			comment: 'Daftar Master Candidate Employee',
			data: {
                candidate_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidate_photo: {text:'Photo', type: dbtype.varchar(100), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Photo harus diisi'}, comp: comp.Filebox(), },
                candidate_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candidate_birthdate: {text:'Birth Date', type: dbtype.date, null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Birth Date harus diisi'}, },
                candidate_birthplace: {text:'Birth Place', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Birth Place harus diisi'}, },
                candidate_email: {text:'Email', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Email harus diisi', validType: 'email'}, },
                candidate_telp: {text:'Telp', type: dbtype.varchar(20), null: true, uppercase: false, suppresslist: true, options: {required: false, }, },
                candidate_handphone: {text:'Handphone', type: dbtype.varchar(20), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Handphone harus diisi'}, },
                candidate_addressdom: {text:'Address Domisili', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: true, options: {required: true, multiline: true, invalidMessage: 'Address Domisili harus diisi'}, },
                candidate_address: {text:'Address KTP', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: true, options: {required: true, multiline: true, invalidMessage: 'Address KTP harus diisi'}, },
                candidate_ktp: {text:'No. KTP', type: dbtype.varchar(100), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'No. KTP harus diisi'}, },
                
                marital_id: {
                    text:'Marital Status', type: dbtype.varchar(2), null: false, uppercase: true, suppresslist: true, 
                    options: {required: true, invalidMessage: 'Marital Status harus diisi', prompt: '-- PILIH --'}, 
                    comp: comp.Combo({
                        table: 'mst_marital',
                        field_value: 'marital_id',
                        field_display: 'marital_name',
                        api: 'hrms/master/marital/list'
                    })
                },

                gender_id: {
                    text:'Gender', type: dbtype.varchar(1), null: false, uppercase: true, suppresslist: true, 
                    options: {required: true, invalidMessage: 'Gender harus diisi', prompt: '-- PILIH --'}, 
                    comp: comp.Combo({
                        table: 'mst_gender',
                        field_value: 'gender_id', 
                        field_display: 'gender_name',
                        api: 'ent/general/gender/list'
                    })
                },

                religion_id: {
                    text:'Religion', type: dbtype.varchar(3), null: false, uppercase: true, suppresslist: true, 
                    options: {required: true, invalidMessage: 'Religion harus diisi', prompt: '-- PILIH --'}, 
                    comp: comp.Combo({
                        table: 'mst_religion',
                        field_value: 'religion_id', 
                        field_display: 'religion_name',
                        api: 'ent/general/religion/list'
                    })
                },
			},

			defaultsearch: ['candidate_name', 'candidate_email', 'candidate_handphone', 'candidate_ktp'],

			uniques: {
                'candidate_email' : ['candidate_email'],
				'candidate_handphone' : ['candidate_handphone'],
                'candidate_ktp' : ['candidate_ktp'],
			},

		},

        'mst_candidateedu': {
            primarykeys: ['candidateedu_id'],
            data: {
                candidateedu_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidateedu_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candidateedu_pass: {text:'Pass', type: dbtype.int(4), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Pass harus diisi'}, },
                candidateedu_city: {text:'City', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'City harus diisi'}, },
                candidateedu_title: {text:'Title', type: dbtype.varchar(255), null: true, uppercase: false, suppresslist: false, options: {required: false, }, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
                edu_id: {
                    text:'Level', type: dbtype.varchar(7), null: false, uppercase: false, suppresslist: false, 
                    options: {required: true, invalidMessage: 'Level harus diisi'}, 
                    comp: comp.Combo({
                        table: 'mst_edu',
                        field_value: 'edu_id', 
                        field_display: 'edu_name',
                        api: 'hrms/master/edu/list'
                    })
                },
            },
            defaultsearch: ['candidateedu_name'],
            uniques: {},
        },

        'mst_candaidatefam': {
            primarykeys: ['candidatefam_id'],
            data: {
                candidatefam_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatefam_relation: {
                    text: 'Relation', type: dbtype.varchar(20), null: false, default: '0', suppresslist: false, options: {required: true, invalidMessage: 'Relationship harus diisi'},
                    after: `<?php $cp=__DIR__ . '/candidate-candaidatefamform-relationship.phtml'; if (is_file($cp)) { include $cp; } ?>`,
                },
                candidatefam_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candidatefam_birthdate: {text:'Birth Date', type: dbtype.date, null: true, uppercase: false, suppresslist: false, options: {required: false, }, },
                candidatefam_birthplace: {text:'Birth Place', type: dbtype.varchar(255), null: true, uppercase: false, suppresslist: false, options: {required: false, }, },
                candidatefam_handphone: {text:'Handphone', type: dbtype.varchar(14), null: true, uppercase: false, suppresslist: false, options: {required: false, }, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
                gender_id: {
                    text:'Gender', type: dbtype.varchar(1), null: false, uppercase: true, suppresslist: false, 
                    options: {required: true, invalidMessage: 'Gender harus diisi', prompt: '-- PILIH --'}, 
                    comp: comp.Combo({
                        table: 'mst_gender',
                        field_value: 'gender_id', 
                        field_display: 'gender_name',
                        api: 'ent/general/gender/list'
                    })
                },
            },
            defaultsearch: ['candidatefam_name', 'candidatefam_handphone'],
            uniques: {},
        },

        'mst_candidatetrain': {
            primarykeys: ['candidatetrain_id'],
            data: {
                candidatetrain_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatetrain_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatetrain_organizer: {text:'Organizer', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatetrain_year: {text:'Year', type: dbtype.int(4), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatetrain_descr: {text:'Descr', type: dbtype.varchar(255), null: true, uppercase: false, suppresslist: false, options: {required: false, multiline: true, }, },
                candidatetrain_city: {text:'City', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
            },
            defaultsearch: ['candidatetrain_name', 'candidatetrain_organizer'],
            uniques: {},
        },

        'mst_candidatejobexp': {
            primarykeys: ['candidatejobexp_id'],
            data: {
                candidatejobexp_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatejobexp_company: {text:'Company', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candidatejobexp_position: {text:'Position', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Position harus diisi'}, },
                candidatejobexp_dtjoin: {text:'Date Join', type: dbtype.date, null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Date Join harus diisi'}, },
                candidatejobexp_dtleave: {text:'Date Leave', type: dbtype.date, null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Date Leave harus diisi'}, },
                candidatejobexp_jobdescr: {text:'Job Descr', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, multiline: true, invalidMessage: 'Job Descr harus diisi'}, },
                candidatejobexp_reasonleave: {text:'Reason Leave', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, multiline: true, invalidMessage: 'Reason Leave harus diisi'}, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
            },
            defaultsearch: ['candidatejobexp_company', 'candidatejobexp_position'],
            uniques: {},
        },

        'mst_candidateorg': {
            primarykeys: ['candaiteorg_id'],
            data: {
                candaiteorg_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candaiteorg_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candaiteorg_position: {text:'Position', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Position harus diisi'}, },
                candaiteorg_descr: {text:'Descr', type: dbtype.varchar(255), null: true, uppercase: false, suppresslist: false, options: {required: false, multiline: true}, },
                candaiteorg_city: {text:'City', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'City harus diisi'}, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
            },
            defaultsearch: ['candaiteorg_name'],
            uniques: {},
        },

        'mst_candidatereff': {
            primarykeys: ['candidatereff_id'],
            data: {
                candidatereff_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidatereff_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candidatereff_relation: {text:'Relation', type: dbtype.varchar(20), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Relation harus diisi'}, },
                candidatereff_handphone: {text:'Handphone', type: dbtype.varchar(14), null: true, uppercase: false, suppresslist: false, options: {required: false, }, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
            },
            defaultsearch: ['candidatereff_name'],
            uniques: {},
        },

        'mst_candidoc': {
            primarykeys: ['candidoc_id'],
            data: {
                candidoc_id: {text:'ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'ID harus diisi'}, },
                candidoc_name: {text:'Name', type: dbtype.varchar(255), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Name harus diisi'}, },
                candidoc_filename: {text:'File', type: dbtype.varchar(50), null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'File harus diisi'}, comp: comp.Filebox(), },
                candidoc_validity: {text:'Validity', type: dbtype.date, null: false, uppercase: false, suppresslist: false, options: {required: true, invalidMessage: 'Validity harus diisi'}, },
                candidoc_expired: {text:'Expired', type: dbtype.date, null: true, uppercase: false, suppresslist: false, options: {required: false}, },
                candidate_id: {text:'Candidate ID', type: dbtype.varchar(36), null: false, uppercase: false, suppresslist: true, options: {required: true, invalidMessage: 'Candidate ID harus diisi'}, },
            },
            defaultsearch: ['candidoc_name'],
            uniques: {},
        },
	},

	schema: {
		title: 'Candidate Employee',
		header: 'mst_candidate',
		detils: {
            'candidateedu' : {
                title: 'Education', table: 'mst_candidateedu', form: true, headerview: 'candidateedu_name',
                editorHandler: true,
                listHandler: true
            },
            'candaidatefam' : {
                title: 'Family', table: 'mst_candaidatefam', form: true, headerview: 'candaidatefam_name',
                editorHandler: true,
                listHandler: true
            },
            'candidatetrain' : {
                title: 'Training', table: 'mst_candidatetrain', form: true, headerview: 'candidatetrain_name',
                editorHandler: true,
                listHandler: true
            },
            'candidatejobexp' : {
                title: 'Job Experience', table: 'mst_candidatejobexp', form: true, headerview: 'candidatejobexp_company',
                editorHandler: true,
                listHandler: true
            },
            'candidateorg' : {
                title: 'Organization', table: 'mst_candidateorg', form: true, headerview: 'candaiteorg_name',
                editorHandler: true,
                listHandler: true
            },
            'candidatereff' : {
                title: 'Reference', table: 'mst_candidatereff', form: true, headerview: 'candidatereff_name',
                editorHandler: true,
                listHandler: true
            },
            'candidoc' : {
                title: 'Document', table: 'mst_candidoc', form: true, headerview: 'candidoc_name',
                editorHandler: true,
                listHandler: true
            },
		}
	}
}






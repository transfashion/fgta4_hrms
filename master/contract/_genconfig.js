"use strict";

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
    title: "Employee Contract",
    autoid: true,
    // committer: true,
    // approval: true,
    // printing: true,
    // doc_id: "EMPLCON",
    icon: "icon-hrjob-white.png",
    notes: `Master data karyawan kontrak`,

    persistent: {
        mst_hrcont: {
            primarykeys: ["hrcont_id"],
            comment: "Daftar Karyawan Kontrak",
            data: {
                hrcont_id: { text: "ID", type: dbtype.varchar(36), null: false, suppresslist: true },
                hrcont_filedoc: { text: "File Kontrak", type: dbtype.varchar(90), null: false, uppercase: true, suppresslist: true, options: { required: true, invalidMessage: "File Kontrak harus diisi" }, comp: comp.Filebox(),  },
                hrcont_nodoc: { text: "No. Kontrak", type: dbtype.varchar(255), null: false, uppercase: true, suppresslist: false, options: { required: true, invalidMessage: "No. Kontrak harus diisi" } },
            },
        },
    },

    schema: {
        title: "Karyawan Kontrak",
        header: "mst_hrcont",
        detils: {
            
        },
    },
};

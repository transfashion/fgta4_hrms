let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;

	obj.chk_empl_isdisabled.checkbox({ onChange: (checked) => { chk_empl_isdisabled_changed(checked) }});


}


export function form_dataopened(result, options) {
	chk_empl_isdisabled_changed();
}

function chk_empl_isdisabled_changed(checked) {
	if (checked===undefined) {
		checked = form.getValue(obj.chk_empl_isdisabled);
	}

	if (checked) {
		// wajib isi exit date
		form.setDisable(obj.dt_empl_dtexit, false)
		$('#pnl_edit-empl_dtexit').show();
	} else {
		// tidak perlu isi exit date
		form.setDisable(obj.dt_empl_dtexit, true)
		$('#pnl_edit-empl_dtexit').hide();
	}
}

	
	
let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;

}
	
export function form_datasaving(data, options) {
	if (data.hrcont_filedoc=='') {
		$ui.ShowMessage('[WARNING]File harus diisi');
		options.cancel = true;
	}
}	
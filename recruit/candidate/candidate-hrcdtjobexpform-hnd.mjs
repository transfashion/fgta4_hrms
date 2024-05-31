let editor, form, obj, opt;

const pnl_editor = $('#pnl_edithrcdtjobexpform-editor');

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;


	form.OnDataCanceled = () => {
		console.log('Edting di cancel');
	}

	// var editor = pnl_editor.texteditor('getEditor');
	// editor[0].addEventListener('input', function(ev) {
	// 	form.markDataChanged(true);
	// });
	
	// setTimeout(()=>{
	// 	$.parser.parse('#pnl_edithrcdtjobexpform-txt_hrcdtjobexp_jobdescr-editor');
	// }, 1000);
	
}


// export function form_dataopened(result, options) {
// 	console.log(result);

// 	form_viewmodechanged(true);
// 	pnl_editor.texteditor('setValue', result.record.txt_hrcdtjobexp_jobdescr);
// }


// export function form_newdata(data, options) {
// 	// form_viewmodechanged(false);
// 	// pnl_editor.texteditor('readonly', false);
// 	console.log('DATA BARU');
// 	pnl_editor.texteditor('setValue', '');

// }

// export function form_viewmodechanged(viewmode) {
// 	if (viewmode) {
// 		pnl_editor.texteditor('readonly', true); 
// 		pnl_editor.texteditor('getEditor').removeClass('input-modeedit-force');
// 	} else {
// 		pnl_editor.texteditor('readonly', false); 
// 		pnl_editor.texteditor('getEditor').addClass('input-modeedit-force');
// 	}
// }
	

// export function form_datasaving(data, options) {
// 	console.log('SAVING DATA');
// 	console.log(data);
// 	data.hrcdtjobexp_jobdescr = pnl_editor.texteditor('getValue');
// }
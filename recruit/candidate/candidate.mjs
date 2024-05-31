import {fgta4grid} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4grid.mjs'
import {fgta4form} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4form.mjs'
import * as fgta4pages from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pages.mjs'
import * as fgta4pageslider from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pageslider.mjs'
import * as settings from './candidate.settings.mjs'
import * as apis from './candidate.apis.mjs'
import * as pList from './candidate-list.mjs'
import * as pEdit from './candidate-edit.mjs'
import * as pEditHrcdtedugrid from './candidate-hrcdtedugrid.mjs'
import * as pEditHrcdteduform from './candidate-hrcdteduform.mjs'
import * as pEditHrcdtfamgrid from './candidate-hrcdtfamgrid.mjs'
import * as pEditHrcdtfamform from './candidate-hrcdtfamform.mjs'
import * as pEditHrcdttraingrid from './candidate-hrcdttraingrid.mjs'
import * as pEditHrcdttrainform from './candidate-hrcdttrainform.mjs'
import * as pEditHrcdtjobexpgrid from './candidate-hrcdtjobexpgrid.mjs'
import * as pEditHrcdtjobexpform from './candidate-hrcdtjobexpform.mjs'
import * as pEditHrcdtorggrid from './candidate-hrcdtorggrid.mjs'
import * as pEditHrcdtorgform from './candidate-hrcdtorgform.mjs'
import * as pEditHrcdtreffgrid from './candidate-hrcdtreffgrid.mjs'
import * as pEditHrcdtreffform from './candidate-hrcdtreffform.mjs'
import * as pEditHrcdtattchgrid from './candidate-hrcdtattchgrid.mjs'
import * as pEditHrcdtattchform from './candidate-hrcdtattchform.mjs'



const pnl_list = $('#pnl_list')
const pnl_edit = $('#pnl_edit')
const pnl_edithrcdtedugrid = $('#pnl_edithrcdtedugrid')
const pnl_edithrcdteduform = $('#pnl_edithrcdteduform')
const pnl_edithrcdtfamgrid = $('#pnl_edithrcdtfamgrid')
const pnl_edithrcdtfamform = $('#pnl_edithrcdtfamform')
const pnl_edithrcdttraingrid = $('#pnl_edithrcdttraingrid')
const pnl_edithrcdttrainform = $('#pnl_edithrcdttrainform')
const pnl_edithrcdtjobexpgrid = $('#pnl_edithrcdtjobexpgrid')
const pnl_edithrcdtjobexpform = $('#pnl_edithrcdtjobexpform')
const pnl_edithrcdtorggrid = $('#pnl_edithrcdtorggrid')
const pnl_edithrcdtorgform = $('#pnl_edithrcdtorgform')
const pnl_edithrcdtreffgrid = $('#pnl_edithrcdtreffgrid')
const pnl_edithrcdtreffform = $('#pnl_edithrcdtreffform')
const pnl_edithrcdtattchgrid = $('#pnl_edithrcdtattchgrid')
const pnl_edithrcdtattchform = $('#pnl_edithrcdtattchform')



var pages = fgta4pages;
var slider = fgta4pageslider;


export const SIZE = {width:0, height:0}


export async function init(opt) {
	// $ui.grd_list = new fgta4grid()
	// $ui.grd_edit = new fgta4grid()

	global.fgta4grid = fgta4grid
	global.fgta4form = fgta4form



	$ui.apis = apis
	document.getElementsByTagName("body")[0].style.margin = '5px 5px 5px 5px'

	opt.variancedata = global.setup.variancedata;
	settings.setup(opt);

	pages
		.setSlider(slider)
		.initPages([
			{panel: pnl_list, handler: pList},
			{panel: pnl_edit, handler: pEdit},
			{panel: pnl_edithrcdtedugrid, handler: pEditHrcdtedugrid},
			{panel: pnl_edithrcdteduform, handler: pEditHrcdteduform},
			{panel: pnl_edithrcdtfamgrid, handler: pEditHrcdtfamgrid},
			{panel: pnl_edithrcdtfamform, handler: pEditHrcdtfamform},
			{panel: pnl_edithrcdttraingrid, handler: pEditHrcdttraingrid},
			{panel: pnl_edithrcdttrainform, handler: pEditHrcdttrainform},
			{panel: pnl_edithrcdtjobexpgrid, handler: pEditHrcdtjobexpgrid},
			{panel: pnl_edithrcdtjobexpform, handler: pEditHrcdtjobexpform},
			{panel: pnl_edithrcdtorggrid, handler: pEditHrcdtorggrid},
			{panel: pnl_edithrcdtorgform, handler: pEditHrcdtorgform},
			{panel: pnl_edithrcdtreffgrid, handler: pEditHrcdtreffgrid},
			{panel: pnl_edithrcdtreffform, handler: pEditHrcdtreffform},
			{panel: pnl_edithrcdtattchgrid, handler: pEditHrcdtattchgrid},
			{panel: pnl_edithrcdtattchform, handler: pEditHrcdtattchform}			
		], opt)

	$ui.setPages(pages)


	document.addEventListener('OnButtonHome', (ev) => {
		if (ev.detail.cancel) {
			return
		}

		ev.detail.cancel = true;
		ExitModule();
	})
	
	document.addEventListener('OnSizeRecalculated', (ev) => {
		OnSizeRecalculated(ev.detail.width, ev.detail.height)
	})	



	await PreloadData()

}


export function OnSizeRecalculated(width, height) {
	SIZE.width = width
	SIZE.height = height
}

export async function ExitModule() {
	$ui.home();
}



async function PreloadData() {
	
}
import { LightningElement, api, track } from 'lwc';

export default class TvSerie extends LightningElement {
    @api tvSerie;
	
    @track tvSerieId;

    handleOpenRecordClick(event){
		this.tvSerieId = event.target.value;
	}

}
import { LightningElement, api, wire } from 'lwc';
import getEpisodes from '@salesforce/apex/EpisodeController.getEpisodes';
const columns = [
   {label:'Episode', fieldName: 'Number__c', type: 'number'},
   {label:'Description', fieldName: 'Description__c', type: 'text'}
 ]

export default class Episodes extends LightningElement {

     columns = columns;
    @api seasonId;
    @wire(getEpisodes,{seasonId:'$seasonId'}) episodes;

    get hasResults() {
		return (this.episodes.data.length > 0);
	}
    }
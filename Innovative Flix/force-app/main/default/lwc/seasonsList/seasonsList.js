import { LightningElement, api, wire, track } from 'lwc';
import getSeasons from '@salesforce/apex/SeasonController.getSeasons';

const columns = [
    {label:'Number', fieldName: 'Number__c', type: 'number'}
    
]

export default class SeasonsList extends LightningElement {
    
    columns = columns;
    @api tvSerieId;
    @track seasonId;
    @wire(getSeasons, {tvSerieId: '$tvSerieId'}) seasons;
    /*
    ({data, error}){
        if(data){
            console.log(data)
        }
        else if(error){
            console.error(error)
        };
    }
    */
    handleOpenRecordClick(event){
       
        this.seasonId = event.target.value;
    }
}
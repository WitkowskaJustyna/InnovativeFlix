import { LightningElement, track, wire } from 'lwc';
import getSerieSearch from '@salesforce/apex/TvSerieController.getSerieSearch';

export default class TvSeriesList extends LightningElement {
    @track searchTerm = '';
	@wire(getSerieSearch, {searchTerm: '$searchTerm'}) tvSeries;

	handleSearchTermChange(event) {
		window.clearTimeout(this.delayTimeout);
		const searchTerm = event.target.value;
		this.delayTimeout = setTimeout(() => {
			this.term = searchTerm;
		}, 300);
	}

	get seriesNotInDatabase() {
		return (this.tvSeries.data.length > 0);
	}
}
/**
     * @author name <justyna.witkowska@accenture.com>
     * @date 25/07/2022
     * @description Trigger to check duplicates in TV Serie Title.   
	 *@history {ticket reference}, {date}, name <name@accenture.com>, {purpose}??
     **/


trigger SerieTrigger on Tv_Serie__c (before insert, after insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        TvSerieTriggerHandler.chcekDuplicateTVSerieTitle(Trigger.New);

    }

}
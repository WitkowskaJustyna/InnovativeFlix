/**
     * @author name <justyna.witkowska@accenture.com>
     * @date 25/07/2022
     * @description Trigger to check duplicates in TV Serie Title.   
	 *@history {ticket reference}, {date}, name <name@accenture.com>, {purpose}??
     **/


trigger SerieTrigger on Tv_Serie__c (before insert, before update, after delete) {

    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        TvSerieTriggerHandler.chcekDuplicateTVSerieTitle(Trigger.New);

    }

    if(Trigger.isDelete){
        System.enqueueJob(new TvSerieDeleteQueueable(Trigger.Old));
    }

}
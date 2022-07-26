/**
     * @author name <justyna.witkowska@accenture.com>
     * @date 25/07/2022
     * @description Trigger to check duplicates in Season numbers.   
	 *@history {ticket reference}, {date}, name <name@accenture.com>, {purpose}??
     **/


    trigger SeasonTrigger on Season__c (before insert, before update) {

        if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
            TriggerSeasonHandler.checkDuplicateSeasonNumber(Trigger.New);
    
        }
    
    }
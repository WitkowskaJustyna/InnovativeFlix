trigger EpisodeTrigger on Episode__c (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert|| Trigger.isUpdate)){
        EpisodeTriggerHandler.checkDuplicateEpisodeNumber(Trigger.New);

    }

}
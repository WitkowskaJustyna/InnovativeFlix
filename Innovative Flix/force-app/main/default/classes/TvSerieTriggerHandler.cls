public with sharing class TvSerieTriggerHandler {
   public static void chcekDuplicateTVSerieTitle(List<Tv_Serie__c> newList) {

    List<Tv_Serie__c> oldList = [SELECT Id, Name__c FROM Tv_Serie__c];
        for(Tv_Serie__c newSerie : newList){
            for(Tv_Serie__c oldSerie : oldList) {
                if(newSerie.Name__c == oldSerie.Name__c)
                newSerie.addError('Tv Serie with this title already exists');
            }
        }



    }

}
public with sharing class SeasonTriggerHandler {
    public static void checkDuplicateSeasonNumber(List<Season__c> newListOfSeasons) {

        //Set of Series Ids, where new season is going to be added
        Set<Id> tvSerieIdsSet = new Set<Id>();

        for(Season__c season : newListOfSeasons) {
            tvSerieIdsSet.add(season.Tv_Serie__c);
        }

        //List of season from series, where new season is going to be added
        List<Season__c> oldListOfSeason = [SELECT Number__c, Tv_Serie__c FROM Season__c WHERE Tv_Serie__c IN :  tvSerieIdsSet];

        
        //For every serie collected in tvSerieIdsSet create a List of numbers and collect in Map ( tvSerieId, ListOfNumbers)

        Map<Id, List<Decimal>> seasonMap = new Map<Id, List<Decimal>>();

        if(!oldListOfSeason.isEmpty()){
            for(Id tvSerieId : tvSerieIdsSet) {
                List<Decimal> seasonNumbers = new List<Decimal>();
                for(Season__c season : oldListOfSeason) {
                    if(tvSerieId == season.Tv_Serie__c) {
                        seasonNumbers.add(season.Number__c);
                    }  
                }
                seasonMap.put(tvSerieId, seasonNumbers);    

            }
        }

        //Iterate on newListOfSeasons and check if in map is the same value of Number__c like in list of new seasons

        if(!seasonMap.isEmpty()){
            for(Season__c season : newListOfSeasons){
                if(seasonMap.get(season.Tv_Serie__c).contains(season.Number__c)) {
                    season.addError('Season with this number already exists');
                    continue;
                }
            }
        }
    }
}
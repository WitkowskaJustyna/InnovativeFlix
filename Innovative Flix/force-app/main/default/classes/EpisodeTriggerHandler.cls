public with sharing class EpisodeTriggerHandler {
    public static void checkDuplicateEpisodeNumber(List<Episode__c> newListOfEpisodes) {

        //Set of Seasons Ids, where new episodes is going to be added
        Set<Id> seasonIdsSet = new Set<Id>();

        for(Episode__c episode : newListOfEpisodes) {
            seasonIdsSet.add(episode.Season__c);
        }

        //List of episodes from seasons, where new episode is going to be added
        List<Episode__c> oldListOfEpisodes = [SELECT Number__c, Season__c FROM Episode__c WHERE Season__c IN :  seasonIdsSet];

        
        //For every season collected in seasonIdsSet create a List of numbers and collect in Map ( SeasonId, ListOfNumbers)

        Map<Id, List<Decimal>> episodeMap = new Map<Id, List<Decimal>>();

        if(!oldListOfEpisodes.isEmpty()){
            for(Id seasonId : seasonIdsSet) {
                List<Decimal> episodeNumbers = new List<Decimal>();
                for(Episode__c episode : oldListOfEpisodes) {
                    if(seasonId == episode.Season__c) {
                        episodeNumbers.add(episode.Number__c);
                    }  
                }
                episodeMap.put(seasonId, episodeNumbers);    

            }
        }

        //Iterate on newListOfSeasons and check if in map is the same value of Number__c like in list of new seasons

        if(!episodeMap.isEmpty()){
            for(Episode__c episode : newListOfEpisodes){
                if(episodeMap.get(episode.Season__c).contains(episode.Number__c)) {
                    episode.addError('Episode with this number already exists');
                    continue;
                }
            }
        }
    }
}
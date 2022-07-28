@isTest
private with sharing class EpisodeTriggerHandlerTest {
    @isTest static void checkDuplicateEpisodeNumberTest() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        insert season1;

        Episode__c episode1 = TestDataFactory.getEpisode(season1, 1);
        Episode__c episode2 = TestDataFactory.getEpisode(season1, 2);
        Episode__c episode3 = TestDataFactory.getEpisode(season1, 2);

        insert episode1;
        insert episode2;

        Test.startTest();
        Database.SaveResult result = Database.insert(episode3, false);
        Test.stopTest();    
    
        System.assertEquals('Episode with this number already exists',
                             result.getErrors()[0].getMessage());

    }

    @isTest static void checkDuplicateEpisodeNumberTest2() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        insert season1;

        Episode__c episode1 = TestDataFactory.getEpisode(season1, 1);
        Episode__c episode2 = TestDataFactory.getEpisode(season1, 2);
        Episode__c episode3 = TestDataFactory.getEpisode(season1, 3);

        insert episode1;
        insert episode2;
        insert episode3;

        episode3.Number__c = 2;

        Test.startTest();
        Database.SaveResult result = Database.update(episode3, false);
        Test.stopTest();    
    
        System.assertEquals('Episode with this number already exists',
                             result.getErrors()[0].getMessage());


    }

    @isTest static void checkDuplicateEpisodeNumberTest3() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        insert season1;

        Episode__c episode1 = TestDataFactory.getEpisode(season1, 1);
        Episode__c episode2 = TestDataFactory.getEpisode(season1, 2);
        Episode__c episode3 = TestDataFactory.getEpisode(season1, 3);
        Episode__c episode4 = TestDataFactory.getEpisode(season1, 4);

        insert episode1;
        insert episode2;
        insert episode3;
        insert episode4;

        episode3.Number__c = 2;
        episode4.Number__c = 3;
        Test.startTest();
        Database.SaveResult result1 = Database.update(episode3, false);
        Database.SaveResult result2 = Database.update(episode4, false);
        Test.stopTest();    
    
        System.assertEquals('Episode with this number already exists',
                             result1.getErrors()[0].getMessage());
        System.assertEquals('Episode with this number already exists',
                             result2.getErrors()[0].getMessage());


    }
    @isTest static void checkDuplicateEpisodeNumberTest4() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        insert season1;

        Episode__c episode1 = TestDataFactory.getEpisode(season1, 1);
        Episode__c episode2 = TestDataFactory.getEpisode(season1, 2);
        Episode__c episode3 = TestDataFactory.getEpisode(season1, 1);
        Episode__c episode4 = TestDataFactory.getEpisode(season1, 2);

        insert episode1;
        insert episode2;
        
        Test.startTest();
        Database.SaveResult result1 = Database.insert(episode3, false);
        Database.SaveResult result2 = Database.insert(episode4, false);
        Test.stopTest();    
    
        System.assertEquals('Episode with this number already exists',
                             result1.getErrors()[0].getMessage());
        System.assertEquals('Episode with this number already exists',
                             result2.getErrors()[0].getMessage());


    }
}

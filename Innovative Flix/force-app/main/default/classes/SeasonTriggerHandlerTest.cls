@isTest
private with sharing class SeasonTriggerHandlerTest {
    @isTest static void checkDuplicateSeasonNumberTest() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        Season__c season2 = TestDataFactory.getSeason(serie1, 2);
        Season__c season3 = TestDataFactory.getSeason(serie1, 2);
        insert season1;
        insert season2;

        Test.startTest();
        Database.SaveResult result = Database.insert(season3, false);
        Test.stopTest();    
    
        System.assertEquals('Season with this number already exists',
                             result.getErrors()[0].getMessage());

        
    }
    @isTest static void checkDuplicateSeasonNumberTest2() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        Season__c season2 = TestDataFactory.getSeason(serie1, 2);
        Season__c season3 = TestDataFactory.getSeason(serie1, 3);
        insert season1;
        insert season2;
        insert season3;

        season3.Number__c = 2;

        Test.startTest();
        Database.SaveResult result = Database.update(season3, false);
        Test.stopTest();    
    
        System.assertEquals('Season with this number already exists',
                             result.getErrors()[0].getMessage());

        
    }

    @isTest static void checkDuplicateSeasonNumberTest3() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        Season__c season2 = TestDataFactory.getSeason(serie1, 2);
        Season__c season3 = TestDataFactory.getSeason(serie1, 3);
        insert season1;
        insert season2;
        insert season3;

        season2.Number__c = 1;
        season3.Number__c = 2;

        Test.startTest();
        Database.SaveResult result1 = Database.update(season2, false);
        Database.SaveResult result2 = Database.update(season3, false);
        Test.stopTest();    
    
        System.assertEquals('Season with this number already exists',
                             result1.getErrors()[0].getMessage());

        System.assertEquals('Season with this number already exists',
                             result2.getErrors()[0].getMessage());
    }
    @isTest static void checkDuplicateSeasonNumberTest4() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        insert serie1;

        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        Season__c season2 = TestDataFactory.getSeason(serie1, 2);
        Season__c season3 = TestDataFactory.getSeason(serie1, 1);
        Season__c season4 = TestDataFactory.getSeason(serie1, 2);
        insert season1;
        insert season2;

        Test.startTest();
        Database.SaveResult result1 = Database.insert(season3, false);
        Database.SaveResult result2 = Database.insert(season4, false);
        Test.stopTest();    
    
        System.assertEquals('Season with this number already exists',
                             result1.getErrors()[0].getMessage());
        System.assertEquals('Season with this number already exists',
                             result2.getErrors()[0].getMessage());

        
    }
}
@isTest
private with sharing class TvSerieTriggerHandlerTest {
    @isTest static void chcekDuplicateTVSerieTitleTest() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        Tv_Serie__c serie2 = TestDataFactory.getSerie('Test2', 'family');
        Tv_Serie__c serie3 = TestDataFactory.getSerie('Test2', 'family');

        insert serie1; 
        insert serie2; 

        Test.startTest();
        Database.SaveResult result = Database.insert(serie3, false);
        Test.stopTest();    
    
        System.assertEquals('Tv Serie with this title already exists',
                             result.getErrors()[0].getMessage());


    }
    @isTest static void chcekDuplicateTVSerieTitleTest2() {


        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        Tv_Serie__c serie2 = TestDataFactory.getSerie('Test2', 'family');
        Tv_Serie__c serie3 = TestDataFactory.getSerie('Test3', 'family');

        insert serie1; 
        insert serie2; 
        insert serie3;

        serie3.Name__c = 'Test1';

        Test.startTest();
        Database.SaveResult result = Database.update(serie3, false);
        Test.stopTest();    
    
        System.assertEquals('Tv Serie with this title already exists',
                             result.getErrors()[0].getMessage());


    }

    @isTest static void chcekDuplicateTVSerieTitleTest3() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        Tv_Serie__c serie2 = TestDataFactory.getSerie('Test2', 'family');
        Tv_Serie__c serie3 = TestDataFactory.getSerie('Test1', 'family');
        Tv_Serie__c serie4 = TestDataFactory.getSerie('Test2', 'family');

        insert serie1; 
        insert serie2; 

        Test.startTest();
        Database.SaveResult result1 = Database.insert(serie3, false);
        Database.SaveResult result2 = Database.insert(serie4, false);
        Test.stopTest();    
    
        System.assertEquals('Tv Serie with this title already exists',
                             result1.getErrors()[0].getMessage());
        System.assertEquals('Tv Serie with this title already exists',
                             result2.getErrors()[0].getMessage());



    }

    @isTest static void chcekDuplicateTVSerieTitleTest4() {

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'horror');
        Tv_Serie__c serie2 = TestDataFactory.getSerie('Test2', 'family');
        Tv_Serie__c serie3 = TestDataFactory.getSerie('Test3', 'family');
        Tv_Serie__c serie4 = TestDataFactory.getSerie('Test4', 'family');

        insert serie1; 
        insert serie2; 
        insert serie3; 
        insert serie4;

        serie3.Name__c = 'Test1';
        serie4.Name__c = 'Test3';


        Test.startTest();
        Database.SaveResult result1 = Database.update(serie3, false);
        Database.SaveResult result2 = Database.update(serie4, false);
        Test.stopTest();    
    
        System.assertEquals('Tv Serie with this title already exists',
                             result1.getErrors()[0].getMessage());
        System.assertEquals('Tv Serie with this title already exists',
                             result2.getErrors()[0].getMessage());



    }


}
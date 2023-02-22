/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-21-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
@IsTest

public with sharing class AdoptionTriggerHandlerTest {
    
    @IsTest
    public static void testDoTheCheck() {
        
        List<Adoption__c> testExistingRecords = new List<Adoption__c> {
            new Adoption__c(Animal__c = 'a017S00000DUYjtQAH', Account__c = '0017S00000KiCRfQAN')

        };

        Map<Id, List<Adoption__c>> testExistingRecordsMap = new Map<Id, List<Adoption__c>> {
            '0017S00000KiCRfQAN' => new List<Adoption__c>{
                new Adoption__c(Animal__c = 'a017S00000DUYjtQAH', Account__c = '0017S00000KiCRfQAN')

            }
            
        };

        //create test data
        Test.startTest();
        AdoptionTriggerHandler.doTheCheck(testExistingRecords, testExistingRecordsMap);
        //call the tested method
        Test.stopTest();
        Assert.isTrue(testExistingRecordsMap.values()[0][0].hasErrors());
        //verify the results
    }
}
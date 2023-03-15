/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 03-02-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class AdoptionListController {
   
    @AuraEnabled
    public static List<Adoption__c> fetchAdoptions(Id accountId) {
        try{
            return [SELECT Id, Animal__r.Name, End_Date__c, Start_Date__c, Status__c FROM Adoption__c WHERE Account__c = :accountId];
        } catch(Exception e) {
            System.debug(LoggingLevel.ERROR, e.getMessage());
            throw e;
        }
        
     }
    
}
/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-20-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/

public with sharing class AdoptionTriggerHandler {

    public static void checkAdoptionDuplicate(List<Adoption__c> newAdoptions) {
        
        Set<Id> relevantAccountIds = new Set<Id>();
        Set<Id> relevantAnimalIds = new Set<Id>();
        Set<Id> adoptionsFromTriggerIds = new Set<Id>();
        Map<Id, List<Adoption__c>> newAdoptionsByAccountId = new Map<Id, List<Adoption__c>>();

        for(Adoption__c adop: newAdoptions) {

            relevantAccountIds.add(adop.Account__c);
            relevantAnimalIds.add(adop.Animal__c);
            adoptionsFromTriggerIds.add(adop.Id);

            if(!newAdoptionsByAccountId.containsKey(adop.Account__c)) {
                newAdoptionsByAccountId.put(adop.Account__c, new List<Adoption__c>());
            }

            newAdoptionsByAccountId.get(adop.Account__c).add(adop);
        }
    
    List<Adoption__c> existingAdoptions = [SELECT Account__c, Animal__c FROM Adoption__c 
                                           WHERE Status__c = 'Active' AND 
                                           (Account__c IN : relevantAccountIds OR Animal__c IN : relevantAnimalIds)
                                           AND Id NOT IN : adoptionsFromTriggerIds];

    for(Adoption__c existingAdoption: existingAdoptions) {
        List<Adoption__c> newAdoptionsWithSameAcc = newAdoptionsByAccountId.get(existingAdoption.Account__c);
        for(Adoption__c newAdoptionWithSameAcc : newAdoptionsWithSameAcc) {
            if(newAdoptionWithSameAcc.Animal__c.equals(existingAdoption.Animal__c)){
                newAdoptionWithSameAcc.addError('This record is a duplicate!');
            }
        }
    }
}

    
}

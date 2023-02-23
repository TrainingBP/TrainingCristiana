/**
 * @description       : Checks the last modified date from the Lead object
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/

//Each lead that hasn’t been updated in last year should be deleted. Check should be performed every night. 

public with sharing class DetermineUnchangedLeadsBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        Date lastYear = Date.today().addYears(-1);
        String query = 'SELECT Id FROM Lead WHERE LastModifiedDate < ' + lastYear.format() + ' LIMIT 200';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope) {
        delete scope;
    }

    public void finish(Database.BatchableContext bc) {
      
    }
}

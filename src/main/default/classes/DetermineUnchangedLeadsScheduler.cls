/**
 * @description       : Schedule the Batch every night
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class DetermineUnchangedLeadsScheduler implements Schedulable{
     public void execute(SchedulableContext SC) {
         Database.executeBatch(new DetermineUnchangedLeadsBatch(), 200);
        }
    }


//In developer console, in Anonymous Windows:

//DetermineUnchangedLeadsScheduler schedulerJob = new DetermineUnchangedLeadsScheduler();
//String sch ='0 0 0 * * ?';
//String jobID = System.schedule('Homework 3', sch, schedulerJob);
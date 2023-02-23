/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/

//The HW requirment:
//1.	We would like to make sure that every time a Lead is created, its description is updated according to the 
//source type. The text within the Description field will be populated according to the following pattern: 
//This Lead has been created via the “SourceType” channel.

trigger LeadTrigger on Lead (before insert) {
    LeadTriggerHandler.updateLeadDecription(Trigger.new);
}
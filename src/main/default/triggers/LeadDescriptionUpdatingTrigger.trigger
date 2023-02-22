/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-22-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/

//The HW requirment:
//1.	We would like to make sure that every time a Lead is created, its description is updated according to the 
//source type. The text within the Description field will be populated according to the following pattern: 
//This Lead has been created via the “SourceType” channel.


trigger LeadDescriptionUpdatingTrigger on Lead (before insert) {
   
    for (Lead lead : Trigger.new) {
        if (lead.Description == null) {
            String sourceType = lead.LeadSource;
            if (sourceType != null) {
                lead.Description = 'This Lead has been created via the "' + sourceType + '" channel.';
            }
        }
    }
    
    
}
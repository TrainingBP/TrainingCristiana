/**
 * @description       : Trigger handler for LeadTrigger
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class LeadTriggerHandler {
    
/** 
 * @description Determines if the LeadSource is not blank to update the description of the Lead with it.  
 * @param leads list of Leads from Org, before insert 
 * @author Andreea Lapadat, BearingPoint * @date 2022-12-14 
**/

  public static void updateLeadDecription(List<Lead> leads) {
     for (Lead lead : leads) {
        if (String.isNotBlank(lead.LeadSource) ) {
              lead.Description = 'This Lead has been created via the "' + lead.LeadSource + '" channel.';
        }
    }
  }
}
      

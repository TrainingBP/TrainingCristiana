/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class LeadDescriptionUpdatingTriggerHandler {
    
  public static void handle(List<Lead> leads) {
     for (Lead lead : leads) {
        String sourceType = lead.LeadSource;
        if (sourceType != null) {
              lead.Description = 'This Lead has been created via the "' + sourceType + '" channel.';
            }
          }
        }
}
      

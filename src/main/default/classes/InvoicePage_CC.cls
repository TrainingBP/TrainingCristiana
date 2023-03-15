/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-28-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class InvoicePage_CC {
    public Opportunity newOpportunity{ get; set;}

    public InvoicePage_CC() {
        String recordId = ApexPages.currentPage().getParameters().get('p');

        this.newOpportunity = [SELECT Id, Account.Name, Amount, (SELECT Id, Product2.Name, Quantity, UnitPrice FROM OpportunityLineItems )
                               FROM Opportunity
                               WHERE Id = :recordId
                               LIMIT 1][0];
    }

    public Decimal getTotalAmount(){
        for(OpportunityLineItem lineItem : newOpportunity.OpportunityLineItems) {
            totalAmount += lineItem.Quantity * lineItem.UnitPrice;
        }
        return totalAmount;
    }
    
}
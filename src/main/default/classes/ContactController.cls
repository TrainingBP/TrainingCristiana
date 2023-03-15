/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 03-06-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
    //     return [
    //         SELECT FirstName, LastName, Email
    //         FROM Contact
    //    ];

       throw new AuraHandledException('Forced error');
    }
}
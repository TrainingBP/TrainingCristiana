/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
public with sharing class GenerateCardsQueueable implements Queueable, Database.AllowsCallouts {
    private String qrCodeData;
    public GenerateCardsQueueable (String qrCodeData) {
        this.qrCodeData = qrCodeData;
    }

    public void execute(QueueableContext context) {
        System.debug('TTTTT GenerateCardsQueueable call');
        // TODO to the external server
    }
}
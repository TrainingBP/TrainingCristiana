/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : Cristiana Jipa, BearingPoint GmbH
**/
trigger AccountTrigger on Account (after insert) {

    switch on Trigger.operationType{
        when AFTER_INSERT{
            AccountTriggerHandler.generateCards(Trigger.new);
        }
    }
}
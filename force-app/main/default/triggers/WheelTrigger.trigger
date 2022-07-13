trigger WheelTrigger on Wheel__c (before insert, before update) {
    WheelTriggerHandler.TriggerHandler(Trigger.New);
}
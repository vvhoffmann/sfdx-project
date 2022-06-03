trigger SameWheelValidation on Wheel__c (before insert, before update) {
    for(Wheel__c wheel:Trigger.New){
        for(Wheel__c cw:[SELECT Name, Position_Front_Back__c, Position_Right_Left__c 
                                FROM Wheel__c 
                                WHERE Auteczko__c= :wheel.Auteczko__c])
        {
            if(cw.Position_Front_Back__c==wheel.Position_Front_Back__c 
               && cw.Position_Right_Left__c==wheel.Position_Right_Left__c){
               cw.Auteczko__c.addError('To auteczko ma już przypisaną oponę na tym miejscu!');
            }
        }
    }
}
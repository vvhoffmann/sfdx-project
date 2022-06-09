public class WheelTriggerHandler {
    public static void TriggerHandler(Wheel__c [] triggerNew){
        List<Id> auts=new List<Id>();
        for (Wheel__c w : triggerNew) {
            auts.add(w.AuteczkoID__c);
        }
        
        List<Wheel__c> allWheels = new List<Wheel__c>(
            [SELECT Name, AuteczkoID__c, Position_Front_Back__c, Position_Right_Left__c
             FROM Wheel__c
             WHERE AuteczkoID__c IN :auts]);
        
        Map<Id,List<Wheel__c>> aWheels=new Map<Id,List<Wheel__c>>();
        for (Wheel__c wheel : allWheels) {
            if (aWheels.containsKey(wheel.AuteczkoId__c)) {
                aWheels.get(wheel.AuteczkoId__c).add(wheel);
            }
            else{
                List<Wheel__c> w=new List<Wheel__c>();
                w.add(wheel);
                aWheels.put(wheel.AuteczkoId__c,w);
            }
        }
            
        for (Wheel__c wheel : triggerNew) {
            List<Wheel__c> currentWheels=aWheels.get(wheel.AuteczkoID__c);
            if (currentWheels != null) {
                for (Wheel__c cw : currentWheels) {
                    if (cw.Position_Front_Back__c == wheel.Position_Front_Back__c && cw.Position_Right_Left__c == wheel.Position_Right_Left__c) {
                        wheel.AuteczkoID__c.addError('To auteczko ma już przypisaną oponę na tym miejscu!');
                    }
                }
            }
        }
    }
}
global class AuteczkoBatch implements Database.Batchable<Auteczko__c> {
    private Integer recordsProcessed = 0;
    
    global Iterable<Auteczko__c> start(Database.BatchableContext BC) {
        return new AuteczkoIterable(20);    
    }
    
    global void execute(Database.BatchableContext BC, List<Auteczko__c> scope) {
        List<Wheel__c> wheelList = new List<Wheel__c>();
        try {
            insert scope;
        } 
        catch(Exception e) {
            System.debug(e);
        }
        for(Auteczko__c anew:scope){
            Wheel__c wheel1=new Wheel__c(AuteczkoID__c=anew.Name,Position_Front_Back__c=true);
            Wheel__c wheel2=new Wheel__c(AuteczkoID__c=anew.Name);
            Wheel__c wheel3=new Wheel__c(AuteczkoID__c=anew.Name,Position_Right_Left__c=true, Position_Front_Back__c=true);
            Wheel__c wheel4=new Wheel__c(AuteczkoID__c=anew.Name,Position_Right_Left__c=true);
            wheelList.add(wheel1);
            wheelList.add(wheel2);
            wheelList.add(wheel3);
            wheelList.add(wheel4);
        }
        try{
            insert wheelList;
        }
        catch(Exception e) {
            System.debug(e);
        }
    }        

    public void finish(Database.BatchableContext bc){
		// execute any post-processing operations
    }
}
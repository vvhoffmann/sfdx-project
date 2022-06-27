global class AuteczkoBatch implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute         
        String query = 'SELECT Name FROM Auteczko_Model__c limit 10'  ;         
        return Database.getQueryLocator(query);       
    }
    
    global void execute(Database.BatchableContext BC, List<Auteczko_Model__c> scope) {
        List<Auteczko__c> autList = new List<Auteczko__c>();
        // process each batch of records
        for(Auteczko_Model__c model:scope){
              for (integer i=0;i<25;i++)
              {
                    Auteczko__c anew= new Auteczko__c(Auteczko_Model__c=model.Name);
                    autList.add(anew);
              }
        }
        try {
            insert autList;
        } 
        catch(Exception e) {
            System.debug(e);
        }
         
    }        

    public void finish(Database.BatchableContext bc){
		// execute any post-processing operations
    }
}
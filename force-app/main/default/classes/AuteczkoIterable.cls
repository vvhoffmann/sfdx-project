global class AuteczkoIterable implements Iterable<Auteczko__c> {    
    private Integer count;
    
    public AuteczkoIterable(Integer count){
        this.count=count;
    }
    
    public Iterator<Auteczko__c> iterator(){
      List<Auteczko__c> auts =[SELECT Auteczko_Model__c FROM Auteczko__c limit :count];
      return new AuteczkoGenerator(auts);
   }
}

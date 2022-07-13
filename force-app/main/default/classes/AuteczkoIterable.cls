global class AuteczkoIterable implements Iterable<Auteczko__c> {    
    private Integer count;
    
    public AuteczkoIterable( Integer count) {
        this.count = count;
    }
    
    public Iterator<Auteczko__c> iterator(){
        List<Auteczko__c> auts = [SELECT Auteczko_Model__c FROM Auteczko__c limit :count];
        List<Auteczko__c> newauts = new List<Auteczko__c>();
        for(Auteczko__c auto : auts){
            Auteczko__c anew = new Auteczko__c(Auteczko_Model__c=auto.Auteczko_Model__c);
            newauts.add(anew);
      }
      return new AuteczkoGenerator(newauts);
   }
}
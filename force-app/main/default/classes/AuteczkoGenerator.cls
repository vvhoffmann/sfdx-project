global class AuteczkoGenerator implements Iterator<Auteczko__c> {
	private Integer counter;
    private List<Auteczko__c> auts;
    
	global AuteczkoGenerator(List<Auteczko__c> autslist) {
  		counter = 0;
        auts = autslist;
	}
    global boolean hasNext() {
    	return counter < auts.size()-1;
	}
	global Auteczko__c next() {
        if (hasNext()){
            counter++;
    		return auts[counter];
        }
        else {
            throw new NoSuchElementException();
        }
  		
	}
}
public class LeadProcessor Implements database.Batchable<sObject>{

    public database.QueryLocator start(database.BatchableContext bc){
        
        return database.getQueryLocator('List<SObject> query');
    }
    
    public void execute(database.BatchableContext bc, List<Lead> lead){
        
    }
    
    public void finish(database.BatchableContext bc){
        
    }
}
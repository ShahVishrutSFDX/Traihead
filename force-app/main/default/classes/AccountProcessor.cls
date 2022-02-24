public class AccountProcessor {
    
    
    @future
    public static void countContacts(List<ID> accIDS){
        
        List<Account> accts = new List<Account>();
        Map<Id,List<Contact>> accContact = new Map<Id,List<Contact>>();
        
        if(accIDS != Null){
            
            for(Account acc : [Select id,(Select id from Contacts) from Account where ID IN :accIDS]){
                
                accContact.put(acc.Id,acc.Contacts);
            }
            
            for(ID accKey : accContact.keyset())
            {
                Account acc = new Account(ID = accKey);
                acc.Number_Of_Contacts__c = accContact.get(accKey).size();
                accts.add(acc);
            }
            
            update accts;
        }
    }
    
    
 }
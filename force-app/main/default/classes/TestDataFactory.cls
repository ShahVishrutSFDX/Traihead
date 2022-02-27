public class TestDataFactory {
    
    public static List<Contact> createContacts(Integer numContacts, ID accID, String lastName){
       List<Contact> contacts = new List<Contact>();
       
        for(Integer i=0; i<numContacts; i++){
            
            Contact cnt = new Contact (
                AccountId = accID,
                lastName = lastName
                );
            contacts.add(cnt);
        }
        return contacts;
    } 
    public static List<Account> createAccounts(Integer numAccounts){
        List<Account> accounts = new List<Account>();
        
        for(Integer i = 0; i<numAccounts; i++){
            account acc = new account(name = 'test' + i);
            accounts.add(acc);
        }
        return accounts;
    }
}
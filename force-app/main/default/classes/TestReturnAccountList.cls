@isTest
private class TestReturnAccountList {
    
    @testSetup
    
    static void setupAccount(){
        	List<Account> accts = TestDataFactory.createAccounts(5); 
        	insert accts;
     List<contact> cnt= new List<contact>();	  
        for(Account acc: accts){
             cnt = TestDataFactory.createContacts(5, acc.Id, 'contact for ' + acc.Id);
            }
        insert cnt;
    }

    @isTest
    static void testReturnAccount() {

        List<Contact> contacts = [Select id,AccountId from Contact with Security_Enforced];
        
        Test.startTest();
        List<ID> acc = ReturnAccountList.returnAccountIDList(contacts);
        test.stopTest();

        System.assertEquals(6, acc.size(), 'Account list retrieval failed');

    }
}

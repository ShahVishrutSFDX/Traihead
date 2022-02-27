@isTest
public class AccountProcessorTest {
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
    static void accountProcessorTest(){
        List<ID> acctsID = new List<ID>();
        
        for(Account acc : [Select id from Account]){
            acctsID.add(acc.Id);
        }
        
        Test.startTest();
        AccountProcessor.countContacts(acctsID);
        Test.stopTest();
    }
}
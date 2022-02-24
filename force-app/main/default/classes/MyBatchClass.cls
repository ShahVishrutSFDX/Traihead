public class MyBatchClass implements Database.Batchable<sObject>, Database.Stateful {
        public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        
        return Database.getQueryLocator('SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            							'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            							'MailingState, MailingPostalCode FROM Contacts) FROM Account ' +
            							'Where BillingCountry = \'USA\''
                                        );
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
		List<Contact> contacts = new List<Contact>();
        
        for(Account acc : scope){
            for(contact contact	: acc.contacts){
                contact.MailingStreet = acc.BillingStreet;
                contact.MailingCity = acc.BillingCity;
                contact.MailingState = acc.BillingState;
                contact.MailingPostalCode = acc.BillingPostalCode;
                contacts.add(contact);
                recordsProcessed += 1;
            }
        }
        
        update contacts;
        	
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');
        //EmailUtils.sendMessage(job,recordsprocessed);
    }
}
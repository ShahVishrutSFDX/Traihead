public with sharing class IterateThroughMapExample {


    public static void iterateAccountsMap(){

        Map<Id,Account> accMap = new Map<Id,Account>();

        List<Account> accList = TestDataFactory.createAccounts(5);
        insert accList;

        accMap.putAll(accList);

        for(ID acc : accMap.keySet()){
            system.debug('On Account ---> '+ accMap.get(acc));
        }
        
    }

}


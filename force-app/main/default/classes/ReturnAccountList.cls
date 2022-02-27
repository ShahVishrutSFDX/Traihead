// return accountIDlist for list of contacts passed through calling class

public with sharing class ReturnAccountList {

public static List<Id> returnAccountIDList(List<Contact> contacts) {
List<Id> acctList = new List<Id>();
Map<ID,ID> accMap = new Map<ID,ID>();

for(Contact cnt : [Select Id, AccountId from Contact Where Id IN :contacts with security_enforced]){

    accMap.put(cnt.id, cnt.AccountId);
}
if(!contacts.isEmpty() && contacts.size() > 0){

for(ID c: accMap.keySet()){

        acctList.add(accMap.get(c));
}

}
else{
return acctList;
}
return acctList;
}
}
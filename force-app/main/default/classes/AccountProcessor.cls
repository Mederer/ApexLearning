public class AccountProcessor {

    @future
    public static void countContacts(List<Id> accountIds) {
        List<Contact> contacts = new List<Contact>([
            SELECT Id, AccountId
            FROM Contact
            WHERE AccountId IN :accountIds
        ]);
        
        Map<Id, Account> accounts = new Map<Id, Account>([
            SELECT Id, Number_Of_Contacts__c 
            FROM Account
            WHERE Id IN :accountIds
        ]);
        
        for (Id accountId: accountIds) {
            if (accounts.containsKey(accountId)) {
                accounts.get(accountId).Number_Of_Contacts__c = 0;
            }
        }
        
        for (Contact c: contacts) {
            accounts.get(c.AccountId).Number_Of_Contacts__c++;
            System.debug('Num contacts: ' + accounts.get(c.AccountId).Number_Of_Contacts__c);
        }
        
        update accounts.values();
    }
}
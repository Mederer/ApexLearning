@IsTest
private class AccountProcessorTest {

    @IsTest
    private static void countContactsTest() {
        List<Account> testAccounts = new List<Account>();
        List<Id> testAccountIds = new List<Id>();
        List<Contact> testContacts = new List<Contact>();
        
        for (integer i = 0; i < 200; i++) {
            Account acct = new Account(Name='Test Acct ' + (i + 1));
            testAccounts.add(acct);
        }
        
        insert testAccounts;
        
        for (Account acct: testAccounts) {
            Contact c = new Contact(FirstName=acct.Name,LastName='Test Contact',AccountId=acct.Id);
            testAccountIds.add(acct.Id);
            testContacts.add(c);
        }
        
        insert testContacts;
        
        Test.startTest();
        AccountProcessor.countContacts(testAccountIds);
        Test.stopTest();
        
        testAccounts = [
            SELECT Id, Number_Of_Contacts__c
            FROM Account
            WHERE Id IN :testAccountIds
        ];
        
        for (Account testAcct: testAccounts) {
            System.assertEquals(1, testAcct.Number_Of_Contacts__c);
        }
    }
}
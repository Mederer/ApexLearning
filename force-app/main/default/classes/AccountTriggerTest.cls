@isTest
public class AccountTriggerTest {
    @isTest static void TestAccountTrigger() {
        List<Account> accounts = new List<account>();
        for (integer i = 0; i < 200; i++) {
            Account acc = new Account(
                Name = 'Test Account ' + i,
                BillingState = 'CA'
            );
            accounts.add(acc);
        }
        Test.startTest();
        insert accounts;
        Test.stopTest();
        
        List<Account> verifyAccts = [SELECT Id, BillingState, ShippingState FROM Account];
        for (Account acct: verifyAccts) {
            System.assertEquals(acct.BillingState, acct.ShippingState);
        }
    }
}
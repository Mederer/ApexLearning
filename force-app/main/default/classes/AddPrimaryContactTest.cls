/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AddPrimaryContactTest {

    @TestSetup
    static void makeData(){
        List<Account> accts = new List<Account>(); 

        for (Integer i = 0; i < 50; i++) {
            Account acct = new Account(Name='Test Acct ' + (i + 1), BillingState='NY');
            accts.add(acct);
        }

        for (Integer i = 0; i < 50; i++) {
            Account acct = new Account(Name='Test Acct ' + (i + 51), BillingState='CA');
            accts.add(acct);
        }

        insert accts;
    }

    @isTest
    static void myUnitTest() {
        AddPrimaryContact apc = new  AddPrimaryContact(new Contact(FirstName='The', LastName='Inspector'), 'CA');

        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();

        List<Account> accts = [
            SELECT BillingState, (SELECT FirstName, LastName FROM Contacts)
            FROM Account
            WHERE BillingState = 'CA'
        ];

        for (Account acct: accts) {
            System.assertEquals(acct.Contacts[0].FirstName, 'The');
            System.assertEquals(acct.Contacts[0].LastName, 'Inspector');
        }
        
        System.assertEquals(50, accts.size());
    }
}
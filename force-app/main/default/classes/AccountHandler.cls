public with sharing class AccountHandler {
    public static Account insertNewAccount(String name) {
        Account acct = new Account(Name=name);
        try {
            insert acct;
            System.debug('Account created with ID = ' + acct.Id);
            return acct;    
        } catch (DmlException e) {
            System.debug('DML exception: ' + e.getMessage());
            return null;
        }
        
    }
}
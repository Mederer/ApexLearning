public with sharing class AddPrimaryContact implements Queueable {
    private string billingState;
    private Contact contact;

    public AddPrimaryContact(Contact contact, string billingState) {
        this.contact = contact;
        this.billingState = billingState;
    }

    public void execute(QueueableContext context) {
        List<Contact> newContacts = new List<Contact>();
        List<Account> accts = [
            SELECT BillingState
            FROM Account
            WHERE BillingState = :this.billingState
        ];

        for (Account acct: accts) {
            Contact newContact = this.contact.clone();
            newContact.AccountId = acct.Id;
            newContacts.add(newContact);
        }

        insert newContacts;
    }
}
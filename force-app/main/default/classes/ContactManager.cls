public class ContactManager {
    public static Boolean addDefaultContactToAccount(List<Account> accts) {
        List<Contact> newDefaultContacts = new List<Contact>();
        for (Account acct : accts) {
            Contact newDefaultContact = new Contact(FirstName = 'Default', LastName = 'Contact', Account = acct);
            newDefaultContacts.add(newDefaultContact);
        }
        try {
			insert newDefaultContacts;
            System.debug('New default contacts inserted');
            return true;
        } catch (DMLException e) {
            System.debug(e.getMessage());
            return false;
        }
    }
}
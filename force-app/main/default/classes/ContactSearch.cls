public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postCode) {
        Contact[] contacts = [SELECT LastName
                              FROM Contact 
                              WHERE LastName = :lastName AND MailingPostalCode = :postCode];
        return contacts;
    }
}
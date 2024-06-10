public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchTerm) {
        List<List<sObject>> results = [FIND :searchTerm IN NAME FIELDS
                                      RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return results;
    }
}
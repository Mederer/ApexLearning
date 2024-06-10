public class AccountUtils {
    public static List<Account> accountsByState(String billingState) {
        List<Account> accountsByBillingState = [Select Id, Name From Account Where BillingState = :billingState];
        for (Account acc: accountsByBillingState) {
            System.debug(acc.Name);
        }
    	return accountsByBillingState;
    }
}
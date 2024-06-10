trigger AccountTrigger on Account (before insert) {
    if (Trigger.isInsert || Trigger.isBefore) {
        AccountTriggerHandler.createAccounts(Trigger.New);
    }
}
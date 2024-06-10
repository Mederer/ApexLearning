trigger AddDefaultContact on Account (before insert) {
    if (Trigger.isInsert) {
        ContactManager.addDefaultContactToAccount(Trigger.new);
    }
}
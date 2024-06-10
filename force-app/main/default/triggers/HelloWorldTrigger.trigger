trigger HelloWorldTrigger on Account (before insert) {
    for (Account a : Trigger.new) {
        System.debug('Account created with name= ' + a.Name);
    }
}
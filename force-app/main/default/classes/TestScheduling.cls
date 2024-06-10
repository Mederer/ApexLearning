public with sharing class TestScheduling implements Schedulable {
    public void execute(SchedulableContext sc) {
        System.debug('TestScheduling executed');
    }
}
trigger DepartmentTrigger on Department__c(before insert, after insert) {
  DepartmentTriggerHandler handler = new DepartmentTriggerHandler();

  switch on Trigger.operationType {
    when AFTER_INSERT {
      handler.addDefaultCourse(Trigger.new);
    }
  }
}

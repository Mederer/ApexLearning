public with sharing class DepartmentTriggerHandler {
  public Boolean addDefaultCourse(List<Department__c> departments) {
    List<Course__c> defaultCourses = new List<Course__c>();

    for (Department__c department : departments) {
      Course__c defaultCourse = new Course__c(
        Course_Name__c = 'Default Course for ' + department.Name,
        Department__c = department.Id
      );
      defaultCourses.add(defaultCourse);
    }

    try {
      insert defaultCourses;
      return true;
    } catch (DmlException e) {
      System.debug(LoggingLevel.ERROR, e.getMessage());
      return false;
    }
  }
}

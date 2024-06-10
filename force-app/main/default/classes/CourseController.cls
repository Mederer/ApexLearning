public with sharing class CourseController {
    public CourseController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Course__c> getCourses() {
        return [SELECT Id, Course_Name__c, Name FROM Course__c];
    }
}
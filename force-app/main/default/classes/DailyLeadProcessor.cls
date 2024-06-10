public without sharing class DailyLeadProcessor implements Schedulable {
  public void execute(SchedulableContext sc) {
    if (Schema.sObjectType.Lead.isAccessible()) {
      List<Lead> updatedLeads = new List<Lead>();
      List<Lead> leads = [
        SELECT LeadSource
        FROM Lead
        WHERE LeadSource = ''
      ];

      for (Lead l : leads) {
        l.LeadSource = 'Dreamforce';
        updatedLeads.add(l);
      }

      if (!updatedLeads.isEmpty() && Schema.sObjectType.Lead.isUpdateable()) {
        update updatedLeads;
      }
    }
  }
}

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Opportunity> toProcess = null;
	List<Task> newTasks = new List<Task>();
    
    switch on Trigger.operationType {
        when AFTER_INSERT {
            toProcess = [
                SELECT Id
                FROM Opportunity
                WHERE StageName = 'Closed Won'
                AND Id IN :Trigger.new
            ];
        }
        when AFTER_UPDATE {
            toProcess = [
                SELECT Id
                FROM Opportunity
                WHERE StageName = 'Closed Won'
                AND Id IN :Trigger.new
            ];
        }
    }
    
    for (Opportunity opp: toProcess) {
        newTasks.add(new Task(Subject='Follow Up Test Task', WhatId=opp.Id));
    }
    
    if (newTasks.size() > 0) {
        insert newTasks;
    }
}
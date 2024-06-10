trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    List<Account> toProcess = null;
    
    switch on Trigger.operationType {
        when AFTER_INSERT {
            toProcess = Trigger.new;
        }
        when AFTER_UPDATE {
            toProcess = [
                SELECT Id, Name 
                FROM Account
                WHERE Id IN :Trigger.new
                AND Id NOT IN (SELECT AccountId FROM Opportunity WHERE AccountId IN :Trigger.new)
            ];
        }
    }
        
    for (Account a : toProcess) {
        oppList.add(new Opportunity(
            Name=a.Name + ' Opportunity',
                    StageName='Prospecting',
                    CloseDate=System.today().addMonths(1),
                    AccountId=a.Id
                   ));
     }	
    
    if (oppList.size() > 0) {
        insert oppList;
    }
}
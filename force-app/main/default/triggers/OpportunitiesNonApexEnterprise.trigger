trigger OpportunitiesNonApexEnterprise on Opportunity (after delete, after insert, after update, before delete, before insert, before update)
{

    if(Trigger.isAfter && Trigger.isInsert)
    {
        Map<Id, Decimal> accountIdTotalMap = new Map<Id, Decimal>();
        for(Opportunity opp : Trigger.new)
        {
            if(accountIdTotalMap.containsKey(opp.AccountId))
            {
                accountIdTotalMap.put(opp.AccountId, accountIdTotalMap.get(opp.AccountId) + opp.Amount);
            }
            else
            {
                accountIdTotalMap.put(opp.AccountId, opp.Amount);
            }
        }

        List<Account> accountsToUpdate = new List<Account>();
        for(Account acc : [SELECT Id, Opportunity_Total__c FROM Account WHERE Id IN :accountIdTotalMap.keySet()])
        {
            if(acc.Opportunity_Total__c == null)
                acc.Opportunity_Total__c = 0.0;
                
            acc.Opportunity_Total__c += accountIdTotalMap.get(acc.Id);
            accountsToUpdate.add(acc);
        }

        update accountsToUpdate;
    }
    else if((Trigger.isAfter && Trigger.isUpdate))
    {
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : Trigger.new)
        {
            accountIds.add(opp.AccountId);
        }

        List<Account> accountsToUpdate = new List<Account>();
        for(Account acc : [SELECT Id, Opportunity_Total__c, (SELECT Id, Amount FROM Opportunities) FROM Account WHERE Id IN :accountIds])
        {
            Decimal total = 0.0;
            for(Opportunity opp : acc.Opportunities)
            {
                total += opp.Amount;
            }
            acc.Opportunity_Total__c = total;
            accountsToUpdate.add(acc);
        }

        update accountsToUpdate;
    }
    else if(Trigger.isAfter && Trigger.isDelete)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : Trigger.old)
        {
            accountIds.add(opp.AccountId);
        }

        List<Account> accountsToUpdate = new List<Account>();
        for(Account acc : [SELECT Id, Opportunity_Total__c, (SELECT Id, Amount FROM Opportunities) FROM Account WHERE Id IN :accountIds])
        {
            Decimal total = 0.0;
            for(Opportunity opp : acc.Opportunities)
            {
                total += opp.Amount;
            }
            acc.Opportunity_Total__c = total;
            accountsToUpdate.add(acc);
        }

        update accountsToUpdate;
    }
}
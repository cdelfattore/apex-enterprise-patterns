trigger ContactsUsingAggregate on Contact (after insert, after update, after delete, after undelete)
{
    Set<Id> accountIds = new Set<Id>();
    if (Trigger.isAfter)
    {
        List<Contact> contacts;

        switch on Trigger.operationType {
            when  AFTER_DELETE {
                contacts = trigger.old;
            }
            when else {
                contacts = trigger.new;
            }
        }

        for (Contact con : contacts)
        {
            accountIds.add(con.AccountId);
        }

        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult ar : [SELECT AccountId AccId, Count(Id) ContactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId])
        {
            // System.debug(ar);
            accountsToUpdate.add(
                new Account(
                    Id = (Id) ar.get('AccId'),
                    Count__c = (Integer) ar.get('ContactCount')
                )
            );
        }
        System.debug(Limits.getQueryRows() + ' of ' + Limits.getLimitQueryRows());
        System.debug(Limits.getQueries() + ' of ' + Limits.getLimitQueries());
        // System.debug(Limits.getDmlRows());
        // System.debug('update accounts');
        System.debug(accountsToUpdate.size());
        update accountsToUpdate;
        
    }
}
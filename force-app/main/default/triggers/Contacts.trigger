/**
 * @description Got this interview question recently, did not get the job because I didn't know enough Apex.
 *              This was almost exactly the same as another interview question I had at another company.
 *              Revisiting this now to understand the entire context of a trigger.
 * @param insert 
 * @return  `trigger`
 */
trigger Contacts on Contact (after insert, after update, after delete, after undelete)
{
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete))
    {
        Map<Id, Integer> accountIdContactCount = new Map<Id, Integer>();
        for (Contact con : Trigger.new)
        {
            if (!accountIdContactCount.containsKey(con.AccountId))
            {
                accountIdContactCount.put(con.AccountId, 1);
            }
            else
            {
                accountIdContactCount.put(con.AccountId, accountIdContactCount.get(con.AccountId) + 1);
            }
        }

        List<Account> accountsToUpdate = new List<Account>();
        for (Account acc : [SELECT Id, Count__c FROM Account WHERE Id IN :accountIdContactCount.keySet()])
        {
            acc.Count__c += accountIdContactCount.get(acc.Id);
            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty())
        {
            update accountsToUpdate;
        }
    }
    else if (Trigger.isAfter && Trigger.isDelete)
    {

        Map<Id, Integer> accountIdContactCount = new Map<Id, Integer>();
        for (Contact con : Trigger.old)
        {
            if (!accountIdContactCount.containsKey(con.AccountId))
            {
                accountIdContactCount.put(con.AccountId, - 1);
            }
            else
            {
                accountIdContactCount.put(con.AccountId, accountIdContactCount.get(con.AccountId) - 1);
            }
        }

        List<Account> accountsToUpdate = new List<Account>();
        for (Account acc : [SELECT Id, Count__c FROM Account WHERE Id IN :accountIdContactCount.keySet()])
        {
            acc.Count__c += accountIdContactCount.get(acc.Id);
            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty())
        {
            update accountsToUpdate;
        }
    }
    else if (Trigger.isAfter && Trigger.isUpdate)
    {

        Map<Id, Integer> accountIdContactCount = new Map<Id, Integer>();

        for (Contact con : Trigger.new)
        {
            if (Trigger.oldMap.get(con.Id).AccountId != con.AccountId)
            {
                if (!accountIdContactCount.containsKey(con.AccountId))
                {
                    accountIdContactCount.put(con.AccountId, 1);
                }
                else
                {
                    accountIdContactCount.put(con.AccountId, accountIdContactCount.get(con.AccountId) + 1);
                }

                if (!accountIdContactCount.containsKey(Trigger.oldMap.get(con.Id).AccountId))
                {
                    accountIdContactCount.put(Trigger.oldMap.get(con.Id).AccountId, -1);
                }
                else
                {
                    accountIdContactCount.put(Trigger.oldMap.get(con.Id).AccountId, accountIdContactCount.get(con.AccountId) - 1);    
                }
            }
        }

        List<Account> accountsToUpdate = new List<Account>();
        for (Account acc : [SELECT Id, Count__c FROM Account WHERE Id IN :accountIdContactCount.keySet()])
        {
            acc.Count__c += accountIdContactCount.get(acc.Id);
            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty())
        {
            System.debug('Update Account');
            update accountsToUpdate;
        }
    }
}
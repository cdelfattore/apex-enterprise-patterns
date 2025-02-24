/**
 * @description Got this interview question recently, did not get the job because I didn't know enough Apex.
 *              This was almost exactly the same as another interview question I had at another company.
 *              Revisiting this now to understand the entire context of a trigger.
 * @param insert 
 * @return  `trigger`
 */
trigger Contacts on Contact (after insert, after update, after delete, after undelete)
{
    Map<Id, Integer> accountIdContactCount = new Map<Id, Integer>();

    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete))
    {
        
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
    }
    else if (Trigger.isAfter && Trigger.isDelete)
    {
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
    }
    else if (Trigger.isAfter && Trigger.isUpdate)
    {
        for (Contact con : Trigger.new)
        {
            if (Trigger.oldMap.get(con.Id).AccountId != con.AccountId)
            {
                if (!accountIdContactCount.containsKey(Trigger.oldMap.get(con.Id).AccountId))
                {
                    accountIdContactCount.put(Trigger.oldMap.get(con.Id).AccountId, -1);
                }
                else
                {
                    accountIdContactCount.put(Trigger.oldMap.get(con.Id).AccountId, accountIdContactCount.get(Trigger.oldMap.get(con.Id).AccountId) - 1);    
                }

                if (!accountIdContactCount.containsKey(con.AccountId))
                {
                    accountIdContactCount.put(con.AccountId, 1);
                }
                else
                {
                    accountIdContactCount.put(con.AccountId, accountIdContactCount.get(con.AccountId) + 1);
                }
            }
        }
    }

    if (!accountIdContactCount.isEmpty())
    {
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
}
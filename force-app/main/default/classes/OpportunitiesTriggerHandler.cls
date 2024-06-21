/**
 * Trigger Handler for the Opportunity object.
 * 
 * @author cdelfattore
 * @since 2024-06-19
 * 
 * @group Trigger
 */
public class OpportunitiesTriggerHandler extends fflib_SObjectDomain
{
    public OpportunitiesTriggerHandler(List<Opportunity> sObjectList)
	{
		// Domain classes are initialised with lists to enforce bulkification throughout
		super(sObjectList);
	}

	private List<Opportunity> getOpportunities()
	{
		return (List<Opportunity>) this.getRecords();
	}

    public override void onAfterInsert()
	{
		rollupOpportunityAmountToAccountInsert();
	}

    public override void onAfterUpdate(Map<Id,SObject> existingRecords)
    {
        rollupOpportunityAmountToAccount();
    }

    public override void onAfterDelete()
    {
        rollupOpportunityAmountToAccount();
    }

	private void rollupOpportunityAmountToAccountInsert()
	{
		Map<Id, Decimal> accountIdTotalMap = new Map<Id, Decimal>();
        for(Opportunity opp : this.getOpportunities())
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
        for(Account acc : AccountsSelector.newInstance().selectById(accountIdTotalMap.keySet()))
        {
            if(acc.Opportunity_Total__c == null)
                acc.Opportunity_Total__c = 0.0;
                
            acc.Opportunity_Total__c += accountIdTotalMap.get(acc.Id);
            accountsToUpdate.add(acc);
        }

        update accountsToUpdate;
	}

    /**
     * Sum up the Opportunity amount fields to the Opprotuni
     */
    private void rollupOpportunityAmountToAccount()
    {
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : this.getOpportunities())
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

    public class Constructor implements fflib_SObjectDomain.IConstructable
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new OpportunitiesTriggerHandler(sObjectList);
		}
	}
}
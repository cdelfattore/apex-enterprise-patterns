/**
 * Trigger Handler for the Account Object.
 * @author cdelfattore
 * @since 2024-05-22
 * 
 * @group Trigger
 */
public with sharing class AccountsTriggerHandler extends fflib_SObjectDomain
{
	public AccountsTriggerHandler(List<Account> sObjectList)
	{
		super(sObjectList);
	}

	public override void onApplyDefaults()
	{
		
	}

	public override void onValidate()
	{
		// Validate AccountsTriggerHandler
		// for(Account acc : getAccounts())
		// {
			
		// }
	}

	public override void onValidate(Map<Id,SObject> existingRecords)
	{
		// Validate changes to OpportunityTriggerHandler
	}

	public override void onAfterInsert()
	{
        //Call private methods that call service methods in the Accounts Domain
		
	}

    private List<Account> getAccounts()
    {
        return (List<Account>) this.records;
    }

	public class Constructor implements fflib_SObjectDomain.IConstructable
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new OpportunitiesTriggerHandler(sObjectList);
		}
	}
}
/**
 * 
 * @author cdelfattore
 * @since 2024-06-03
 */
public class AccountsSelector extends fflib_SObjectSelector
	implements IAccountsSelector
{
	public static IAccountsSelector newInstance()
	{
		return (IAccountsSelector) Application.Selector.newInstance(Account.SObjectType);
	}
	
	public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			Account.AnnualRevenue,
			Account.Description,
            Account.Id,
			Account.Name,
			Account.Opportunity_Total__c
		};
	}

	public Schema.SObjectType getSObjectType()
	{
		return Account.SObjectType;
	}

	public List<Account> selectById(Set<Id> idSet)
	{
		return (List<Account>) selectSObjectsById(idSet);
	}
		
}
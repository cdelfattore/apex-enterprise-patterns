/**
 * @description Selector class for the Account object.
 * @author cdelfattore
 * @since 2024-06-03
 * @group Selector
 */
public with sharing class AccountsSelector extends fflib_SObjectSelector
	implements IAccountsSelector
{
	/**
	 * @description Use this to create new instances of this class.
	 * @return  `IAccountsSelector`
	 */
	public static IAccountsSelector newInstance()
	{
		return (IAccountsSelector) Application.Selector.newInstance(Account.SObjectType);
	}
	
	/**
	 * @description List of fields to be queried. Please keep in alphbetical order.
	 * @return  `List<Schema.SObjectField>`
	 */
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

	/**
	 * @description Select by the Account Id.
	 * @param accountIds 
	 * @return  `List<Account>`
	 */
	public List<Account> selectById(Set<Id> accountIds)
	{
		return (List<Account>) selectSObjectsById(accountIds);
	}

	/**
	 * @description Select by Account Id with contacts
	 * @param accountIds 
	 * @return  `List<Account>`
	 */
	public List<Account> selectByIdWithContacts(Set<Id> accountIds)
	{
		return (List<Account>) Database.query(
			createContactsByAccountQueryFactory()
				.setCondition('Id IN :accountIds')
				.toSOQL()
		);
	}

	/**
	 * @description Select by the LastModifiedId, OrderByLastModifiedDate Desc, with related Contacts.
	 * @param userIds 
	 * @param recordAmount 
	 * @return  `List<Account>`
	 */
	public List<Account> selectByLastModifiedIdWithContacts(Set<Id> userIds, Integer recordAmount)
	{
		return (List<Account>) Database.query(
			createContactsByAccountQueryFactory()
				.setCondition('LastModifiedById IN :userIds')
				.setOrdering('LastModifiedDate', fflib_QueryFactory.SortOrder.DESCENDING)
				.setLimit(recordAmount)
				.toSOQL()
		);
	}

	/**
	 * @description This query factory is created in a few different methods. Let's use this private method to construct the ContactByAccount query factory.
	 * @return  `fflib_QueryFactory`
	 */
	private fflib_QueryFactory createContactsByAccountQueryFactory()
	{
		fflib_QueryFactory accountsQueryFactory = newQueryFactory();
		fflib_QueryFactory contactsQueryFactory = new ContactsSelector().addQueryFactorySubselect(accountsQueryFactory);
		return accountsQueryFactory;
	}
}
/**
 * @description Selector class for the Account object.
 * @author cdelfattore
 * @since 2024-06-03
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
	 * @description Select by the LastModifiedId, OrderByLastModifiedDate Desc, with related Contacts.
	 * @param userIds 
	 * @param recordAmount 
	 * @return  `List<Account>`
	 */
	public List<Account> selectByLastModifiedIdWithContacts(Set<Id> userIds, Integer recordAmount)
	{
		fflib_QueryFactory accountsQueryFactory = newQueryFactory();

		fflib_QueryFactory contactsQueryFactory = new ContactsSelector().addQueryFactorySubselect(accountsQueryFactory);

		return (List<Account>) Database.query(
			accountsQueryFactory
				.setCondition('LastModifiedById IN :userIds')
				.setOrdering('LastModifiedDate', fflib_QueryFactory.SortOrder.DESCENDING)
				.setLimit(recordAmount)
				.toSOQL()
		);
	}

}
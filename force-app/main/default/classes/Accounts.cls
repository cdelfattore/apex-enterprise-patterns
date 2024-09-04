/**
 * @description Domain class for the Account object.
 * @author cdelfattore
 * @since 2024-05-20
 * @group Domain
 */
public class Accounts extends fflib_SObjects
    implements IAccounts
{
	/**
	 * @description Use this method to create a instance of the Accounts class.
	 * @param recordList 
	 * @return  `IAccounts`
	 */
	public static IAccounts newInstance(List<Account> recordList)
	{
		return (IAccounts) Application.Domain.newInstance(recordList);
	}

	/**
	 * @description Constructor for this domain class.
	 * @param sObjectList 
	 */
	public Accounts(List<Account> sObjectList)
	{
		super(sObjectList, Schema.Account.SObjectType);
	}

	/**
	* @description Use the getRecords method from the fflib_SObjectDomain class to retrieve the Account records that are a part of this domain.
	* @return  `List<Account>`
	*/
	public List<Account> getAccounts()
	{
		return (List<Account>) getRecords();
	}

	/**
	 * @description This could normally be done with a roll up summary field. For the sake of an example we will use it.
	 */
	public void setContactCount()
	{
		for (Account account : getAccounts())
		{
			if (account.Contacts != null)
			{
				account.Contact_Count__c = account.Contacts.size();
			}
			else
			{
				account.Contact_Count__c = 0;
			}
		}
	}

	/**
	 * @description Set the description of all the accounts in the domain.
	 * @param description 
	 */
	public void setDescription(String description)
	{
		for (Account account : getAccounts())
		{
			account.Description = description;
		}
	}

	/**
	 * @description Constructor class
	 */
	public class Constructor implements fflib_IDomainConstructor
	{
		public fflib_SObjects construct(List<Object> objectList)
		{
			return new Accounts((List<SObject>) objectList);
		}
	}
}
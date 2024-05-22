/**
 * Domain class for the Account object.
 * 
 * @author cdelfattore
 * @since 2024-05-2024
 * 
 * @group Domain
 */
public class Accounts extends fflib_SObjectDomain
    implements IAccounts
{

    public static IAccounts newInstance(List<Account> recordList)
	{
		return (IAccounts) Application.Domain.newInstance(recordList);
	}

    public Accounts(List<Account> sObjectList)
	{
		super(sObjectList, Schema.Account.SObjectType);
	}

    /**
     * Use the getRecords method from the fflib_SObjectDomain class
     * to retrieve the Account records that are a part of this domain.
     * @return  `List<Account>`
     */
    public List<Account> getAccounts()
	{
		return (List<Account>) getRecords();
	}

	public class Constructor implements fflib_IDomainConstructor
	{
		public fflib_SObjects construct(List<Object> objectList)
		{
			return new Accounts((List<SObject>) objectList);
		}
	}
}
/**
 * Domain class for accounts.
 */
public class Accounts extends fflib_SObjectDomain
{
    public Accounts(List<Account> sObjectList)
	{
		super(sObjectList);
	}

    public override void onApplyDefaults()
    {
        for(Account account : (List<Account>) this.records)
        {
            if(account.Description == null)
            {
                account.Description = 'Domain classes rock!';
            }
            
        }
    }

    public override void onBeforeUpdate(Map<Id, SObject> existingRecords)
    {
        for(Account account : (List<Account>) records)
        {
            account.AnnualRevenue = account.Description.getLevenshteinDistance('Domain classes rock!');
        }
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable
    {
        public fflib_SObjectDomain construct(List<SObject> sObjectList)
        {
            return new Accounts(sObjectList);
        }
    }
}
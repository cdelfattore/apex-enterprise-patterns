/**
 * Domain class for the Opportunity object.
 * 
 * @author cdelfattore
 * @since 2024-06-21
 * 
 * @group Domain
 */
public class Opportunities extends fflib_SObjectDomain
    implements IOpportunities
{
    public Opportunities(List<Opportunity> sObjectList)
	{
		super(sObjectList, Schema.Opportunity.SObjectType);
	}

    

    public class Constructor implements fflib_IDomainConstructor
	{
		public fflib_SObjects construct(List<Object> objectList)
		{
			return new Opportunities((List<SObject>) objectList);
		}
	}
}

/**
 * Apex Enterprise Patterns Application File.
 *
 * @author cdelfattore
 * @since 2024-05-22
 */
public class Application 
{
	// Configure and create the UnitOfWorkFactory for this Application
	public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
		new fflib_Application.UnitOfWorkFactory(
				new List<SObjectType> {
					// Account.SObjectType,
					// Invoice__c.SObjectType,
					// InvoiceLine__c.SObjectType,
					// Opportunity.SObjectType,
					// Product2.SObjectType,
					// PricebookEntry.SObjectType,
					// OpportunityLineItem.SObjectType,
					// WorkOrder__c.SObjectType,
					// DeveloperWorkItem__c.SObjectType,
					// TrainingWorkItem__c.SObjectType,
					// DesignWorkItem__c.SObjectType
                });	

	// Configure and create the ServiceFactory for this Application
	public static final fflib_Application.ServiceFactory Service = 
		new fflib_Application.ServiceFactory( 
			new Map<Type, Type> {
					// IAccountsService.class => AccountsServiceImpl.class,
					// IOpportunitiesService.class => OpportunitiesServiceImpl.class,
					// IInvoicingService.class => InvoicingServiceImpl.class
                });

	// Configure and create the SelectorFactory for this Application
	public static final fflib_Application.SelectorFactory Selector = 
		new fflib_Application.SelectorFactory(
			new Map<SObjectType, Type> {
					Account.SObjectType => AccountsSelector.class
					// Opportunity.SObjectType => OpportunitiesSelector.class,
					// OpportunityLineItem.SObjectType => OpportunityLineItemsSelector.class,
					// PricebookEntry.SObjectType => PricebookEntriesSelector.class,
					// Pricebook2.SObjectType => PricebooksSelector.class,
					// Product2.SObjectType => ProductsSelector.class,
					// User.sObjectType => UsersSelector.class
                });

	// Configure and create the DomainFactory for this Application
	public static final fflib_Application.DomainFactory Domain = 
		new fflib_Application.DomainFactory(
			Application.Selector,
			new Map<SObjectType, Type> {
					Account.SObjectType => Accounts.Constructor.class//,
					//DeveloperWorkItem__c.SObjectType => DeveloperWorkItems.class,
                    //Opportunity.SObjectType => Opportunities.Constructor.class,
					//OpportunityLineItem.SObjectType => OpportunityLineItems.Constructor.class,
                });
}
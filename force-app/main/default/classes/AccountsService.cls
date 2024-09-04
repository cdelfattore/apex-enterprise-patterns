/**
 * @description Service class for the Account object.
 * @author cdelfattore
 * @since 2024-08-26
 * @group Service
 */
public with sharing class AccountsService
{
    
    public static List<Account> retrieveContactsByAccount(Set<Id> userIds, Integer amount)
    {
        return service().retrieveContactsByAccount(userIds, amount);
    }

    public static void updateAccountDescriptionsAndContactCount(List<String> accountIdList, String description)
    {
        service().updateAccountDescriptionsAndContactCount(accountIdList, description);
    }
    
    public static void updateAccountDescriptionsAndContactCount(Set<Id> accountIds, String description)
    {
        service().updateAccountDescriptionsAndContactCount(accountIds, description);
    }

    public static void updateAccountDescriptions(Set<Id> accountIds, String description)
    {
        service().updateAccountDescriptions(accountIds, description);
    }

    public static void updateAccountDescriptions(fflib_ISObjectUnitOfWork uow, IAccounts accountsDomain, String description)
    {
        service().updateAccountDescriptions(uow, accountsDomain, description);
    }

    public static void updateAccountContactCounts(Set<Id> accountIds)
    {
        service().updateAccountContactCounts(accountIds);
    }

    public static void updateAccountContactCounts(fflib_ISObjectUnitOfWork uow, IAccounts accountsDomain)
    {
        service().updateAccountContactCounts(uow, accountsDomain);
    }
    
    private static IAccountsService service()
    {
        return (IAccountsService) Application.Service.newInstance(IAccountsService.class);
    }
}
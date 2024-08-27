/**
 * @description Service class for the Account object.
 * @author 
 * @since 2024-08-26
 * @group Service
 */
public with sharing class AccountsService
{
    
    public static List<Account> retrieveAndUpdateContactsByAccounts(Set<Id> userIds, Integer amount)
    {
        return service().retrieveAndUpdateContactsByAccounts(userIds, amount);
    }
    
    private static IAccountsService service()
    {
        return (IAccountsService) Application.Service.newInstance(IAccountsService.class);
    }
}
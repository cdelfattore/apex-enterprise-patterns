/**
 * @description Service interface for the Account object.
 * @author 
 * @since 
 * @group Service
 */
public interface IAccountsService 
{
    List<Account> retrieveAndUpdateContactsByAccounts(Set<Id> userIds, Integer amount);
}
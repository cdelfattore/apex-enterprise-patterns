/**
 * @description Service interface for the Account object.
 * @author 
 * @since 
 * @group Service
 */
public interface IAccountsService 
{
    List<Account> retrieveContactsByAccount(Set<Id> userIds, Integer amount);
    void updateAccountDescriptionsAndContactCount(List<String> accountIdList, String description);
    void updateAccountDescriptionsAndContactCount(Set<Id> accountIds, String description);
    void updateAccountDescriptions(Set<Id> accountIds, String description);
    void updateAccountDescriptions(fflib_ISObjectUnitOfWork uow, IAccounts accountsDomain, String description);
    void updateAccountContactCounts(Set<Id> accountIds);
    void updateAccountContactCounts(fflib_ISObjectUnitOfWork uow, IAccounts accountsDomain);
}
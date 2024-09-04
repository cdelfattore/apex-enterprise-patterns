/**
 * @description Interface for the Account Selector class.
 * @author cdelfattore
 * @since 2024-06-03
 */
public interface IAccountsSelector
{
    List<Account> selectById(Set<Id> idSet);
    List<Account> selectByIdWithContacts(Set<Id> accountIds);
    List<Account> selectByLastModifiedIdWithContacts(Set<Id> userIds, Integer recordAmount);
}
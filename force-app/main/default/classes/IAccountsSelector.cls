/**
 * Interface for the Account Selector class.
 * @author cdelfattore
 * @since 2024-06-03
 */
public interface IAccountsSelector
{
    List<Account> selectById(Set<Id> idSet);
}
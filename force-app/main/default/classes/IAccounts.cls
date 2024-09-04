/**
 * @description Interface for the Accounts Domain.
 * @author cdelfattore
 * @since 2024-05-22
 * @group Domain
 */
public interface IAccounts extends fflib_ISObjects
{
    List<Account> getAccounts();
    void setContactCount();
    void setDescription(String description);
}
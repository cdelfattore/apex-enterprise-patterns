/**
 * @description 
 * @author cdelfattore
 * @since 
 * @group Service
 */
public with sharing class AccountsServiceImpl implements IAccountsService
{
    /**
     * @description 
     * @return  `List<Account>`
     */
    public List<Account> retrieveAndUpdateContactsByAccounts(Set<Id> userIds, Integer amount)
    {
        List<Account> accountsWithContacts = AccountsSelector.newInstance()
            .selectByLastModifiedIdWithContacts(userIds, amount);

        for (Account account : accountsWithContacts)
        {
            for (Contact contact : account.Contacts)
            {
                contact.FirstName = Account.Name + ' ' + contact.FirstName;
            }
        }

        return accountsWithContacts;
    }
}
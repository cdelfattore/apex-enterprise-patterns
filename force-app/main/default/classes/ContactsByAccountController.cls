/**
 * @description Controller class for the ContactsByAccount Lightning Web Component.
 * @author cdelfattore
 * @since 2024-07-11
 * @group Controller
 */
public with sharing class ContactsByAccountController
{
    @AuraEnabled
    public static List<Account> getAccountWithContactsList()
    {
        return AccountsService.retrieveAndUpdateContactsByAccounts(new Set<Id>{UserInfo.getUserId()}, 10);
    }

    /**
     * @description Return the last ten accounts that were modified by the current logged in user.
     * @return  `List<Account>`
     */
    // @AuraEnabled
    // public static List<Account> getAccountWithContactsList()
    // {
    //     List<Account> accountsWithContacts = AccountsSelector.newInstance()
    //         .selectByLastModifiedIdWithContacts(new Set<Id> { UserInfo.getUserId() }, 10);

    //     for (Account account : accountsWithContacts)
    //     {
    //         for (Contact contact : account.Contacts)
    //         {
    //             contact.FirstName = Account.Name + ' ' + contact.FirstName;
    //         }
    //     }
    //     return accountsWithContacts;
    // }
}
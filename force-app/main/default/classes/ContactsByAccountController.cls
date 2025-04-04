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
        List<Account> accounts = AccountsService.retrieveContactsByAccount(new Set<Id>{UserInfo.getUserId()}, 10);
        System.debug(accounts);
        return accounts;
    }

    /**
     * @description 
     * @param accountIds 
     * @param description 
     */
    @AuraEnabled
    public static void updateDesciptionAndContactCount(List<String> accountIdList, String description)
    {        
        AccountsService.updateAccountDescriptionsAndContactCount(accountIdList, description);
    }
}
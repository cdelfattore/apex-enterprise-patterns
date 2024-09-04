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
        return AccountsService.retrieveContactsByAccount(new Set<Id>{UserInfo.getUserId()}, 10);
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
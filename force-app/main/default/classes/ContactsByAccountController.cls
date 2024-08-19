/**
 * Controller class for the ContactsByAccount Lightning Web Component.
 * 
 * @author cdelfattore
 * @since 2024-07-11
 * 
 * @group Component Controller
 */
public with sharing class ContactsByAccountController
{

    @AuraEnabled
    public static List<Account> getAccountList()
    {
        return [SELECT Id, Name FROM Account LIMIT 10];
    }
}
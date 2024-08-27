export default [
    {
        "title": "Home",
        "fileName": "index.html",
        "text": "Home Project Home Use the apexdox.homePagePath  setting to point to an HTML file that contains details about your project. The body of the HTML will show up here instead of this default!"
    },
    {
        "title": "Accounts",
        "fileName": "Accounts.html",
        "text": "Accounts Domain class for the Account object. Signature public class Accounts extends fflib_SObjectDomain Author cdelfattore Since 2024-05-2024 Accounts Constructors Accounts(sObjectList) Accounts(sObjectList) Signature public Accounts(List<Account> sObjectList) Parameters sObjectList Type: List<Account> Accounts Methods getAccounts() Use the getRecords method from the fflib_SObjectDomain class to retrieve the Account records that are a part of this domain. newInstance(recordList) Use this method to create a instance of the Accounts class. getAccounts() Use the getRecords method from the fflib_SObjectDomain class to retrieve the Account records that are a part of this domain. Signature public List<Account> getAccounts() Returns List<Account> newInstance(recordList) Use this method to create a instance of the Accounts class. Signature public static IAccounts newInstance(List<Account> recordList) Parameters recordList Type: List<Account> Returns IAccounts Accounts.Constructor Signature public class Constructor implements fflib_IDomainConstructor Accounts.Constructor Methods construct(objectList) construct(objectList) Signature public fflib_SObjects construct(List<Object> objectList)"
    },
    {
        "title": "AccountsSelector",
        "fileName": "AccountsSelector.html",
        "text": "AccountsSelector Selector class for the Account object. Signature public with sharing class AccountsSelector extends fflib_SObjectSelector Author cdelfattore Since 2024-06-03 AccountsSelector Methods getSObjectFieldList() getSObjectType() newInstance() selectById(accountIds) selectByIdWithContacts(accountIds) selectByNumberOf(numberOfAccounts) getSObjectFieldList() Signature public List<Schema.SObjectField> getSObjectFieldList() getSObjectType() Signature public Schema.SObjectType getSObjectType() newInstance() Signature public static IAccountsSelector newInstance() selectById(accountIds) Signature public List<Account> selectById(Set<Id> accountIds) selectByIdWithContacts(accountIds) Signature public List<Account> selectByIdWithContacts(Set<Id> accountIds) selectByNumberOf(numberOfAccounts) Signature public List<Account> selectByNumberOf(Integer numberOfAccounts)"
    },
    {
        "title": "AccountsServiceImpl",
        "fileName": "AccountsServiceImpl.html",
        "text": "AccountsServiceImpl Signature public with sharing class AccountsServiceImpl Author cdelfattore AccountsServiceImpl Methods updateContactsWithAccountName() updateContactsWithAccountName() Signature public List<Account> updateContactsWithAccountName()"
    },
    {
        "title": "AccountsTriggerHandler",
        "fileName": "AccountsTriggerHandler.html",
        "text": "AccountsTriggerHandler Trigger Handler for the Account Object. Signature public with sharing class AccountsTriggerHandler extends fflib_SObjectDomain Author cdelfattore Since 2024-05-22 AccountsTriggerHandler Constructors AccountsTriggerHandler(sObjectList) AccountsTriggerHandler(sObjectList) Signature public AccountsTriggerHandler(List<Account> sObjectList) AccountsTriggerHandler Methods getAccounts() onAfterInsert() onApplyDefaults() onValidate() onValidate(existingRecords) getAccounts() Signature private List<Account> getAccounts() onAfterInsert() Signature public override void onAfterInsert() onApplyDefaults() Signature public override void onApplyDefaults() onValidate() Signature public override void onValidate() onValidate(existingRecords) Signature public override void onValidate(Map<Id,SObject> existingRecords) AccountsTriggerHandler.Constructor Signature public class Constructor implements fflib_SObjectDomain.IConstructable AccountsTriggerHandler.Constructor Methods construct(sObjectList) construct(sObjectList) Signature public fflib_SObjectDomain construct(List<SObject> sObjectList)"
    },
    {
        "title": "AccountsTriggerHandlerTest",
        "fileName": "AccountsTriggerHandlerTest.html",
        "text": "AccountsTriggerHandlerTest Test class for the AccountTriggerHandler class. Signature @IsTest private class AccountsTriggerHandlerTest Author cdelfattore Since 2024-06-03 AccountsTriggerHandlerTest Methods simpleInsert() simpleInsert() Signature @IsTest static void simpleInsert()"
    },
    {
        "title": "Application",
        "fileName": "Application.html",
        "text": "Application Apex Enterprise Patterns Application File. Signature public class Application Author cdelfattore Since 2024-05-22 Application Properties Name Signature Domain public static final fflib_Application.DomainFactory Domain Selector public static final fflib_Application.SelectorFactory Selector Service public static final fflib_Application.ServiceFactory Service UnitOfWork public static final fflib_Application.UnitOfWorkFactory UnitOfWork"
    },
    {
        "title": "ContactsByAccountController",
        "fileName": "ContactsByAccountController.html",
        "text": "ContactsByAccountController Controller class for the ContactsByAccount Lightning Web Component. Signature public with sharing class ContactsByAccountController Author cdelfattore Since 2024-07-11 ContactsByAccountController Methods getAccountList() Return the last ten accounts that were modified by the current logged in user. getAccountList() Return the last ten accounts that were modified by the current logged in user. Signature @AuraEnabled public static List<Account> getAccountList() Returns List<Account>"
    },
    {
        "title": "ContactsSelector",
        "fileName": "ContactsSelector.html",
        "text": "ContactsSelector Signature public with sharing class ContactsSelector ContactsSelector Methods getSObjectFieldList() getSObjectType() newInstance() selectById(contactIds) getSObjectFieldList() Signature public List<Schema.SObjectField> getSObjectFieldList() getSObjectType() Signature public Schema.SObjectType getSObjectType() newInstance() Signature public static IContactsSelector newInstance() selectById(contactIds) Signature public List<Contact> selectById(Set<Id> contactIds)"
    },
    {
        "title": "IAccounts",
        "fileName": "IAccounts.html",
        "text": "IAccounts Interface for the Accounts Domain. Signature public interface IAccounts Author cdelfattore Since 2024-05-22 IAccounts Methods getAccounts() getAccounts() Signature List<Account> getAccounts()"
    },
    {
        "title": "IAccountsSelector",
        "fileName": "IAccountsSelector.html",
        "text": "IAccountsSelector Interface for the Account Selector class. Signature public interface IAccountsSelector Author cdelfattore Since 2024-06-03 IAccountsSelector Methods selectById(idSet) selectById(idSet) Signature List<Account> selectById(Set<Id> idSet)"
    },
    {
        "title": "IContactsSelector",
        "fileName": "IContactsSelector.html",
        "text": "IContactsSelector Selector class for the Contact object. Signature public with sharing class IContactsSelector Since 2024-08-26"
    },
    {
        "title": "IOpportunities",
        "fileName": "IOpportunities.html",
        "text": "IOpportunities Signature public interface IOpportunities"
    },
    {
        "title": "Opportunities",
        "fileName": "Opportunities.html",
        "text": "Opportunities Domain class for the Opportunity object. Signature public class Opportunities extends fflib_SObjectDomain Author cdelfattore Since 2024-06-21 Opportunities Constructors Opportunities(sObjectList) Opportunities(sObjectList) Signature public Opportunities(List<Opportunity> sObjectList) Opportunities.Constructor Signature public class Constructor implements fflib_IDomainConstructor Opportunities.Constructor Methods construct(objectList) construct(objectList) Signature public fflib_SObjects construct(List<Object> objectList)"
    },
    {
        "title": "OpportunitiesTriggerHandler",
        "fileName": "OpportunitiesTriggerHandler.html",
        "text": "OpportunitiesTriggerHandler Trigger Handler for the Opportunity object. Signature public class OpportunitiesTriggerHandler extends fflib_SObjectDomain Author cdelfattore Since 2024-06-19 OpportunitiesTriggerHandler Constructors OpportunitiesTriggerHandler(sObjectList) OpportunitiesTriggerHandler(sObjectList) Signature public OpportunitiesTriggerHandler(List<Opportunity> sObjectList) OpportunitiesTriggerHandler Methods getOpportunities() onAfterDelete() onAfterInsert() onAfterUpdate(existingRecords) rollupOpportunityAmountToAccount() Sum up the Opportunity amount fields to the Opprotuni rollupOpportunityAmountToAccountInsert() getOpportunities() Signature private List<Opportunity> getOpportunities() onAfterDelete() Signature public override void onAfterDelete() onAfterInsert() Signature public override void onAfterInsert() onAfterUpdate(existingRecords) Signature public override void onAfterUpdate(Map<Id,SObject> existingRecords) rollupOpportunityAmountToAccount() Sum up the Opportunity amount fields to the Opprotuni Signature private void rollupOpportunityAmountToAccount() rollupOpportunityAmountToAccountInsert() Signature private void rollupOpportunityAmountToAccountInsert() OpportunitiesTriggerHandler.Constructor Signature public class Constructor implements fflib_SObjectDomain.IConstructable OpportunitiesTriggerHandler.Constructor Methods construct(sObjectList) construct(sObjectList) Signature public fflib_SObjectDomain construct(List<SObject> sObjectList)"
    },
    {
        "title": "OpportunitiesTriggerTest",
        "fileName": "OpportunitiesTriggerTest.html",
        "text": "OpportunitiesTriggerTest Test class for the OpportunitiesTrigger using non Apex Enterprise patterns. Signature @IsTest private class OpportunitiesTriggerTest Author cdelfattore Since 2024-06-18 OpportunitiesTriggerTest Methods onOpportunityDelete() onOpportunityInsert() onOpportunityInsertExistingOpps() onOpportunityUpdate() onOpportunityDelete() Signature @IsTest private static void onOpportunityDelete() onOpportunityInsert() Signature @IsTest private static void onOpportunityInsert() onOpportunityInsertExistingOpps() Signature @IsTest private static void onOpportunityInsertExistingOpps() onOpportunityUpdate() Signature @IsTest private static void onOpportunityUpdate()"
    }
];

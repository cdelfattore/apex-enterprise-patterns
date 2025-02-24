/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@IsTest
private class ContactsTriggerTest
{

    @IsTest
    private static void insertContact()
    {
        Account account = TestDataFactory.createAccount(true);

        Test.startTest();

        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < 5; i++)
        {
            contactList.add(TestDataFactory.createContact(false, account.Id, 'Test' + i));
        }
        insert contactList;

        Test.stopTest();

        Account accountPostInsert = [SELECT Id, Count__c FROM Account WHERE Id = :account.Id LIMIT 1];

        System.assertEquals(contactList.size(), accountPostInsert.Count__c);        

    }

    @IsTest
    private static void updateContact()
    {
        List<Account> accountList = new List<Account>();

        Account account = TestDataFactory.createAccount(false);
        accountList.add(account);

        Account accountB = TestDataFactory.createAccount(false);
        accountList.add(accountB);

        insert accountList;

        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < 5; i++)
        {
            contactList.add(TestDataFactory.createContact(false, account.Id, 'Test' + i));
        }
        insert contactList;

        Test.startTest();

        contactList.get(0).AccountId = accountB.Id;
        update contactList.get(0);

        Test.stopTest();

        Account accountPostInsert = [SELECT Id, Count__c FROM Account WHERE Id = :account.Id LIMIT 1];
        Account accountBPostInsert = [SELECT Id, Count__c FROM Account WHERE Id = :accountB.Id LIMIT 1];

        System.assertEquals(contactList.size() - 1, accountPostInsert.Count__c);
        System.assertEquals(1, accountBPostInsert.Count__c);

    }

    @IsTest
    private static void deleteContact()
    {
        Account account = TestDataFactory.createAccount(true);

        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < 5; i++)
        {
            contactList.add(TestDataFactory.createContact(false, account.Id, 'Test' + i));
        }
        insert contactList;

        Test.startTest();

        delete new List<Contact>{contactList.get(0), contactList.get(1)};

        Test.stopTest();

        Account accountPost = [SELECT Id, Count__c FROM Account WHERE Id = :account.Id LIMIT 1];

        System.assertEquals(contactList.size() - 2, accountPost.Count__c);  

    }

    @IsTest
    private static void undeleteContact()
    {
        Account account = TestDataFactory.createAccount(true);

        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < 5; i++)
        {
            contactList.add(TestDataFactory.createContact(false, account.Id, 'Test' + i));
        }
        insert contactList;

        Id contactIdToUndelete = contactList.get(0).Id;

        delete contactList.get(0);

        Account accountPostDelete = [SELECT Id, Count__c FROM Account WHERE Id = :account.Id LIMIT 1];

        Test.startTest();

        undelete new Contact(Id = contactIdToUndelete);
        
        Test.stopTest();

        Account accountPostUndelete = [SELECT Id, Count__c FROM Account WHERE Id = :account.Id LIMIT 1];

        System.assertEquals(contactList.size() - 1, accountPostDelete.Count__c);
        System.assertEquals(contactList.size(), accountPostUndelete.Count__c);  

    }

    @IsTest
    private static void mergeContact()
    {
        List<Account> accountList = new List<Account>();

        Account account = TestDataFactory.createAccount(false);
        accountList.add(account);

        Account accountB = TestDataFactory.createAccount(false);
        accountList.add(accountB);

        insert accountList;

        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < 5; i++)
        {
            contactList.add(TestDataFactory.createContact(false, account.Id, 'Test' + i));
            contactList.add(TestDataFactory.createContact(false, accountB.Id, 'TestB' + i));
        }
        insert contactList;

        Test.startTest();

        merge contactList.get(0) contactList.get(1);

        Test.stopTest();

        Account accountPost = [SELECT Id, Count__c, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE Id = :account.Id LIMIT 1];
        Account accountBPost = [SELECT Id, Count__c, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE Id = :accountB.Id LIMIT 1];

        // System.debug(contactList.size());
        // System.debug(accountPost);
        // System.debug(accountPost.Contacts.size());
        // System.debug(accountBPost);
        // System.debug(accountBPost.Contacts.size());

        System.debug(accountPost.Contacts);
        System.debug(accountBPost.Contacts);

        // System.assertEquals(contactList.size() - 1, accountPostInsert.Count__c);
        // System.assertEquals(1, accountBPostInsert.Count__c);
    }

}
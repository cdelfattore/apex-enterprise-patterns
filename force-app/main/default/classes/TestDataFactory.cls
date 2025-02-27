/**
*   Test update from another computer.
**/
@IsTest
public class TestDataFactory
{
    public static Account createAccount(Boolean insertAccount)
    {
        return createAccount(insertAccount, 'Test');
    }

    public static Account createAccount(Boolean insertAccount, String name)
    {
        Account account = new Account(
            Name = name
        );

        if (insertAccount)
            insert account;

        return account;
    }

    public static Contact createContact(Boolean insertContact, Id accountId)
    {
        return createContact(insertContact, accountId, 'Test');
    }

    public static Contact createContact(Boolean insertContact, Id accountId, String lastName)
    {
        Contact contact = new Contact(
            AccountId = accountId,
            FirstName = 'Chris',
            LastName = lastName
        );

        if (insertContact)
            insert contact;

        return contact;
    }
}
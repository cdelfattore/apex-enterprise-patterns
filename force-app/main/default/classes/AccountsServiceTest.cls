@IsTest
private class AccountsServiceTest
{
    @IsTest
    private static void retrieveContactsByAccountTest()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();

        AccountsSelector mockSelect = (AccountsSelector) mocks.mock(AccountsSelector.class);
        Id lastModUserId = fflib_IDGenerator.generate(User.SObjectType);
        System.debug(lastModUserId);
        List<Account> accounts = new List<Account>{
            new Account(
                Id = fflib_IDGenerator.generate(Account.SObjectType),
                Name = 'Test Account'//,
                // LastModifiedById = lastModUserId
            )
        };
        Set<Id> userId = new Set<Id>{lastModUserId};
        mocks.startStubbing();
        mocks.when(mockSelect.SObjectType()).thenReturn(Account.SObjectType);
        mocks.when(mockSelect.selectByLastModifiedIdWithContacts(userId, 1)).thenReturn(accounts);
        mocks.stopStubbing();
        Application.Selector.setMock(mockSelect);

        AccountsService.retrieveContactsByAccount(userId, 1);
        // System.assertEquals(accounts, AccountsService.retrieveContactsByAccount(userId, 1));

    }


}
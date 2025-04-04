@IsTest
private class ContactsByAccountControllerTest {

    @IsTest
    static void getAccountWithContactsListTest()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();

        AccountsServiceImpl mockAccountService = (AccountsServiceImpl) mocks.mock(AccountsServiceImpl.class);
        // mocks.startStubbing();
        // mocks.when(mockAccountService.retrieveContactsByAccount(null, null)).thenReturn(new List<Account>{new Account(Name = 'Test Account')});
        // mocks.stopStubbing();
        Application.Service.setMock(AccountsService.class, mockAccountService);

        Test.startTest();

        System.debug(ContactsByAccountController.getAccountWithContactsList());

        Test.stopTest();
    }
}
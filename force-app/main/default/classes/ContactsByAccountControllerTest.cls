@IsTest
private class ContactsByAccountControllerTest {

    // @IsTest
    // static void getAccountWithContactsListTest()
    // {
    //     fflib_ApexMocks mocks = new fflib_ApexMocks();

    //     AccountsServiceImpl mockAccountService = (AccountsServiceImpl) mocks.mock(AccountsServiceImpl.class);
    //     mocks.startStubbing();
    //     // mocks.when(mockAccountService.SObjectType()).thenReturn(Account.SObjectType);
    //     mocks.when(mockAccountService.retrieveContactsByAccount(new Set<Id>{UserInfo.getUserId()}, 10))
    //         .thenReturn(new List<Account>{new Account(Name = 'Test Account')});
    //     mocks.stopStubbing();
    //     Application.Service.setMock(AccountsService.class, mockAccountService);


    //     // System.debug();
    //     ContactsByAccountController.getAccountWithContactsList();
    //     // ((AccountsServiceImpl) mocks.verify(mockAccountService, 1))
    //     //     .retrieveContactsByAccount(new Set<Id>{UserInfo.getUserId()}, 10);

    // }

    @IsTest
    private static void updateDesciptionAndContactCountTest()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        List<String> accountIdList = new List<String>{fflib_IDGenerator.generate(Account.SObjectType)};
        String description = 'Test Description';

        //Note the Mocking needs to be set on the key used in the Applcation class for the Service class.
        //For Example, IAccountsService.class => AccountsServiceImpl.class
        //Meaning we need to verify and set the Mock on IAccountsService.
        IAccountsService mockAccountService = (IAccountsService) mocks.mock(IAccountsService.class);
        Application.Service.setMock(IAccountsService.class, mockAccountService);

        
        ContactsByAccountController.updateDesciptionAndContactCount(accountIdList, description);

        ((IAccountsService) mocks.verify(mockAccountService, 1))
            .updateAccountDescriptionsAndContactCount(accountIdList, description);

    }
}
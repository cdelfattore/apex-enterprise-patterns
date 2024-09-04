/**
 * @description 
 * @author cdelfattore
 * @since 
 * @group Service
 */
public with sharing class AccountsServiceImpl implements IAccountsService
{
    /**
     * @description Service method to simply retrieve contacts by their parent account.
     * @return  `List<Account>`
     */
    public List<Account> retrieveContactsByAccount(Set<Id> userIds, Integer amount)
    {
        return AccountsSelector.newInstance().selectByLastModifiedIdWithContacts(userIds, amount);
    }

    public void updateAccountDescriptionsAndContactCount(List<String> accountIdList, String description)
    {
        //Map the accountIds to a set, this could be moved to the Service class
        Set<Id> accountIds = new Set<Id>();
        for(String accountId : accountIdList)
        {
            accountIds.add(accountId);
        }
        updateAccountDescriptions(accountIds, description);
    }

    /**
     * @description Example of combining to service method calls into one service method.
     *              Notice the passing of one UnitOfWork instance.
     * @param accountIds 
     * @param description 
     */
    public void updateAccountDescriptionsAndContactCount(Set<Id> accountIds, String description)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        IAccounts accountsDomain = Accounts.newInstance(AccountsSelector.newInstance().selectByIdWithContacts(accountIds));
        updateAccountDescriptions(uow, accountsDomain, description);
        updateAccountContactCounts(uow, accountsDomain);
        uow.commitWork();
    }

    /**
     * @description Method to update an account description given account ids and description.
     * @param accountIds 
     * @param description 
     */
    public void updateAccountDescriptions(Set<Id> accountIds, String description)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        IAccounts accountsDomain = Accounts.newInstance(AccountsSelector.newInstance().selectById(accountIds));
        updateAccountDescriptions(uow, accountsDomain, description);
        uow.commitWork();
    }

    /**
     * @description Update the account desciprtion
     * @param uow 
     * @param accountsDomain 
     * @param description 
     */
    public void updateAccountDescriptions(fflib_ISObjectUnitOfWork uow, IAccounts accountsDomain, String description)
    {
        accountsDomain.setDescription(description);
        uow.registerDirty(accountsDomain.getAccounts());
    }

    public void updateAccountContactCounts(Set<Id> accountIds)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        updateAccountContactCounts(uow, Accounts.newInstance(AccountsSelector.newInstance().selectByIdWithContacts(accountIds)));
        uow.commitWork();
    }

    public void updateAccountContactCounts(fflib_ISObjectUnitOfWork uow, IAccounts accountsDomain)
    {
        accountsDomain.setContactCount();
        uow.registerDirty(accountsDomain.getAccounts());
    }
}
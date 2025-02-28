System.debug(Account.SObjectType.getDescribe().getKeyPrefix());
System.debug(fflib_IDGenerator.generate(Account.SObjectType));
//System.debug(ContactsByAccountController.getAccountWithContactsList());
//System.debug(Contact.SObjectType.getDescribe().getChildRelationships());
// for (Schema.ChildRelationship cr : Account.SObjectType.getDescribe().getChildRelationships())
// {
//     // if (cr.getChildSObject() == Schema.SObjectType.Contact)
//     // {
//         System.debug(cr.getRelationshipName());
//     // }
    
// }
// List<Account> accounts = AccountsSelector.newInstance().selectByLastModifiedIdWithContacts(new Set<Id>{UserInfo.getUserId()}, 10);
// for (Account account : accounts)
// {
//     for (Contact contact : account.Contacts)
//     {
//         System.debug(contact);
//     }
    
// }

//new TestSelector().selectAll();

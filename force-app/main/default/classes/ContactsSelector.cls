/**
 * @description Selector class for the Contacts object.
 * @author
 * @since 2024-08-26
 * @group Selector
 */
public with sharing class ContactsSelector extends fflib_SObjectSelector
    implements IContactsSelector
{
	/**
	 * @description Create a new instance of the class.
	 * @return  `IContactsSelector`
	 */
    public static IContactsSelector newInstance()
	{
		return (IContactsSelector) Application.Selector.newInstance(Contact.SObjectType);
	}

    public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			Contact.FirstName,
            Contact.LastName,
            Contact.Id
		};
	}

    public Schema.SObjectType getSObjectType()
	{
		return Contact.SObjectType;
	}

	/**
	 * @description Select by contact Id.
	 * @param contactIds 
	 * @return  `List<Contact>`
	 */
    public List<Contact> selectById(Set<Id> contactIds)
	{
		return (List<Contact>) selectSObjectsById(contactIds);
	}
}
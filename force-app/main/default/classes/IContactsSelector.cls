/**
 * @description Selector interface for the Contact object.
 * @author 
 * @since 2024-08-26
 * @group Selector
 */
public interface IContactsSelector
{
    List<Contact> selectById(Set<Id> contactIds);
}
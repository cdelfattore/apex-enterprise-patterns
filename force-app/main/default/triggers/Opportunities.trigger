trigger Opportunities on Opportunity (after delete, after insert, after update, before delete, before insert, before update)
{
    fflib_SObjectDomain.triggerHandler(OpportunitiesTriggerHandler.class);
}
/**
 * @description Singleton class to provide methods to retrieve RecordType information. Example of Singleton implementation.
 * @author cdelfattore
 * @since 2025-02-18
 */
public with sharing class RecordTypes
{
    public static RecordTypes instance;

    private Map<String, Map<String, Id>> recordTypeIdByObjectField = new Map<String, Map<String, Id>>();

    private RecordTypes() { }

    public static RecordTypes getInstance()
    {
        if (instance == null)
            instance = new RecordTypes();

        return instance;
    }

    public Id getRecordTypeId(Schema.DescribeSObjectResult sObjectType, String recordTypeDeveloperName)
    {
        if (!this.recordTypeIdByObjectField.containsKey(sObjectType.getName()))
        {
            Id recordTypeId = getRecordTypeIdFromSchema(sObjectType, recordTypeDeveloperName);

            this.recordTypeIdByObjectField.put(sObjectType.getName(), new Map<String, Id>{ recordTypeDeveloperName => recordTypeId});
        }
        else if (this.recordTypeIdByObjectField.containsKey(sObjectType.getName())
            && !this.recordTypeIdByObjectField.get(sObjectType.getName()).containsKey(recordTypeDeveloperName))
        {
            Id recordTypeId = getRecordTypeIdFromSchema(sObjectType, recordTypeDeveloperName);

            this.recordTypeIdByObjectField.get(sObjectType.getName()).put(recordTypeDeveloperName, recordTypeId);
        }

        return this.recordTypeIdByObjectField.get(sObjectType.getName()).get(recordTypeDeveloperName);
    }

    public Id getRecordTypeId(String objectName, String recordTypeDeveloperName)
    {
        if (!this.recordTypeIdByObjectField.containsKey(objectName))
        {
            this.recordTypeIdByObjectField.put(objectName, new Map<String, Id>());
            this.getRecordTypeIdsFromSchema(objectName);
        }

        return this.recordTypeIdByObjectField.get(objectName).get(recordTypeDeveloperName);
    }

    // public Id getRecordTypeId(Schema.DescribeSObjectResult sObjectType, String recordTypeDeveloperName)
    // {
    //     if (!this.recordTypeIdByObjectField.containsKey(sObjectType.getName()))
    //     {
    //         this.recordTypeIdByObjectField.put(sObjectType.getName(), new Map<String, Id>());
    //         this.getRecordTypeIdsFromSchema(sObjectType);
    //     }

    //     return this.recordTypeIdByObjectField.get(sObjectType.getName()).get(recordTypeDeveloperName);
    // }

    private Id getRecordTypeIdFromSchema(String objectName, String recordTypeDeveloperName)
    {
        return Schema.getGlobalDescribe().get(objectName).getDescribe()
            .getRecordTypeInfosByDeveloperName().get(recordTypeDeveloperName).getRecordTypeId();
    }

    private Id getRecordTypeIdFromSchema(Schema.DescribeSObjectResult sObjectType, String recordTypeDeveloperName)
    {
        return sObjectType.getRecordTypeInfosByDeveloperName().get(recordTypeDeveloperName).getRecordTypeId();
    }

    private void getRecordTypeIdsFromSchema(String objectName)
    {
        for (Schema.RecordTypeInfo recTypeInfo : Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosByDeveloperName().values())
        {
            this.recordTypeIdByObjectField.get(objectName).put(recTypeInfo.getDeveloperName(), recTypeInfo.getRecordTypeId());
        }
    }

    private void getRecordTypeIdsFromSchema(Schema.DescribeSObjectResult sObjectType)
    {
        for (Schema.RecordTypeInfo recTypeInfo : sObjectType.getRecordTypeInfosByDeveloperName().values())
        {
            this.recordTypeIdByObjectField.get(sObjectType.getName()).put(recTypeInfo.getDeveloperName(), recTypeInfo.getRecordTypeId());
        }

    }
}
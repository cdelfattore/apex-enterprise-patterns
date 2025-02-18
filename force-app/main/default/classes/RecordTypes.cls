/**
 * @description Singleton class to provide methods to retrieve RecordType information. Example of Singleton implementation.
 * @author cdelfattore
 * @since 2025-02-18
 */
public with sharing class RecordTypes
{
    public static RecordTypes instance;

    private Map<String, Map<String, Id>> recordTypeIdByObjectField = new Map<String, Map<String, Id>>();

    private RecordTypes() {

    }

    public static RecordTypes getInstance()
    {
        if (instance == null)
            instance = new RecordTypes();

        return instance;
    }

    public Id getRecordTypeId(String objectName, String recordTypeDeveloperName)
    {
        if (!this.recordTypeIdByObjectField.containsKey(objectName))
        {
            Id recordTypeId = getRecordTypeIdFromSchema(objectName, recordTypeDeveloperName);

            this.recordTypeIdByObjectField.put(objectName, new Map<String, Id>{ recordTypeDeveloperName => recordTypeId});
        }
        else if (this.recordTypeIdByObjectField.containsKey(objectName)
            && !this.recordTypeIdByObjectField.get(objectName).containsKey(recordTypeDeveloperName))
        {
            Id recordTypeId = getRecordTypeIdFromSchema(objectName, recordTypeDeveloperName);

            this.recordTypeIdByObjectField.get(objectName).put(recordTypeDeveloperName, recordTypeId);
        }

        return this.recordTypeIdByObjectField.get(objectName).get(recordTypeDeveloperName);
    }

    // public Id getRecordTypeId(String objectName, String recordTypeDeveloperName)
    // {
    //     if (!this.recordTypeIdByObjectField.containsKey(objectName))
    //     {
    //         this.recordTypeIdByObjectField.put(objectName, new Map<String, Id>());
    //         this.getRecordTypeIdsFromSchema(objectName);
    //     }

    //     return this.recordTypeIdByObjectField.get(objectName).get(recordTypeDeveloperName);
    // }

    private Id getRecordTypeIdFromSchema(String objectName, String recordTypeDeveloperName)
    {
        return Schema.getGlobalDescribe().get(objectName).getDescribe()
            .getRecordTypeInfosByDeveloperName().get(recordTypeDeveloperName).getRecordTypeId();
    }

    private void getRecordTypeIdsFromSchema(String objectName)
    {
        List<Schema.RecordTypeInfo> recordTypeInfos = Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosByDeveloperName().values();
        for (Schema.RecordTypeInfo recTypeInfo : recordTypeInfos)
        {
            this.recordTypeIdByObjectField.get(objectName).put(recTypeInfo.getDeveloperName(), recTypeInfo.getRecordTypeId());
        }

    }
}
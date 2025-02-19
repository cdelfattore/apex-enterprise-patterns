/**
 * @description Singleton class to provide methods to retrieve RecordTypeId information. Example of Singleton implementation.
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

    public Id getRecordTypeId(String objectName, String recordTypeDeveloperName)
    {
        if (!this.recordTypeIdByObjectField.containsKey(objectName))
        {  
            this.recordTypeIdByObjectField.put(objectName, new Map<String, Id>());
            this.getRecordTypeIdsFromSchema(objectName);
        }

        return this.recordTypeIdByObjectField.get(objectName).get(recordTypeDeveloperName);
    }

    private void getRecordTypeIdsFromSchema(String objectName)
    {
        for (Schema.RecordTypeInfo recTypeInfo : Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosByDeveloperName().values())
        {
            this.recordTypeIdByObjectField.get(objectName).put(recTypeInfo.getDeveloperName(), recTypeInfo.getRecordTypeId());
        }
    }

}
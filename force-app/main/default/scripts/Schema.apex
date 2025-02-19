// List<Schema.DescribeSObjectResult> sObjectResults = Schema.describeSObjects(new List<String>{'Account'});
// for (Schema.DescribeSObjectResult sobj : sObjectResults)
// {
    // for (SObjectField field : SObjectType.Account.fields.getMap().values())
    // {
    //     System.debug(field.getDescribe());
    // }
    
// }
// System.debug(Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName());
// Schema.DescribeSObjectResult sObjectType = Schema.SObjectType.Account;
// System.debug(sObjectType.getName());
// System.debug(sObjectType.getRecordTypeInfosByDeveloperName());

System.debug(Limits.getHeapSize());
Integer startTime = Limits.getCpuTime();
for (Integer i = 0; i < 6000; i++)
{
    RecordTypes.getInstance().getRecordTypeId('Account', 'Person');
    RecordTypes.getInstance().getRecordTypeId('Account', 'Business');
    // RecordTypes.getInstance().getRecordTypeId(Schema.SObjectType.Account, 'Person');
    // RecordTypes.getInstance().getRecordTypeId(Schema.SObjectType.Account, 'Business');
}

Integer stopTime = Limits.getCpuTime();
System.debug(Limits.getHeapSize());
System.debug(Limits.getLimitHeapSize());
System.debug(stopTime - startTime);
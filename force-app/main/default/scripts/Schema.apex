// List<Schema.DescribeSObjectResult> sObjectResults = Schema.describeSObjects(new List<String>{'Account'});
// for (Schema.DescribeSObjectResult sobj : sObjectResults)
// {
    for (SObjectField field : SObjectType.Account.fields.getMap().values())
    {
        System.debug(field.getDescribe());
    }
    
// }
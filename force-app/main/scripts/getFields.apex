// System.debug(Schema.getGlobalDescribe().get('account').getDescribe().fields.getMap());
List<String> fields = new List<String>();
for (Schema.SObjectField field : Schema.getGlobalDescribe().get('account').getDescribe().fields.getMap().values())
{
    // System.debug(field.getDescribe().getName());
    fields.add(field.getDescribe().getName());
}
System.debug(String.join(fields, ','));
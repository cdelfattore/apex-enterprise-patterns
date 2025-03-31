/**
 * @description Turn into singleton to help with performance of multiple method calls.
 * @author 
 * @since 
 */
public class ObjectDescribe
{
    public static List<String> getFieldsForObject(String objectName)
    {
        List<String> fields = new List<String>();
        for (Schema.SObjectField field : Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().values())
        {
            fields.add(field.getDescribe().getName());
        }
        return fields;
    }

    public static String getObjectName(Id recordId)
    {
        return recordId.getSobjectType().getDescribe().getName();
    }
}
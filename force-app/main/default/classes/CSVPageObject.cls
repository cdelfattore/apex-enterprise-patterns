public class CSVPageObject
{
    private String objCSV;

    public CSVPageObject(String objectName, Id recordId)
    {
        List<String> fields = ObjectDescribe.getFieldsForObject(objectName);
        
        String query = 'SELECT ' + String.join(fields, ',') + ' FROM ' + objectName + ' WHERE Id = :recordId';
        SObject obj = Database.query(query);

        List<String> result = new List<String>();
        result.add('Field,Value');
        for (String field : fields)
        {
            result.add(field + ',' + obj.get(field));
        }
        
        objCSV = String.join(result, '\n');
    }

    public String getObjCSV()
    {
        return this.objCSV;
    }
}
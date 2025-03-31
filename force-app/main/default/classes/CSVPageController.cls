public with sharing class CSVPageController
{
    
    public String csvObject {get; private set;}

    public CSVPageController(ApexPages.StandardController controller)
    {
        Id recordId = ApexPages.currentPage().getParameters().get('id');
        CSVPageObject obj = new CSVPageObject(recordId);
        this.csvObject = obj.getObjCSV();
    }

}
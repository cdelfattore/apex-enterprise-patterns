public with sharing class CSVPageController
{
    
    public String csvAccount {get; private set;}

    public CSVPageController(ApexPages.StandardController controller)
    {
        Id recordId = ApexPages.currentPage().getParameters().get('id');
        CSVPageObject account = new CSVPageObject('Account', recordId);
        this.csvAccount = account.getObjCSV();
    }

}
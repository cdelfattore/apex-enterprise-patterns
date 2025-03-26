public with sharing class CSVPageController
{
    // public List<Account> accounts {get;set;}

    public CSVPageController()
    {
        // accounts = [SELECT Id, Name FROM Account LIMIT 10];
    }

    public String getAccounts()
    {
        List<String> result = new List<String>();
        result.add('Id,Name');
        for (Account account : [SELECt Id, Name FROM Account LIMIT 10])
        {
            result.add(account.Id + ',' + account.Name.escapeCsv());
        }
        System.debug(result);
        return String.join(result, '\n');
    }
}
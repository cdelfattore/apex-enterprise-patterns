/**
 * Test class for the OpportunitiesTrigger using non Apex Enterprise patterns.
 * @author cdelfattore
 * @since 2024-06-18
 */
@IsTest
private class OpportunitiesTriggerTest
{

    @IsTest
    private static void onOpportunityInsert()
    {
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        List<Opportunity> opportunities = new List<Opportunity>();
        opportunities.add(
            new Opportunity(
                Amount = 15.00,
                Name = 'First Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );

        opportunities.add(
            new Opportunity(
                Amount = 35.00,
                Name = 'Second Opp',
                StageName = 'Proposal/Price Quote',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );

        Test.startTest();
        
        insert opportunities;

        Test.stopTest();

        System.assertEquals(50.0, [SELECT Opportunity_Total__c FROM Account WHERE Id = :acc.Id LIMIT 1].Opportunity_Total__c);
    }

    //what if you are inserting an opp to an account that already has opps on it?
    @IsTest
    private static void onOpportunityInsertExistingOpps()
    {
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        List<Opportunity> opportunities = new List<Opportunity>();
        opportunities.add(
            new Opportunity(
                Amount = 15.00,
                Name = 'First Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );

        opportunities.add(
            new Opportunity(
                Amount = 35.00,
                Name = 'Second Opp',
                StageName = 'Proposal/Price Quote',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );
        insert opportunities;

        

        Test.startTest();
        
        insert new Opportunity(
            Amount = 27.00,
            Name = 'Third Opp',
            StageName = 'Needs Analysis',
            CloseDate = Date.today().addDays(12),
            AccountId = acc.Id
        );

        Test.stopTest();

        System.assertEquals(77.0, [SELECT Opportunity_Total__c FROM Account WHERE Id = :acc.Id LIMIT 1].Opportunity_Total__c);
    }

    @IsTest
    private static void onOpportunityUpdate()
    {
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        List<Opportunity> opportunities = new List<Opportunity>();
        opportunities.add(
            new Opportunity(
                Amount = 15.00,
                Name = 'First Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );

        opportunities.add(
            new Opportunity(
                Amount = 35.00,
                Name = 'Second Opp',
                StageName = 'Proposal/Price Quote',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );
        insert opportunities;
        System.assertEquals(50.0, [SELECT Opportunity_Total__c FROM Account WHERE Id = :acc.Id LIMIT 1].Opportunity_Total__c);

        Test.startTest();
        
        opportunities.get(0).Amount = 120;
        update opportunities;

        Test.stopTest();

        System.assertEquals(155.0, [SELECT Opportunity_Total__c FROM Account WHERE Id = :acc.Id LIMIT 1].Opportunity_Total__c);
    }

    @IsTest
    private static void onOpportunityDelete()
    {
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        List<Opportunity> opportunities = new List<Opportunity>();
        opportunities.add(
            new Opportunity(
                Amount = 15.00,
                Name = 'First Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );

        opportunities.add(
            new Opportunity(
                Amount = 35.00,
                Name = 'Second Opp',
                StageName = 'Proposal/Price Quote',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        );
        insert opportunities;
        System.assertEquals(50.0, [SELECT Opportunity_Total__c FROM Account WHERE Id = :acc.Id LIMIT 1].Opportunity_Total__c);

        Test.startTest();
        
        delete opportunities.get(0);

        Test.stopTest();

        System.assertEquals(35.0, [SELECT Opportunity_Total__c FROM Account WHERE Id = :acc.Id LIMIT 1].Opportunity_Total__c);
    }
}
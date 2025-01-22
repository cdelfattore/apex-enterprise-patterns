public with sharing class TestSelector extends fflib_SObjectSelector {
	public TestSelector() {
		super(false, true, true, false);
	}

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField>{ Test__mdt.Id };
	}

	public Schema.SObjectType getSObjectType() {
		return Test__mdt.SObjectType;
	}

	public List<Test__mdt> selectAll() {

		fflib_QueryFactory qf = newQueryFactory();
		qf.selectFields(new List<String>{'Entity__r.QualifiedApiName', 'Field__r.QualifiedApiName'});

		return Database.query(qf.toSOQL());

	}
}
@isTest
public class TestDataFactory {

	public static List<Production__c> getProductions(Integer numnerOfProductions, Boolean updateDatabase){
		
		Product2 product=getProduct();
		List<Production__c> result=new List<Production__c>();

		for (Integer i = 0; i < numnerOfProductions; i++)
		{
			result.add(new Production__c(Name=String.valueOf(i), Quantity__c=i, Product__c=product.Id, Product__r=product));
		}

		if (updateDatabase==true)
		{
			insert result;
		}
		return result;
	}

	public static List<Product2> getProducts(Integer numberOfProdducts, Boolean updateDatabase){
		
		List<Product2> result=new List<Product2>();

		for (Integer i = 0; i < numberOfProdducts; i++)
		{
			result.add(new Product2(Name=String.valueOf(i), Production_Quantity__c=0));
		}
		
		if (updateDatabase==true)
		{
			insert result;
		}
		return result;
		return result;
	}

	public static Product2 getProduct(){
		return [SELECT Name,Production_Quantity__c FROM Product2 LIMIT 1];
	}
}
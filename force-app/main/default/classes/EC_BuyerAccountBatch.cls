/*
 * @description       : 
 * @author            : sf-dev
 * @group             : Pixel Pioneers- Salesforce 
 * @last modified on  : 06-27-2025
 * @last modified by  : sf
**/
public with sharing class EC_BuyerAccountBatch implements Database.Batchable<SObject>, Database.Stateful{
    /**
    * @description 
    * @author hegoswami@deloitte.com | 06-23-2025 
    * @param bc 
    * @return Database.QueryLocator 
    **/
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT id,name  FROM Account WHERE  IsBuyer =false AND CreatedDate >=YESTERDAY 
                         AND recordtype.name in ('Dometic','International') WITH   USER_MODE
        ]);
    }

    /**
    * @description 
    * @author hegoswami@deloitte.com | 06-23-2025 
    * @param bc 
    * @param scope 
    **/
    public void execute(Database.BatchableContext bc, List<Account> scope) {

        //call utility method for buyer group and entitlement assignment
       // EC_AccessManagementUtility.executeBuyerAccountEnablement(scope);
    }

    /**
    * @description 
    * @author hegoswami@deloitte.com | 06-23-2025 
    * @param bc 
    **/
    public void finish(Database.BatchableContext bc) { 
       // Logger.info('Buyer Account Enablement Batch finished successfully.');
      //  Logger.savelog();
       // EC_AccountProcessBatch accountMemberBatch = new EC_AccountProcessBatch();
      //  Database.executeBatch(accountMemberBatch,200);
    }

}
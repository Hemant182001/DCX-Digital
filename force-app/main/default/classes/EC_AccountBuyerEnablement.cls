/**
 * @description       : 
 * @author            : dcx-lead-developer
 * @group             : 
 * @last modified on  : 07-07-2025
 * @last modified by  : dcx-lead-developer
**/
public with sharing class EC_AccountBuyerEnablement {
   /**
    * @description 
    * @author dcx-lead-developerxs
    * @param lstAccount 
    **/
    public static void executeBuyerAccountEnablement(List<Account> lstAccount) {
    List<BuyerAccount> lstBuyerAccount = new List<BuyerAccount>();
        BuyerAccount buyerAccountObj;
          for(Account obj:lstAccount)
        {
            buyerAccountObj = new BuyerAccount();
            buyerAccountObj.BuyerId = obj.id;
            buyerAccountObj.IsActive = true;
            buyerAccountObj.Name=obj.Name;
            buyerAccountObj.BuyerStatus  ='Active';
            lstBuyerAccount.add(buyerAccountObj);
        }
        if(Schema.sObjectType.BuyerAccount.isCreateable())
        {
            Database.SaveResult[] saveResult = Database.insert(lstBuyerAccount, false);
            for(Database.SaveResult sr:saveResult)
            {
                if(!sr.isSuccess())
                {
                   // Logger.info('Error updating BuyerAccount: ' + sr.getErrors()[0].getMessage());
                }
            }
            }
        }
}
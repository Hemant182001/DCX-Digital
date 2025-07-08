global class DCX_GetNewProductsData {

    @InvocableMethod(label='Get New Products')

    global static List<String> myMethod(List<String> inputList) {

        String strWebstoreId='0ZEdy0000000mUUGAY';

        Map<String,String> mapProductNameId=new Map<String,String>();

         Map<String,DateTime> mapProductNameLaunchDat=new Map<String,DateTime>();

       // List<AF_NewProducts__c> lstResults = new List<AF_NewProducts__c>();

       /*  lstResults[SELECT Name, AF_ProductRecord__c,AF_ProductRecord__r.Name, AF_LaunchDate__c, AF_EntitlementLinked__c

                             from AF_NewProducts__c ];*/

        List<String> lstIds=new List<String>();

        List<instValues> lstResponse= new List<instValues>();

        //for(AF_NewProducts__c ins:lstResults)

     //   {

            //mapProductNameId.put(ins.AF_ProductRecord__c,ins.AF_ProductRecord__r.Name);

            //mapProductNameLaunchDat.put(ins.AF_ProductRecord__c,ins.AF_LaunchDate__c);

       //     lstIds.add(ins.AF_ProductRecord__c);

      //-----  }

        ConnectApi.ProductOverviewCollection c;//=ConnectApi.CommerceCatalog.getProducts(strWebstoreId,inputList[0],lstIds,null,null,false);

        List<ConnectApi.ProductOverview> lstProd=c.products;

        for(ConnectApi.ProductOverview conIns:lstProd)

        {

            instValues re=new instValues();

            re.strProductName=mapProductNameId.get(conIns.id);

            re.datLaunchDateTime=mapProductNameLaunchDat.get(conIns.id);

            lstResponse.add(re);

           

               }

        List<ResponseWrapper> lst=new list<ResponseWrapper>();

        ResponseWrapper re=new ResponseWrapper();

        re.lstProductName=lstResponse;

        lst.add(re);

        String jsonStr = JSON.serialize(lst);

        List<String> lstStr=new  List<String>();

        lstStr.add(jsonStr);

        return lstStr;

    }

   

    global class ResponseWrapper

    {

        @InvocableVariable(label='lstProductName' description='lstProductName' required=true)

        global List<instValues> lstProductName;

    }

    global class instValues{

        global String strProductName;

        global DateTime datLaunchDateTime;

        global String strAccount;

    }
}
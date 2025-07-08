/**
 * @description       : 
 * @author            : dcx-lead-developer
 * @group             : 
 * @last modified on  : 07-08-2025
 * @last modified by  : dcx-lead-developer
**/
global class DCX_SchedularforAccountBatch implements Schedulable{

   global void execute(SchedulableContext sc) {
      EC_BuyerAccountBatch b = new EC_BuyerAccountBatch(); 
      Database.executeBatch(b);
   }
} 
using { anubhav.db.master , anubhav.db.transaction } from '../db/datamodel';


service CatalogService@(path:'CatalogService') {
 
 entity EmployeeSet as projection on master.employees;
 entity AddressSet as projection on master.address;
 entity ProductSet as projection on master.product;
 entity ProductTexts as projection on master.prodtext;
 entity BPSet as projection on master.businesspartner;  
@(odata.draft.enabled: true)
 entity POs @(
    title : '{i18n>poHeader}'
 ) as projection on transaction.purchaseorder{
    *,
    
    Items : redirected to POItems
 }actions{
        function largestOrder() returns array of POs;
        action boost();
     }
 
//@(odata.draft.enabled: true)
 entity POItems @(title : '{i18n>poItems}')
 as projection on transaction.poitems{
    *,
    PARENT_KEY: redirected to POs,
    PRODUCT_GUID: redirected to ProductSet
 } 

}

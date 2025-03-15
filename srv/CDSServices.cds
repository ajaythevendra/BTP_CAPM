using {  anubhav.db.CDSViews } from '../db/CDSViews';
using { anubhav.db.master, anubhav.db.transaction  } from '../db/datamodel';


service CDSService@(path:'/CDSServices') {

entity POWorklist as projection on CDSViews.POWorklist ;
//entity ProductOrders as projection on CDSViews.ProductViewSub;

entity ProductAggregation as projection on CDSViews.CProductValuesView;

// entity ItemView as projection on CDSViews.ItemView;

// entity ProductView as projection on CDSViews.ProductView;

   

}
using { anubhav.db.master , anubhav.db.transaction} from './datamodel';


annotate master.businesspartner with {
    NODE_KEY @title : 'BP Master';
};

annotate transaction.purchaseorder with {
    CURRENCY_CODE @title : 'Currency Code';
    GROSS_AMOUNT @title : 'Gross Amount';
    LIFECYCLE_STATUS @title: 'Lifecycle Status';
    NET_AMOUNT @title: 'Net Amount';
    OVERALL_STATUS @title: 'Overall Status';
    PARTNER_GUID @title: 'Business Partner GUID';
    PO_ID @title: 'Purchase Order ID';
    TAX_AMOUNT @title: 'Tax Amount';



};

annotate transaction.poitems with {
    CURRENCY_CODE @title : 'Currency Code';
     GROSS_AMOUNT @title : 'Gross Amount';
     PO_ITEM_POS @title : 'Purchase Order Position';
     PRODUCT_GUID @title : 'Product GUID';
     NET_AMOUNT @title : 'Net Amount';
     TAX_AMOUNT @title: 'Tax Amount';
     

};

annotate master.product with {
    PRODUCT_ID @title : 'Product ID'
};


annotate master.address with {
    COUNTRY @title : 'Country'
};
using CatalogService as service from '../../srv/CatalogService';

//First Screen with search fields and table column
annotate service.POs with @(

    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
        CURRENCY_CODE,
        LIFECYCLE_STATUS,
        OVERALL_STATUS,
    ],
    UI.LineItem:[
        
        {
            $Type : 'UI.DataField',
             Value : PO_ID,
        },
        // {
        //     $Type : 'UI.DataField',
        //      Value : PARTNER_GUID.COMPANY_NAME,
        // },
        {
            $Type : 'UI.DataField',
             Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataFieldForAction',
             Action : 'CatalogService.boost',
             Label : 'Boost',
             Inline : true
        },
        {
            $Type : 'UI.DataField',
             Value : CURRENCY_CODE,
        },
        {
            $Type : 'UI.DataField',
             Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
             Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
             Value : LIFECYCLE_STATUS,
             Criticality: Criticality,
             CriticalityRepresentation: #WithIcon,
        },
        {
            $Type : 'UI.DataField',
             Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
             Value : OVERALL_STATUS,
        },
        

        // {
        //     $Type : 'UI.DataField',
        //      Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        // },
        
          
        
    ],
    UI.HeaderInfo:{
        TypeName: 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        ImageUrl : 'https://img.freepik.com/free-psd/silver-letters-glass-building-facade_145275-162.jpg?w=1060&t=st=1709083201~exp=1709083801~hmac=01451fd96c69cbc178576abbf475f67df2e10924f8461885e30d285f5f5eb015'

    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'More Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label:'Additional Data',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label:'Pricing Data',
                    Target : '@UI.FieldGroup#group1',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label:'Status Data',
                    Target : '@UI.FieldGroup#group2',
                },
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Purchase Order Items',
            Target : 'Items/@UI.LineItem',
        },
    ],

    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        }
    ],
    UI.FieldGroup #group1:{
        Label:'Price Data',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
        ]
    },
    UI.FieldGroup #group2:{
         Label:'Status',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
        ]
    },
);

annotate service.POItems with @(

    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRODUCT_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_CODE,
        },
    ],

    UI.HeaderInfo:{
        TypeName :'Items',
        TypeNamePlural : 'Items',
        
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Info',
            Facets : [
                {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            Target : '@UI.FieldGroup#ItemDetail',
            },
            {
            $Type : 'UI.ReferenceFacet',
            Label : 'Pricing Data',
            Target : '@UI.FieldGroup#Pricing',
             },
             {
            $Type : 'UI.ReferenceFacet',
            Label : 'Products Details',
            Target : '@UI.FieldGroup#Products',
             },
            ],
        },
    ],

    UI.FieldGroup #ItemDetail:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            },
        ]
    },
    UI.FieldGroup #Pricing:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
        ]
    },
    UI.FieldGroup #Products:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.DESCRIPTION,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.CATEGORY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRICE,
            },
        ]
    }
);


// Linking the help with PO
annotate service.POs with {
    PARTNER_GUID@(
        Common.Text : PARTNER_GUID.COMPANY_NAME,
        Common.ValueList.entity: service.BusinessPartnerSet
    )
};

annotate service.POItems with {
    PRODUCT_GUID@(
        Common.Text : PRODUCT_GUID.DESCRIPTION,
        Common.ValueList.entity: service.ProductSet
    )
};


@cds.odata.valuelist
annotate service.BPSet with @(
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : COMPANY_NAME,
        }
    ]
);





@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : DESCRIPTION,
        },
    ]
);
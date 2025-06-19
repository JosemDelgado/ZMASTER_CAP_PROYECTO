using {Sales as service} from '../service';
using from './annotations-orderItem';
using from './annotations-orderStatus';


// Draft enabled
annotate service.OrderHead with @odata.draft.enabled;

annotate service.OrderHead with { //Field Labels with @title
    email        @title: '{i18n>email}';
    firstName    @title: '{i18n>firstname}';
    lastName     @title: '{i18n>lastname}';
    country      @title: '{i18n>country}';
    createOn     @title: '{i18n>createon}';
    deliveryDate @title: '{i18n>deliverydate}';
    orderStatus  @title: '{i18n>status}';
    imageURL     @title: '{i18n>image}';
    toOrderItems
};

annotate service.OrderHead with {
    orderStatus @Common: { //Status text instead code
        Text           : orderStatus.name, // Use association
        TextArrangement: #TextOnly
    };
};


annotate service.OrderHead with @(
    /*
        Filtros
    */
    UI.SelectionFields     : [
        firstName,
        lastName,
        email,
        orderStatus_code,
        deliveryDate
    ],

    /*
        LineItem
    */
    UI.LineItem            : [ //Annotation Line Item
        {
            $Type                : 'UI.DataField',
            Value                : orderStatus_code,
            Criticality          : orderStatus.criticality, //Origin of Criticality
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            }
        },
        {
            $Type: 'UI.DataField',
            Value: firstName,
        },
        {
            $Type: 'UI.DataField',
            Value: lastName,
        },
        {
            $Type: 'UI.DataField',
            Value: country_code,
        },
        {
            $Type: 'UI.DataField',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Value: deliveryDate,
        }
    // {
    //     $Type                : 'UI.DataField',
    //     Value                : imageURL, //The image
    //     ![@HTML5.CssDefaults]: {
    //         $Type: 'HTML5.CssDefaultsType',
    //         width: '10rem'
    //     }
    // },
    ],


    /*
        HeaderInfo
    */
    UI.HeaderInfo          : { //Header Info
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>salesorder}',
        TypeNamePlural: '{i18n>salesorders}',
        ImageUrl      : 'imageURL',
        Title         : {
            $Type: 'UI.DataField',
            Value: lastName
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: firstName
        }
    },


    /*
        Header Facets
    */
    UI.HeaderFacets        : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Image',
        ID    : 'Image'
    },
    // {
    //     $Type : 'UI.ReferenceFacet',
    //     Target: '@UI.FieldGroup#Status',
    //     ID    : 'ProductStatu',
    //     Label : '{i18n>orderstatus}'
    // }
    ],

    /*
        FieldGroups
    */
    // IMAGE
    UI.FieldGroup #Image   : { 
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: imageURL,
            Label: ''
        }]
    },

    /*
        Facets
    */
    UI.Facets              : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Customer',
            ID    : 'Customer',
            Label : '{i18n>customer}'
        },
        {
            $Type : 'UI.CollectionFacet',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#ImageStatus',
                    ID    : 'ImageStatus',
                //                Label : '{i18n>customer}'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#Dates',
                    ID    : 'Dates',
                    Label : '{i18n>dates}'
                }
            ],
            Label : '{i18n>details}',
            ID    : 'Details'
        },
    {
        $Type : 'UI.ReferenceFacet',
        Target: 'toOrderItems/@UI.LineItem',
        Label : '{i18n>items}',
        ID    : 'toOrderItems'
    }
    ],

    /*
        FieldGroups
    */
    // Fieldgroup #Customer
    UI.FieldGroup #Customer: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstName,
                Label : '{i18n>firstname}'
            },
            {
                $Type: 'UI.DataField',
                Value: lastName,
                Label : '{i18n>lastname}'
            },
            {
                $Type: 'UI.DataField',
                Value: country_code,
                Label : '{i18n>countrycode}'

            },
            {
                $Type: 'UI.DataField',
                Value: email,
                Label : '{i18n>email}'
            }
        ]
    },

    // Fieldgroup #ImageStatus
    UI.FieldGroup #ImageStatus   : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: imageURL,
            Label: ''
        },
        {
            $Type: 'UI.DataField',
            Value: orderStatus_code,
            Label: ''
        }        
        ]
    },

    // Fieldgroup #Dates
    UI.FieldGroup #Dates   : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: createOn,
            Label : '{i18n>createdon}',
        },
        {
            $Type: 'UI.DataField',
            Value: deliveryDate,
            Label : '{i18n>deliverydate}'
        }        
        ]
    },

// // Fieldgroup for Header Facets
// UI.FieldGroup #HeaderA: {
//     $Type: 'UI.FieldGroupType',
//     Data : [
//         {
//             $Type: 'UI.DataField',
//             Value: firstName
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: lastName,
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: email
//         },
//         {
//             $Type      : 'UI.DataField',
//             Value      : orderStatus_code,
//             Criticality: orderStatus.criticality,
//             Label      : '{i18n>status}'
//         }
//     ]
// },

// UI.FieldGroup #Details: {
//     $Type: 'UI.FieldGroupType',
//     Data : [
//         {
//             $Type: 'UI.DataField',
//             Value: country_code
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: createOn,
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: deliveryDate
//         }
//     ]
// },

// UI.FieldGroup #Status : {
//     $Type: 'UI.FieldGroupType',
//     Data : [{
//         $Type      : 'UI.DataField',
//         Value      : orderStatus_code,
//         Criticality: orderStatus.criticality,
//         Label      : ''
//     }]
// },

);

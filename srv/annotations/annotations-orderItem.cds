using {Sales as service} from '../service';

annotate service.OrderItems with {
    name             @title            : '{i18n>name}'; //@Common.FieldControl: #ReadOnly;
    description      @title            : '{i18n>description}';
    releaseDate      @title            : '{i18n>releasedate}';
    discontinuedDate @title            : '{i18n>discontinueddate}';
    price            @title: '{i18n>price}'     @Measures.ISOCurrency: currency_code; //
    currency         @Common.IsCurrency: true;
    height           @title: '{i18n>height}'    @Measures.Unit       : uomLength;
    width            @title: '{i18n>width}'     @Measures.Unit       : uomLength;
    depth            @title: '{i18n>depth}'     @Measures.Unit       : uomLength;
    uomLength        @Common.IsUnit             @Common.FieldControl : #ReadOnly;
    quantity         @title: '{i18n>quantity}'  @Measures.Unit       : uomQuantity;
    uomQuantity      @Common.IsUnit             @Common.FieldControl : #ReadOnly;
};

annotate service.OrderItems with @(
    /*
        LineItem
    */
    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: '{i18n>nameProd}'
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label: '{i18n>descProd}'
        },
        {
            $Type: 'UI.DataField',
            Value: releaseDate,
            Label: '{i18n>releaseDate}'
        },
        {
            $Type: 'UI.DataField',
            Value: price,
            Label: '{i18n>price}'
        },
        {
            $Type: 'UI.DataField',
            Value: quantity,
            Label: '{i18n>quantity}'
        }
    ],

    /*
        HeaderInfo
    */
    UI.HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>item}',
        TypeNamePlural: '{i18n>items}',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },


    /*
        Facets
    */
    UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ItemDetail',
            Label : '{i18n>itemdetails}',
            ID    : 'ItemDetail'
        },
        {
            $Type : 'UI.CollectionFacet',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#itemDates',
                    ID    : 'ItemDates',
                    Label : '{i18n>itemDates}'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#itemMeasures',
                    ID    : 'ItemMeasures',
                    Label : '{i18n>itemMeasures}'
                }
            ],
            Label : '{i18n>measuresDates}',
            ID    : 'MeasuresDates'
        },

    ],

    /*
        FieldGroups
    */

    // FieldGroup #ItemDetail
    UI.FieldGroup #ItemDetail : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
                Label: '{i18n>nameProd}'
            },
            {
                $Type: 'UI.DataField',
                Value: description,
                Label: '{i18n>descProd}'
            },
            {
                $Type: 'UI.DataField',
                Value: price,
                Label: '{i18n>price}'
            },
            {
                $Type: 'UI.DataField',
                Value: quantity,
                Label: '{i18n>quantity}'
            }
        ]
    },

    // FieldGroup #itemDates
    UI.FieldGroup #itemDates: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: releaseDate,
                Label: '{i18n>releaseDate}'
            },
            {
                $Type: 'UI.DataField',
                Value: discontinuedDate,
                Label: '{i18n>discontinuedDate}'                
            },
        ]
    },

    // FieldGroup #itemMeasures
    UI.FieldGroup #itemMeasures: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: height
            },
            {
                $Type: 'UI.DataField',
                Value: width
            },
            {
                $Type: 'UI.DataField',
                Value: depth
            }
        ]
    },
);

namespace com.sales;

/*
    Aspects
*/
using {
    cuid, // key ID  : UUID;
    managed,
    sap.common.CodeList,
    sap.common.Currencies,
    sap.common.Countries
} from '@sap/cds/common';

/*
    Types
*/
type decimalLenfth : Decimal(15, 3);

/*
    Entities
*/

// ORDER HEAD
entity OrderHead : cuid, managed {
    email        : String(256);
    firstname    : String(30);
    lastname     : String(30);
    country      : Association to Countries;
    createon     : Date;
    deliverydate : Date;
    orderstatus  : Association to OrderStatus; //orderstatus --- orderstatus_code
    imageURL     : LargeBinary  @Core.MediaType: imageType  @UI.IsImage; //Image type in field imageType, field is an Image
    imageType    : String       @Core.IsMediaType;
    toOrderItems : Composition of many OrderItems // 1..n Composicion
                       on toOrderItems.toOrderHead = $self; 
}

// ORDER ITEMS
entity OrderItems : cuid {
    name             : String(40);
    description      : String(40);
    releaseDate      : Date;
    discontinuedDate : Date;
    price            : Decimal(12, 2);
    currency         : Association to Currencies;
    height           : decimalLenfth;
    width            : decimalLenfth;
    depth            : decimalLenfth;
    uomLength        : String default 'CM';
    quantity         : Decimal(16, 2);
    uomQuantity      : String default 'UN';
    toOrderHead      : Association to OrderHead;
};

/*
    Code List
*/

// ORDER STATUS
entity OrderStatus : CodeList {
    key code        : String(20) enum {
            Open = 'Order Open';
            Closed = 'Order Closed';
        };
        criticality : Integer; //Store Criticality of code
};

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
type decimalLength : Decimal(15, 3);

/*
    Entities
*/

// ORDER HEAD
entity OrderHead : cuid, managed {
    email        : String(256) @mandatory;
    firstName    : String(30);
    lastName     : String(30);
    country      : Association to Countries;
    createOn     : Date;
    deliveryDate : Date;
    orderStatus  : Association to OrderStatus; //orderstatus --- orderstatus_code
    imageURL     : LargeBinary  @Core.MediaType: imageType  @UI.IsImage;
    imageType    : String       @Core.IsMediaType;
    toOrderItems : Composition of many OrderItems // 1..n Composicion
                       on toOrderItems.toOrderHead = $self; 
}

// ORDER ITEMS
entity OrderItems : cuid {
    name             : String(40);
    description      : String(140);
    releaseDate      : Date;
    discontinuedDate : Date;
    price            : Decimal(12, 2);
    currency         : Association to Currencies;
    height           : decimalLength;
    width            : decimalLength;
    depth            : decimalLength;
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

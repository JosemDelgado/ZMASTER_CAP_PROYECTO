using {com.sales as entities} from '../db/schema'; //The squema path

service Sales {
    /*
        Entities
    */
    entity OrderHead   as projection on entities.OrderHead;
    entity OrderItems  as projection on entities.OrderItems;
    /*
        Code List
    */
    entity OrderStatus as projection on entities.OrderStatus;
}

sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'orders/test/integration/FirstJourney',
		'orders/test/integration/pages/OrderHeadList',
		'orders/test/integration/pages/OrderHeadObjectPage',
		'orders/test/integration/pages/OrderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderHeadList, OrderHeadObjectPage, OrderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('orders') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderHeadList: OrderHeadList,
					onTheOrderHeadObjectPage: OrderHeadObjectPage,
					onTheOrderItemsObjectPage: OrderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
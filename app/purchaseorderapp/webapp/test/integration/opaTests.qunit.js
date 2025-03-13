sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'anubhav/app/purchaseorderapp/test/integration/FirstJourney',
		'anubhav/app/purchaseorderapp/test/integration/pages/POsList',
		'anubhav/app/purchaseorderapp/test/integration/pages/POsObjectPage',
		'anubhav/app/purchaseorderapp/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('anubhav/app/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
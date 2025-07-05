sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/fiori/app/equipmentmanageadmin/test/integration/FirstJourney',
		'com/fiori/app/equipmentmanageadmin/test/integration/pages/EquipmentsList',
		'com/fiori/app/equipmentmanageadmin/test/integration/pages/EquipmentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, EquipmentsList, EquipmentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/fiori/app/equipmentmanageadmin') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEquipmentsList: EquipmentsList,
					onTheEquipmentsObjectPage: EquipmentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
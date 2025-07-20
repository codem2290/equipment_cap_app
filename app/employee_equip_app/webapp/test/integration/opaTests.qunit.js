sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sap/demo/employeeequipapp/test/integration/FirstJourney',
		'com/sap/demo/employeeequipapp/test/integration/pages/MyTaskList',
		'com/sap/demo/employeeequipapp/test/integration/pages/MyTaskObjectPage'
    ],
    function(JourneyRunner, opaJourney, MyTaskList, MyTaskObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sap/demo/employeeequipapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMyTaskList: MyTaskList,
					onTheMyTaskObjectPage: MyTaskObjectPage
                }
            },
            opaJourney.run
        );
    }
);
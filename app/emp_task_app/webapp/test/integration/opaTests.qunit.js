sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'emptaskapp/test/integration/FirstJourney',
		'emptaskapp/test/integration/pages/MyTaskList',
		'emptaskapp/test/integration/pages/MyTaskObjectPage'
    ],
    function(JourneyRunner, opaJourney, MyTaskList, MyTaskObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('emptaskapp') + '/index.html'
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
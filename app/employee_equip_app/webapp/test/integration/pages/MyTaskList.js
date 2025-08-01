sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.sap.demo.employeeequipapp',
            componentId: 'MyTaskList',
            contextPath: '/MyTask'
        },
        CustomPageDefinitions
    );
});
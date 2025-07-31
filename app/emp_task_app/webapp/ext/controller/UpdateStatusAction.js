sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        onUpdateOrderStatus: async function (oEvent) {
            //var oComment = sap.ui.getCore().byId('commentBox');
            var sAction = "setTaskStatusComplete";
            var oParameters = {
                model: this.getModel(),
                parameterValues: [{
                    "name": "taskID",
                    "value": "29a4f140-58a1-4a13-8dad-e0286dff6a8f"
                }, {
                    "name": "comment",
                    "value": "Test"
                }],
                skipParameterDialog: true
            };

            var data = await this.getEditFlow().invokeAction(sAction, oParameters);
            console.log(data);


        }
    };
});

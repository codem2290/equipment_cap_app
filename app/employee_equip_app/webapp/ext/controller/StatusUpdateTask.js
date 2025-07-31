sap.ui.define([
    "sap/m/MessageToast",
    "sap/ui/core/Fragment"
], function(MessageToast, Fragment) {
    'use strict';

    return {
        updateTaskStatus: function(oEvent) {
            //MessageToast.show("Custom handler invoked.");
            if(!this._oDialog) {
                Fragment.load({
                    name: "com.sap.demo.employeeequipapp.ext.fragments.updateComment",
                    controller: this._controller
                }).then(function(oDialog){
                    this._oDialog = oDialog;
                    this._oDialog.open();
                }.bind(this));
            } else {
                this._oDialog.open();
            }
        },
        onCloseDialog: function(){
            this.getParent().close()
        },
        onSubmitStatus: async function(oEvent){
            var oComment = sap.ui.getCore().byId('commentBox');
            var sAction = "setTaskStatusComplete";
            var oContext = this.getView().getBindingContext().getObject();
            var oParameters = {
                model: this.getModel(),
                parameterValues: [{
                    "name": "taskID",
                    "value": oContext.ID
                },{
                    "name": "comment",
                    "value": oComment.getValue()
                }],
                skipParameterDialog: true
            };

            this.editFlow.invokeAction(sAction, oParameters).then(function(oresponse){
                //MessageToast.show("Status updated successfully!");
                this.getExtensionAPI().refresh();
                this._oDialog.close();
            }.bind(this));
            

        }
    };
});

const cds = require('@sap/cds');

class EmployeeEquipmentService extends cds.ApplicationService {
    async init() {
        const { Equipments, MyTask, CustomerSet } = this.entities;
        const s4Server = await cds.connect.to("CustomerS4API");

        this.on("READ", CustomerSet, async (req) => {
            return s4Server.run(req.query);
        });
               
        this.on('setTaskStatusComplete', async (req) => {
            let requestData = req.data;
            const taskID = requestData.taskID;

            let oPayload = {
                comment: requestData.comment,
                status_code: 'OPEN'
            };

            let data = await UPDATE(MyTask, taskID).with(oPayload);
            if(!data){
                req.reject(400, 'Failed to update status');
            }

            req.info(200, "Status updated successfully!");

        });
        return super.init();
    }
}

module.exports = EmployeeEquipmentService;
const cds = require('@sap/cds');

class AdminEquipmentService extends cds.ApplicationService {
    init() {
        const { Equipments, Tasks } = this.entities;
        this.before('UPDATE', Equipments.drafts, (req) => {
            debugger;

            if(req.data.status_code === 'INACT'){
                req.reject(400, "You are not Authorized to make this change!");
            }
        });

        this.before('CREATE', Tasks.drafts, (req) => {
            if(req) {
                req.data.dueDate = new Date();
                req.data.priority_code = "MED";
                req.data.status_code = "OPEN";
                return req;
            }
        })

        

        return super.init();
    }
}

module.exports = AdminEquipmentService;
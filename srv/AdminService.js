const cds = require('@sap/cds');

class AdminEquipmentService extends cds.ApplicationService {
    init() {
        const { Equipments, Tasks, Employees } = this.entities;
        this.before('UPDATE', Equipments.drafts, (req) => {
            debugger;

            if(req.data.status_code === 'INACT'){
                req.reject(400, "You are not Authorized to make this change!");
            }
        });

        this.before('UPDATE', Tasks.drafts, async (req) => {
            const empID = req.data.assignedTo_ID;
            let employeeData = await SELECT.one.from(Employees).where({
                ID: empID
            });

            if(employeeData){
                req.data.empName = employeeData.name;
                req.data.empUser = employeeData.username
                req.data.email  = employeeData.email;
            }

           
        });

        this.before('CREATE', Tasks.drafts, (req) => {
            if(req) {
                req.data.dueDate = new Date();
                req.data.priority_code = "MED";
                req.data.status_code = "OPEN";
                //return req;
            }
        })

        

        return super.init();
    }
}

module.exports = AdminEquipmentService;
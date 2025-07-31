using {equipment.com.app as EmpModel} from '../db/data-model';
using {CustomerS4API as externalAPI} from './external/CustomerS4API';

service EmployeeEquipmentService {


    

    @odata.draft.enabled
    entity MyTask as projection on EmpModel.Tasks;

    entity IssueStatus as projection on EmpModel.IssueStatus;

    entity MyIssues as projection on EmpModel.Issues;

    entity Equipments as projection on EmpModel.Equipments;
     
    entity CustomerSet as projection on externalAPI.CustomerSet;

    action setTaskStatusComplete(taskID: String, comment: String) returns String;

}

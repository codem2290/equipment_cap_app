using {equipment.com.app as EmpModel} from '../db/data-model';

service EmployeeEquipmentService {

    entity MyTask as projection on EmpModel.Tasks;

    entity IssueStatus as projection on EmpModel.IssueStatus;

    entity MyIssues as projection on EmpModel.Issues;

    entity Equipments as projection on EmpModel.Equipments;

}

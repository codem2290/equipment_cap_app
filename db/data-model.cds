namespace equipment.com.app;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Equipments : cuid, managed {
    name         : String @title: '{i18n>name}';
    type         : Association to EquipmentTypes;
    location     : Association to Locations;
    manufacturer : String @title: '{i18n>manufact}';
    status       : Association to EquipmentStatus;
    tasks        : Composition of many Tasks
                       on tasks.equipment = $self;
    issues       : Composition of many Issues
                       on issues.equipment = $self;
}

entity Tasks : cuid, managed {
    description : String(255);
    dueDate     : Date;
    priority    : Association to TaskPriority;
    status      : Association to TaskStatus;
    equipment   : Association to Equipments;
    assignedTo  : Association to Employees;
    issues      : Composition of many Issues
                      on issues.task = $self;
}

entity Issues : cuid, managed {
    description : String(255);
    status      : Association to IssueStatus;
    equipment   : Association to Equipments;
    reportedBy  : Association to Employees;
    task        : Association to Tasks;
}

entity IssueStatus {
    key code : String(10);
        name : String(50);
}

entity TaskStatus {
    key code : String(10);
        name : String(50);
}

entity TaskPriority {
    key code : String(10);
        name : String(50);
}

entity EquipmentTypes {
    key code         : String(10);
        name         : localized String(100) @title: '{i18n>nameType}';
        manufacturer : localized String;
}

entity Locations {
    key code : String(10);
        name : String(50) @title: '{i18n>location}';
}

entity EquipmentStatus {
    key code      : String(10);
        name      : String(50) @title: '{i18n>equipStatus}';
        colorCode : Integer;
}

entity Employees : cuid, managed {
    name     : String(100);
    username : String(50);
    email    : String(100);
    role     : Association to Roles;
}

entity Roles {
    key code : String(5);
        type : String(30);
}

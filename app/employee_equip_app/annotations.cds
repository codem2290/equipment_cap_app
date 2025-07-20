using EmployeeEquipmentService as service from '../../srv/EmployeeService';
annotate service.MyTask with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : 'Due Date',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : issues.status.name,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo_ID,
            Label : 'Assigned To',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Details',
            ID : 'EquipmentDetails',
            Target : '@UI.FieldGroup#EquipmentDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issues',
            ID : 'Issues',
            Target : 'issues/@UI.LineItem#Issues',
        },
    ],
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : equipment.name,
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.manufacturer,
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.location_code,
                Label : 'location',
            },
            {
                $Type : 'UI.DataField',
                Value : dueDate,
                Label : 'Due Date',
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'Description',
            },
        ],
    },
);

annotate service.MyTask with {
    description @UI.MultiLineText : true
};

annotate service.MyIssues with @(
    UI.LineItem #Issues : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ]
);


using AdminEquipmentService as service from '../../srv/AdminService';
using from '../../db/data-model';

annotate service.Equipments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : manufacturer,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : type_code,
            Label : 'type_code',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'status_code',
        },
        {
            $Type : 'UI.DataField',
            Value : location_code,
            Label : 'location_code',
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
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
            Label : 'Task Details',
            ID : 'TaskDetails',
            Target : 'tasks/@UI.LineItem#TaskDetails',
        },
    ],
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : location_code,
                Label : 'location_code',
            },
            {
                $Type : 'UI.DataField',
                Value : manufacturer,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'status_code',
            },
            {
                $Type : 'UI.DataField',
                Value : type_code,
                Label : 'type_code',
            },
        ],
    },
);

annotate service.Tasks with @(
    UI.LineItem #TaskDetails : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : 'Equipment ID',
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
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo_ID,
            Label : 'Assigned to',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Task Create Form',
            ID : 'TaskCreateForm',
            Target : '@UI.FieldGroup#TaskCreateForm',
        },
    ],
    UI.FieldGroup #TaskCreateForm : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : equipment_ID,
                Label : 'Equipment ID',
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
            {
                $Type : 'UI.DataField',
                Value : comment,
                Label : 'Comment',
            },
            {
                $Type : 'UI.DataField',
                Value : assignedTo_ID,
                Label : 'Assigned To',
            },
            {
                $Type : 'UI.DataField',
                Value : priority_code,
                Label : 'Priority',
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Value : empName,
                Label : 'Assigned Employee Name',
            },
            {
                $Type : 'UI.DataField',
                Value : empUser,
                Label : 'Assigned Employee User',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'Assigned Employee Email',
            },
        ],
    },
);

// annotate service.Tasks with {
//     priority @(
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'TaskPriority',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : priority_code,
//                     ValueListProperty : 'code',
//                 },
//             ],
//         },
//         Common.ValueListWithFixedValues : true,
// )};

// annotate service.TaskPriority with {
//     code @Common.Text : name
// };

// annotate service.Tasks with {
//     status @(
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'TaskStatus',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : status_code,
//                     ValueListProperty : 'code',
//                 },
//             ],
//         },
//         Common.ValueListWithFixedValues : true,
// )};

// annotate service.TaskStatus with {
//     code @Common.Text : name
// };

// annotate service.Tasks with {
//     assignedTo @(
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'Employees',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : assignedTo_ID,
//                     ValueListProperty : 'ID',
//                 },
//             ],
//         },
//         Common.ValueListWithFixedValues : true,
// )};

// annotate service.Employees with {
//     ID @Common.Text : email
// };

// annotate service.Tasks with {
//     equipment @Common.FieldControl : #ReadOnly
// };

annotate service.Tasks with {
    assignedTo @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Employees',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : assignedTo_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Employees with {
    ID @Common.Text : name
};

annotate service.Tasks with @(Common.SideEffects: {
    SourceProperties : [
        'assignedTo_ID'
    ],
    TargetProperties: [
      'empName', 'empUser', 'email'
    ]
});


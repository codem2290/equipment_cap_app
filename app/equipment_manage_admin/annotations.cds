using AdminEquipmentService as service from '../../srv/AdminService';
using from '../../db/data-model';



// annotate service.Equipments @(UI.LineItem: [
//     {
//         $Type: 'UI.DataField',
//         Value: ID,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: name,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: type.name,
//         Label : 'Equipment Type',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: manufacturer
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: location.name
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: status.name,
//         Criticality : status.colorCode,
//         CriticalityRepresentation : #WithIcon,
//     },
//     {
//         $Type : 'UI.DataField',
//         Value : createdBy,
//     },
// ],
//     UI.SelectionFields : [
//         status_code
//     ],)
annotate service.Equipments with @(
    UI.HeaderInfo: {
        TypeNamePlural : 'Equipment',
        TypeName : '',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    },
    UI.SelectionFields : [
        status_code,
        type_code,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : manufacturer,
        },
        {
            $Type : 'UI.DataField',
            Value : type.name,
        },
        {
            $Type : 'UI.DataField',
            Value : status.name,
            Criticality : status.colorCode,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : location.name,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
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
            Label : 'Task Assigned to Employee',
            ID : 'TaskAssignedtoEmployee',
            Target : 'tasks/@UI.LineItem#TaskAssignedtoEmployee',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Reported Issues',
            ID : 'ReportedIssues',
            Target : 'issues/@UI.LineItem#ReportedIssues',
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
                Value : manufacturer,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : status.name,
            },
            {
                $Type : 'UI.DataField',
                Value : location.name,
            },
            {
                $Type : 'UI.DataField',
                Value : type.name,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            ID : 'Details',
            Target : '@UI.FieldGroup#Details',
        },
    ],
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : manufacturer,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
        ],
    },
);

annotate service.Equipments with {
    status @(
        Common.Label : '{i18n>Status}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.EquipmentStatus with {
    code @Common.Text : name
};

annotate service.Equipments with {
    type @(
        Common.Label : '{i18n>nameType}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : type_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.EquipmentTypes with {
    code @Common.Text : name
};

annotate service.Tasks with @(
    UI.LineItem #TaskAssignedtoEmployee : [
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
    ]
);

annotate service.Issues with @(
    UI.LineItem #ReportedIssues : [
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
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : reportedBy_ID,
            Label : 'Reported By',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ]
);


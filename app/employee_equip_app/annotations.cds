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
            Value : equipment.name,
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo_ID,
            Label : 'Assigned To',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
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
    UI.DeleteHidden : true,
    UI.CreateHidden: true,
    UI.DataPoint #status_code : {
        $Type : 'UI.DataPointType',
        Value : status_code,
        Title : 'status_code',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'status_code',
            Target : '@UI.DataPoint#status_code1',
        },
    ],
    UI.DataPoint #status_code1 : {
        $Type : 'UI.DataPointType',
        Value : status_code,
        Title : 'Status',
    },
);

annotate service.MyTask with {
    description @(
        UI.MultiLineText : true,
        Common.FieldControl : #ReadOnly,
    )
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

annotate service.Equipments with {
    name @Common.FieldControl : #ReadOnly
};

annotate service.Equipments with {
    manufacturer @Common.FieldControl : #ReadOnly
};

annotate service.Equipments with {
    location @Common.FieldControl : #ReadOnly
};

annotate service.MyTask with {
    dueDate @Common.FieldControl : #ReadOnly
};


// annotate service.MyTask with @(
//     UI.CreateHidden: true,
//     UI.DeleteHidden: true
// )

annotate service.MyIssues with {
    status @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IssueStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.IssueStatus with {
    code @Common.Text : name
};


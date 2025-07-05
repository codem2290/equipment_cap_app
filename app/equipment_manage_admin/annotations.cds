using AdminEquipmentService as service from '../../srv/AdminService';


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


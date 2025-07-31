using EmployeeEquipmentService as service from '../../srv/EmployeeService';
annotate service.MyTask with {
    equipment @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Equipments',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : equipment_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'type_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'location_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'manufacturer',
            },
        ],
    }
};


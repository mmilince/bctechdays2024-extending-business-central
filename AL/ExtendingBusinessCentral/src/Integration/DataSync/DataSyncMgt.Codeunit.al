codeunit 65105 "Data Sync Mgt"
{
    //coupling
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var Handled: Boolean)
    begin
        if BCTableNo = Database::Vehicle then begin
            CDSTableNo := Database::"CDS cr64c_RM_Vehicle";
            Handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', false, false)]
    local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
    begin
        if CRMTableID = Database::"CDS cr64c_RM_Vehicle" then
            Handled := LookupVehicle(SavedCRMId, CRMId, IntTableFilter);
    end;

    local procedure LookupVehicle(SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text): Boolean
    var
        Vehicle: Record "CDS cr64c_RM_Vehicle";
        OriginalVehicle: Record "CDS cr64c_RM_Vehicle";
        DataverseVehicles: Page "RM Vehicles";
    begin
        if not IsNullGuid(CRMId) then begin
            if Vehicle.Get(CRMId) then
                DataverseVehicles.SetRecord(Vehicle);
            if not IsNullGuid(SavedCRMId) then
                if OriginalVehicle.Get(SavedCRMId) then
                    DataverseVehicles.SetCurrentlyCoupledDataverseWorker(OriginalVehicle);
        end;

        Vehicle.SetView(IntTableFilter);
        DataverseVehicles.SetTableView(Vehicle);
        DataverseVehicles.LookupMode(true);
        if DataverseVehicles.RunModal = ACTION::LookupOK then begin
            DataverseVehicles.GetRecord(Vehicle);
            CRMId := Vehicle.cr64c_RM_VehicleId;
            exit(true);
        end;
        exit(false);
    end;

    //enabling deep linking between couple Vehicle record with a dataverse Vehicle records
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnAddEntityTableMapping', '', false, false)]
    local procedure HandleOnAddEntityTableMapping(var TempNameValueBuffer: Record "Name/Value Buffer" temporary);
    var
        CRMSetupDefaults: Codeunit "CRM Setup Defaults";
    begin
        CRMSetupDefaults.AddEntityTableMapping('vehicle', Database::Vehicle, TempNameValueBuffer);
        CRMSetupDefaults.AddEntityTableMapping('vehicle', Database::"CDS cr64c_RM_Vehicle", TempNameValueBuffer);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnBeforeResetConfiguration', '', false, false)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        DataverseVehicle: Record "CDS cr64c_RM_Vehicle";
        Vehicle: Record Vehicle;
    begin
        InsertIntegrationTableMapping(
            IntegrationTableMapping, 'VEHICLE-RMVEHICLE',
            Database::Vehicle, Database::"CDS cr64c_RM_Vehicle",
            DataverseVehicle.FieldNo(cr64c_RM_VehicleId), DataverseVehicle.FieldNo(ModifiedOn),
            '', '', true);

        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo(Make), DataverseVehicle.FieldNo(cr64c_Make), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo(Model), DataverseVehicle.FieldNo(cr64c_Model), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo(Type), DataverseVehicle.FieldNo(cr64c_Type), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo("Manufacturing Year"), DataverseVehicle.FieldNo(cr64c_ManufacturingYear), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo(Mileage), DataverseVehicle.FieldNo(cr64c_Mileage), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo("Fuel Type"), DataverseVehicle.FieldNo(cr64c_FuelType), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo("License Plate"), DataverseVehicle.FieldNo(cr64c_LicensePlate), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('VEHICLE-RMVEHICLE', Vehicle.FieldNo(Loaned), DataverseVehicle.FieldNo(cr64c_Loaned), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;

    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::Bidirectional, 'Dataverse');
    end;

    local procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;
}
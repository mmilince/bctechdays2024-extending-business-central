page 65110 "RM Vehicles"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CDS cr64c_RM_Vehicle";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(cr64c_Make; Rec.cr64c_Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(cr64c_Model; Rec.cr64c_Model)
                {
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field(cr64c_Type; Rec.cr64c_Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(cr64c_ManufacturingYear; Rec.cr64c_ManufacturingYear)
                {
                    ToolTip = 'Specifies the value of the ManufacturingYear field.';
                }
                field(cr64c_FuelType; Rec.cr64c_FuelType)
                {
                    ToolTip = 'Specifies the value of the FuelType field.';
                }
                field(cr64c_Mileage; Rec.cr64c_Mileage)
                {
                    ToolTip = 'Specifies the value of the Mileage field.';
                }
                field(cr64c_LicensePlate; Rec.cr64c_LicensePlate)
                {
                    ToolTip = 'Specifies the value of the LicensePlate field.';
                }
                field(cr64c_Loaned; Rec.cr64c_Loaned)
                {
                    ToolTip = 'Specifies the value of the Loaned field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CreateFromDataverse)
            {
                ApplicationArea = All;
                Caption = 'Create in Business Central';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate the table from the coupled Microsoft Dataverse worker.';

                trigger OnAction()
                var
                    Vehicle: Record "CDS cr64c_RM_Vehicle";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(Vehicle);
                    CRMIntegrationManagement.CreateNewRecordsFromCRM(Vehicle);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;

    procedure SetCurrentlyCoupledDataverseWorker(Vehicle: Record "CDS cr64c_RM_Vehicle")
    begin
        CurrentlyCoupledVehicle := Vehicle;
    end;

    var
        CurrentlyCoupledVehicle: Record "CDS cr64c_RM_Vehicle";
}
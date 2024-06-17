page 65108 "APIV2 - Loan Order Lines"
{
    APIGroup = 'community';
    APIPublisher = 'bctechdays';
    APIVersion = 'v2.0';
    EntityCaption = 'Loan Order Line';
    EntitySetCaption = 'Loan Order Lines';
    DelayedInsert = true;
    EntityName = 'loanOrderLine';
    EntitySetName = 'loanOrderLines';
    PageType = API;
    ODataKeyFields = SystemId;
    SourceTable = "Loan Line";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(documentId; Rec.DocumentId)
                {
                    Caption = 'DocumentId';
                    Editable = false;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No';
                    Editable = false;
                }
                field(vehicleNo; Rec."Vehicle No.")
                {
                    Caption = 'Vehicle No';
                }
                field(vehicleName; Rec."Vehicle Name")
                {
                    Caption = 'Vehicle Name';
                    Editable = false;
                }
                field(startMileage; Rec."Start Mileage")
                {
                    Caption = 'Start Mileage';
                }
                field(endMileage; Rec."End Mileage")
                {
                    Caption = 'End Mileage';
                }
            }
        }
    }
}
page 65107 "Returned Loan Lines"
{
    PageType = ListPart;
    SourceTable = "Returned Loan Line";
    Caption = 'Lines';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vehicle No.';
                }
                field("Vehicle Name"; Rec."Vehicle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vehicle Name';
                }
                field("Start Mileage"; Rec."Start Mileage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Start Mileage';
                }
                field("End Mileage"; Rec."End Mileage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies End Mileage';
                }
            }
        }
    }
}
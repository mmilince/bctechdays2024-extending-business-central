page 65104 "Loan Lines"
{
    PageType = ListPart;
    SourceTable = "Loan Line";
    Caption = 'Lines';

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
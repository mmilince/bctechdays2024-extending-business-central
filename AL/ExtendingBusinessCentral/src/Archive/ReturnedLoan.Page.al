page 65106 "Returned Loan"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Returned Loan Header";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies No.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies No.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies No.';
                }
                field("Contact E-Mail"; Rec."Contact E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies No.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies No.';
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Loan Start Date';
                    Editable = Rec.Status = Rec.Status::Open;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Loan End Date';
                }
            }
            part(ReturnedLoanLines; "Returned Loan Lines")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
}
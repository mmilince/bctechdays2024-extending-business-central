page 65103 "Loan Order"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Loan Header";

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
            part(LoanLines; "Loan Lines")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Loan)
            {
                Caption = 'Loan';
                Image = ReleaseDoc;

                trigger OnAction()
                var
                    LoanMgt: Codeunit "Loan Mgt.";
                begin
                    LoanMgt.Loan(Rec);
                end;

            }

            action(Reopen)
            {
                Caption = 'Reopen';
                Image = ReOpen;
                Enabled = Rec.Status <> Rec.Status::Open;

                trigger OnAction()
                var
                    LoanMgt: Codeunit "Loan Mgt.";
                begin
                    LoanMgt.Reopen(Rec);
                end;
            }

            action(Return)
            {
                Caption = 'Return';
                Image = Post;
                Enabled = Rec.Status = Rec.Status::Loaned;

                trigger OnAction()
                var
                    LoanReturn: Codeunit "Loan Return";
                begin
                    LoanReturn.Return(Rec);
                end;
            }
        }
    }
}
page 65102 "Loan Orders"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loan Header";
    CardPageId = "Loan Order";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies No.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Contact No.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Contact Name';
                }
                field("Contact E-Mail"; Rec."Contact E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies E-Mail';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Status';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Start Date.';
                    Editable = Rec.Status = Rec.Status::Open;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies End Date.';
                }
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
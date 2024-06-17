page 65109 "APIV2 - Loan Orders"
{
    APIGroup = 'community';
    APIPublisher = 'bctechdays';
    APIVersion = 'v2.0';
    EntityCaption = 'Loan Order';
    EntitySetCaption = 'Loan Orders';
    DelayedInsert = true;
    EntityName = 'loanOrder';
    EntitySetName = 'loanOrders';
    PageType = API;
    ODataKeyFields = SystemId;
    SourceTable = "Loan Header";

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
                field(no; Rec."No.")
                {
                    Caption = 'No';
                    Editable = false;
                }
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No';
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                    Editable = false;
                }
                field(contactEMail; Rec."Contact E-Mail")
                {
                    Caption = 'Contact E-Mail';
                    Editable = false;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(startDate; Rec."Start Date")
                {
                    Caption = 'Start Date.';
                }
                field(endDate; Rec."End Date")
                {
                    Caption = 'End Date.';
                }
                part(loanOrderLines; "APIV2 - Loan Order Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'loanOrderLine';
                    EntitySetName = 'loanOrderLines';
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
    }

    [ServiceEnabled]
    procedure Return()
    var
        LoanReturn: Codeunit "Loan Return";
    begin
        LoanReturn.Return(Rec);
    end;
}
page 65112 "APIV2 - Loan Header"
{
    APIGroup = 'community';
    APIPublisher = 'bctechdays';
    APIVersion = 'v2.0';
    EntityCaption = 'Loan Header';
    EntitySetCaption = 'Loan Headers';
    DelayedInsert = true;
    EntityName = 'loanHeader';
    EntitySetName = 'loanHeaders';
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
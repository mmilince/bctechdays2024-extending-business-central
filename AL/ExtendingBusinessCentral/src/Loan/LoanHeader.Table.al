table 65101 "Loan Header"
{
    DataClassification = CustomerContent;
    Caption = 'Loan Header';
    LookupPageId = "Loan Orders";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                Contact.Get(Rec."Contact No.");

                Rec."Contact Name" := Contact.Name;
                Rec."Contact E-Mail" := Contact."E-Mail";
            end;
        }
        field(3; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            TableRelation = Contact.Name;
            Editable = false;
        }
        field(4; "Contact E-Mail"; Text[80])
        {
            Caption = 'Contact E-Mail';
            TableRelation = Contact."E-Mail";
            Editable = false;
        }
        field(5; "Status"; Enum "Loan Status")
        {
            Caption = 'Loan Status';
            Editable = false;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Loan Start Date';

            trigger OnValidate()
            var
                IncorrectDateErr: Label 'End Date cannot be before Start Date.';
            begin
                if Rec."End Date" = 0D then
                    exit;

                if Rec."End Date" < Rec."Start Date" then
                    Error(IncorrectDateErr);
            end;
        }
        field(7; "End Date"; Date)
        {
            Caption = 'Loan End Date';

            trigger OnValidate()
            var
                IncorrectDateErr: Label 'End Date cannot be before Start Date.';
            begin
                if Rec."End Date" < Rec."Start Date" then
                    Error(IncorrectDateErr);
            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}
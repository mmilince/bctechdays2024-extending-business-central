table 65103 "Returned Loan Header"
{
    DataClassification = CustomerContent;
    Caption = 'Loan Header';
    LookupPageId = "Returned Loans";

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
        }
        field(3; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            TableRelation = Contact.Name;
        }
        field(4; "Contact E-Mail"; Text[80])
        {
            Caption = 'Contact E-Mail';
            TableRelation = Contact."E-Mail";
        }
        field(5; "Status"; Enum "Loan Status")
        {
            Caption = 'Loan Status';
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Loan Start Date';
        }
        field(7; "End Date"; Date)
        {
            Caption = 'Loan End Date';
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
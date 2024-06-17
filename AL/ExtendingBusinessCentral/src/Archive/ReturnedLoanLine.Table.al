table 65104 "Returned Loan Line"
{
    DataClassification = CustomerContent;
    Caption = 'Loan Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Loan Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = Vehicle;
        }
        field(4; "Vehicle Name"; Text[250])
        {
            Caption = 'Vehicle Name';
        }
        field(5; "Start Mileage"; Integer)
        {
            Caption = 'Start Mileage in km';
        }
        field(6; "End Mileage"; Integer)
        {
            Caption = 'End Mileage';
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }
}
table 65100 Vehicle
{
    DataClassification = CustomerContent;
    DrillDownPageID = "Vehicle List";
    LookupPageId = "Vehicle Card";
    Caption = 'Vehicle';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Type"; Enum "Vehicle Type")
        {
            Caption = 'Type';
        }
        field(3; "Make"; Text[100])
        {
            Caption = 'Make';
        }
        field(4; "Model"; Text[100])
        {
            Caption = 'Model';
        }
        field(5; "Manufacturing Year"; Integer)
        {
            Caption = 'Manufacturing Year';
            MinValue = 1990;

            trigger OnValidate()
            var
                FutureYearErr: Label 'Cannot set year in future.';
            begin
                if Date2DMY(Today, 3) < Rec."Manufacturing Year" then
                    Error(FutureYearErr);
            end;
        }
        field(6; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
        }
        field(7; "Mileage"; Integer)
        {
            Caption = 'Mileage in km';
        }
        field(8; "License Plate"; Code[20])
        {
            Caption = 'License Plate';
        }
        field(9; "Loaned"; Boolean)
        {
            Caption = 'Loaned';
            Editable = false;
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
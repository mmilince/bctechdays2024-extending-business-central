table 65102 "Loan Line"
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

            trigger OnValidate()
            var
                Vehicle: Record Vehicle;
            begin
                Vehicle.Get(Rec."Vehicle No.");
                Rec."Start Mileage" := Vehicle.Mileage;
                Rec."Vehicle Name" := Vehicle.Make + ' ' + Vehicle.Model;
            end;
        }
        field(4; "Vehicle Name"; Text[250])
        {
            Caption = 'Vehicle Name';
            Editable = false;
        }
        field(5; "Start Mileage"; Integer)
        {
            Caption = 'Start Mileage in km';
            Editable = false;
        }
        field(6; "End Mileage"; Integer)
        {
            Caption = 'End Mileage';

            trigger OnValidate()
            var
                IncorrectEndMileageErr: Label 'End Mileage cannot be less then the Start Mileage.';
            begin
                if "End Mileage" <= "Start Mileage" then
                    Error(IncorrectEndMileageErr);
            end;
        }
        field(7; "DocumentId"; Guid)
        {
            Caption = 'DocumentId';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        LoanHeader: Record "Loan Header";
        LoanMgt: Codeunit "Loan Mgt.";
    begin
        if LoanHeader.Get(Rec."Document No.") then
            Rec.DocumentId := LoanHeader.SystemId;

        if Rec."Line No." = 0 then
            Rec."Line No." := LoanMgt.GetNewLineNo(Rec."Document No.");
    end;
}
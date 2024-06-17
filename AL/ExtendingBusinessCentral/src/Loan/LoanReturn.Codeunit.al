codeunit 65102 "Loan Return"
{
    procedure Return(LoanHeader: Record "Loan Header")
    begin
        CheckIfEligible(LoanHeader);

        CreateReturnedRecord(LoanHeader);

        DeleteLoanRecord(LoanHeader);
    end;

    local procedure CheckIfEligible(LoanHeader: Record "Loan Header")
    var
        NotLoanedVehicleErr: Label 'In order to return the vehicle, status must be Loaned.';
        LoanLine: Record "Loan Line";
    begin
        if LoanHeader.Status <> LoanHeader.Status::Loaned then
            Error(NotLoanedVehicleErr);

        LoanHeader.TestField("End Date");

        LoanLine.SetRange("Document No.", LoanHeader."No.");
        LoanLine.FindSet();

        repeat
            LoanLine.TestField("End Mileage");
        until LoanLine.Next() = 0;
    end;

    local procedure CreateReturnedRecord(LoanHeader: Record "Loan Header")
    var
        ReturnedLoanHeader: Record "Returned Loan Header";
        ReturnedLoanLine: Record "Returned Loan Line";
        LoanLine: Record "Loan Line";
        LoanMgt: Codeunit "Loan Mgt.";
        LoanEvents: Codeunit "Loan Events";
    begin
        ReturnedLoanHeader.TransferFields(LoanHeader);
        ReturnedLoanHeader.Status := ReturnedLoanHeader.Status::Returned;
        ReturnedLoanHeader."End Date" := Today();
        ReturnedLoanHeader.Insert();

        LoanLine.SetRange("Document No.", LoanHeader."No.");
        LoanLine.FindSet();

        repeat
            LoanMgt.ChangeVehicleStatusToFree(LoanLine."Vehicle No.");

            ReturnedLoanLine.TransferFields(LoanLine);
            ReturnedLoanLine.Insert();

            LoanEvents.OnAfterReturnedLoanLineCreated(LoanLine);
        until LoanLine.Next() = 0;
    end;

    local procedure DeleteLoanRecord(LoanHeader: Record "Loan Header")
    var
        LoanLine: Record "Loan Line";
    begin
        LoanHeader.Delete();

        LoanLine.SetRange("Document No.", LoanHeader."No.");
        LoanLine.DeleteAll();
    end;
}
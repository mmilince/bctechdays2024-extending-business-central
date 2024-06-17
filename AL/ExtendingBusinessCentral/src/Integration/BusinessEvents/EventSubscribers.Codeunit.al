codeunit 65104 "Event Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Loan Events", 'OnAfterReturnedLoanLineCreated', '', false, false)]
    local procedure OnAfterReturnVehicle(LoanLine: Record "Loan Line")
    var
        LoansBusinessEvents: Codeunit "Loans Business Events";
        LoanHeader: Record "Loan Header";
    begin
        LoanHeader.Get(LoanLine."Document No.");

        LoansBusinessEvents.VehicleReturned(LoanHeader."No.",
                                            LoanHeader."Contact No.",
                                            LoanHeader."Contact Name",
                                            LoanHeader."Contact E-Mail",
                                            LoanLine."Vehicle No.",
                                            LoanLine."Vehicle Name",
                                            LoanLine.DocumentId);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Loan Events", 'OnAfterLoanVehicle', '', false, false)]
    local procedure OnAfterLoanVehicle(LoanLine: Record "Loan Line")
    var
        LoansBusinessEvents: Codeunit "Loans Business Events";
        LoanHeader: Record "Loan Header";
    begin
        LoanHeader.Get(LoanLine."Document No.");

        LoansBusinessEvents.VehicleLoaned(LoanHeader."No.",
                                          LoanHeader."Contact No.",
                                          LoanHeader."Contact Name",
                                          LoanHeader."Contact E-Mail",
                                          LoanLine."Vehicle No.",
                                          LoanLine."Vehicle Name",
                                          LoanLine.DocumentId);
    end;
}
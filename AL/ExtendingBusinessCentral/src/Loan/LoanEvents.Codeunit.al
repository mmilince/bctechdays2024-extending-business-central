codeunit 65101 "Loan Events"
{
    [IntegrationEvent(false, false)]
    internal procedure OnAfterLoanVehicle(LoanLine: Record "Loan Line");
    begin
    end;

    [IntegrationEvent(false, false)]
    internal procedure OnAfterReturnedLoanLineCreated(LoanLine: Record "Loan Line");
    begin
    end;
}
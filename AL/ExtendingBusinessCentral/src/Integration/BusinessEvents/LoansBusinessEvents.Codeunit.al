codeunit 65103 "Loans Business Events"
{
    [ExternalBusinessEvent('VehicleReturned', 'Vehicle Returned', 'This business event is triggered when a loaned vehicle is returned.', Enum::EventCategory::"Loans", '1.0')]
    internal procedure VehicleReturned(DocumentNo: Code[20];
                                       ContactNo: Code[20];
                                       ContactName: Text[100];
                                       ContactEMail: Text[80];
                                       VehicleNo: Code[20];
                                       VehicleName: Text[250];
                                       Documentid: Guid)
    begin
    end;

    [ExternalBusinessEvent('VehicleLoaned', 'Vehicle Loaned', 'This business event is triggered when a vehicle is loaned.', Enum::EventCategory::"Loans", '1.0')]
    internal procedure VehicleLoaned(DocumentNo: Code[20];
                                     ContactNo: Code[20];
                                     ContactName: Text[100];
                                     ContactEMail: Text[80];
                                     VehicleNo: Code[20];
                                     VehicleName: Text[250];
                                     DocumentId: Guid)
    begin
    end;
}
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite View FlightWithBooking'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119H_FlightWithBookings as select from ZI_119H_Flight as Flight association[*] to  ZI_119H_Booking as _Booking on 
 _Booking.CarrierId = Flight.CarrierId and _Booking.ConnectionId = Flight.ConnectionId and _Booking.FlightDate = Flight.FlightDate {
 
 key Flight.CarrierId as CarrierId,
 key Flight.ConnectionId as ConnectionId,
 key Flight.FlightDate as FlightDate,
 Flight.PlaneTypeId as PlaneTypeId,
 Flight.MaximumSeats as MaximumSeats,
 Flight.OccupiedSeats as OccupiedSeats,
 Flight.MaximumSeats - Flight.OccupiedSeats as FreeSeats,
  _Booking
}
where Flight.FlightDate >= '20210101'

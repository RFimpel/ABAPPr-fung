@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View BookingExtended'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
    }

@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_119H_BookingExtended
  as select from ZI_119H_FlightWithBookings
{

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key _Booking.TravelId     as TravelId,
  key _Booking.BookingId    as BookingId,
      _Booking.BookingDate  as BookingDate,
      _Booking.CustomerId   as CustomerId,
      _Booking.CarrierId    as CarrierId,
      _Booking.ConnectionId as ConnectionId,
      _Booking.FlightDate   as FlightDate,
      _Booking.FlightPrice  as FlightPrice,
      _Booking.CurrencyCode as CurrencyCode,
      PlaneTypeId           as PlaneTypeId,
      MaximumSeats          as MaximumSeats,
      OccupiedSeats         as OccupiedSeats,
      FreeSeats             as FreeSeats

}

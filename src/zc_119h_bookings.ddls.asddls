@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View Bookings'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_119H_Bookings
  as select from ZI_119H_FlightWithBookings
{
  key _Booking.TravelId                              as TravelId,
      count(*)                                       as NumberOfBookings,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg(_Booking.FlightPrice as abap.curr( 16,2 )) as AverageFlightPrice1,
      avg(FreeSeats as abap.dec( 16,2 ))             as AverageFreeSeats,
      cast('EUR' as abap.cuky)                       as CurrencyCode
}
group by
  _Booking.TravelId

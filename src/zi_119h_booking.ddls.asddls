@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119H_Booking
  as select from /dmo/booking
{

  key travel_id                                            as TravelId,
  key booking_id                                           as BookingId,
      booking_date                                         as BookingDate,
      customer_id                                          as CustomerId,
      carrier_id                                           as CarrierId,
      connection_id                                        as ConnectionId,
      flight_date                                          as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount => flight_price,
                          source_currency => currency_code,
                          target_currency => cast('EUR' as abap.cuky),
                          exchange_rate_date => booking_date,
                          error_handling => 'SET_TO_NULL') as FlightPrice,
      cast('EUR' as abap.cuky)                             as CurrencyCode

}

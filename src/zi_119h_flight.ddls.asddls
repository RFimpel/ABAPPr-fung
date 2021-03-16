@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119H_Flight as select from /dmo/flight {

key carrier_id as CarrierId,
key connection_id as ConnectionId,
key flight_date as FlightDate,
plane_type_id as PlaneTypeId,
seats_max as MaximumSeats,
seats_occupied as OccupiedSeats    
}

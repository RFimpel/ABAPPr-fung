CLASS zcl_119h_booking DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119h_booking IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA bookings TYPE TABLE OF ZC_119H_BookingExtended.
  DATA bookingsUpdated TYPE REF TO ZC_119H_BookingExtended.
  DATA updatedprice TYPE p length 16 decimals 2 value '1.1'.
  DATA TravelId1 TYPE c length 8 value '00000187'.



    SELECT FROM ZC_119H_BookingExtended
    FIELDS *
    WHERE TravelId = @TravelId1
    INTO TABLE @bookings.
    IF sy-subrc <> 0.
    out->write( | No Bookings found for : { TravelId1 } | ).
    RETURN.
    ENDIF.

    LOOP AT bookings REFERENCE INTO bookingsUpdated.
        bookingsUpdated->FlightPrice = bookingsUpdated->FlightPrice * updatedPrice.

        ENDLOOP.

    DELETE bookings where FlightPrice < '500.0'.

    SORT bookings BY BookingId ascending.
    SORT bookings BY CarrierId ascending
                     ConnectionId ascending
                     FlightDate ascending.

   out->write( |BOOKINGS| ).
   out->write( | BookingId ,CarrierId ,ConnectionId ,FlightDate ,BookingDate ,CustomerId ,FlightPrice | ).

    LOOP AT bookings INTO DATA(booking).
      out->write( | { booking-BookingId } , { booking-CarrierId } , {  booking-ConnectionId } , {   booking-FlightDate } , {  booking-BookingDate } , { booking-CustomerId } , { booking-FlightPrice } EUR | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

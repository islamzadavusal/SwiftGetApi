//
//  FlightsSearchUIData.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 28.02.24.
//

import Foundation

struct FlightSearchUIData {
    var flightNumber : String = ""
    var origin : String = ""
    var departure : String = ""
}

struct FlightSearchTableCellUIData {
    var companyImageUrl : String = ""
    var companyDisplayName : String = ""
    var origin : String = ""
    var departure : String = ""
    var departureDate : String = ""
    var landingDate : String = ""
    var price : Double = 0.0
    var currency : String = ""
    var baggageInfo : String = ""
    
    init(flight : DepartureElement, airlineList : [Airline]?) {
        if let segment = flight.segments.first {
            origin = segment.origin
            departure = segment.destination
            departureDate = segment.departureDatetime.time
            landingDate = segment.arrivalDatetime.time
            price = flight.priceBreakdown.total
            currency = flight.priceBreakdown.displayedCurrency
            
            let companyCode = segment.marketingAirline
            if let airline = airlineList?.filter({ $0.code == companyCode }).first {
                companyDisplayName = airline.name
                companyImageUrl = airline.image
            }
        }
    }
}

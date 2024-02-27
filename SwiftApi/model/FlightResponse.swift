//
//  FlightResponse.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import Foundation


struct FlightResponse: Codable {
    let data: FlightDatResponse
}

class FlightDatResponse: Codable {
    let airlines: [Airline]
    let airports: [Airport]
    let stopCounts, baggages: [Int]
    let hasViFlight: Bool
    let searchURL, shortSearchURL: String
    let flights: Flights

    enum CodingKeys: String, CodingKey {
        case airlines, airports
        case stopCounts = "stop_counts"
        case baggages
        case hasViFlight = "has_vi_flight"
        case searchURL = "search_url"
        case shortSearchURL = "short_search_url"
        case flights = "flights"
        
    }
}

class Airline: Codable {
    let code, name, slug: String
    let image: String
}

class Airport: Codable {
    let id, slug, airportName: String
    let cityCode: String?
    let cityName: String
    let citySlug: String?
    let countryCode, countryName: String
    let label: String?
    let isCity: Bool?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case airportName = "airport_name"
        case cityCode = "city_code"
        case cityName = "city_name"
        case citySlug = "city_slug"
        case countryCode = "country_code"
        case countryName = "country_name"
        case label
        case isCity = "is_city"
    }
}


class Flights: Codable {
    let departure: [DepartureElement]
}

class DepartureElement: Codable {
    let enuid: String
    let priceBreakdown, averagePriceBreakdown: PriceBreakdown
    let infos: Infos
    let segments: [Segment]
    let differentAirlineCount: Int

    enum CodingKeys: String, CodingKey {
        case enuid
        case priceBreakdown = "price_breakdown"
        case averagePriceBreakdown = "average_price_breakdown"
        case infos
        case segments
        case differentAirlineCount = "different_airline_count"
    }
}

// MARK: - PriceBreakdown
class PriceBreakdown: Codable {
    let base, tax: Int
    let service: Double
    let reissueService: Int
    let total: Double
    let currency: String
    let discount: Int
    let displayedCurrency: String
    let internalAssurance, extraFee, penalty: Int

    enum CodingKeys: String, CodingKey {
        case base, tax, service
        case reissueService = "reissue_service"
        case total, currency, discount
        case displayedCurrency = "displayed_currency"
        case internalAssurance = "internal_assurance"
        case extraFee = "extra_fee"
        case penalty
    }
}

// MARK: - Infos
class Infos: Codable {
    let isReservable, isPromo: Bool
    let duration: Duration
    let baggageInfo: BaggageInfo
    let isVirtualInterlining, isBusiness: Bool
    let isMaskRequired: Bool

    enum CodingKeys: String, CodingKey {
        case isReservable = "is_reservable"
        case isPromo = "is_promo"
        case duration
        case baggageInfo = "baggage_info"
        case isVirtualInterlining = "is_virtual_interlining"
        case isBusiness = "is_business"
        case isMaskRequired = "is_mask_required"
    }
}

// MARK: - BaggageInfo
class BaggageInfo: Codable {
    let carryOn: CarryOn
    let firstBaggageCollection: [FirstBaggageCollection]
}

// MARK: - CarryOn
class CarryOn: Codable {
    let allowance: Int
    let type, unit: String
    let part: Int
    let isSmall: Bool

    enum CodingKeys: String, CodingKey {
        case allowance, type, unit, part
        case isSmall = "is_small"
    }
}

// MARK: - FirstBaggageCollection
class FirstBaggageCollection: Codable {
    let paxType: String
    let allowance, part: Int
    let unit, type: String
    let small: Bool
}

// MARK: - Duration
struct Duration: Codable {
    let day, hour, minute, totalMinutes: Int

    enum CodingKeys: String, CodingKey {
        case day, hour, minute
        case totalMinutes = "total_minutes"
    }
}

// MARK: - Segment
struct Segment: Codable {
    let departureDatetime: Datetime
    let displayDepartureDatetime: String
    let arrivalDatetime: Datetime
    let displayArrivalDatetime, segmentClass, flightNumber, origin: String
    let destination, marketingAirline, operatingAirline: String
    let availableSeats: Int
    let duration: Duration
    let isTrain: Bool
    let segmentAttributes: SegmentAttributes
    let isVirtualInterlining: Bool

    enum CodingKeys: String, CodingKey {
        case departureDatetime = "departure_datetime"
        case displayDepartureDatetime = "display_departure_datetime"
        case arrivalDatetime = "arrival_datetime"
        case displayArrivalDatetime = "display_arrival_datetime"
        case segmentClass = "class"
        case flightNumber = "flight_number"
        case origin, destination
        case marketingAirline = "marketing_airline"
        case operatingAirline = "operating_airline"
        case availableSeats = "available_seats"
        case duration
        case isTrain = "is_train"
        case segmentAttributes = "segment_attributes"
        case isVirtualInterlining = "is_virtual_interlining"
    }
}

// MARK: - Datetime
struct Datetime: Codable {
    let date, time: String
    let timestamp: Int
}

// MARK: - SegmentAttributes
struct SegmentAttributes: Codable {
    let freeMeal: Bool

    enum CodingKeys: String, CodingKey {
        case freeMeal = "free_meal"
    }
}

// MARK: - PriceHistory
struct PriceHistory: Codable {
    let departure: PriceHistoryDeparture
}

// MARK: - PriceHistoryDeparture
struct PriceHistoryDeparture: Codable {
    let previousDayPrice, nextDayPrice: Int

    enum CodingKeys: String, CodingKey {
        case previousDayPrice = "previous_day_price"
        case nextDayPrice = "next_day_price"
    }
}

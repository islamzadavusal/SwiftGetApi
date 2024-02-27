//
//  FlightsTableViewCell.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import UIKit

class FlightsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var flightNumberLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var departureLabel: UILabel!
    
    @IBOutlet weak var arrivalLabel: UILabel!
    
    @IBOutlet weak var airlineLabel: UILabel!
    
    
    func configure(with flight: DepartureElement) {
            flightNumberLabel.text = "Flight Number: \(flight.enuid)"
            priceLabel.text = "Price: \(flight.priceBreakdown.total) \(flight.priceBreakdown.currency)"
            departureLabel.text = "Departure: \(flight.segments[0].displayDepartureDatetime)"
            arrivalLabel.text = "Arrival: \(flight.segments[0].displayArrivalDatetime)"
            airlineLabel.text = "Airline: \(flight.segments[0].marketingAirline)"
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

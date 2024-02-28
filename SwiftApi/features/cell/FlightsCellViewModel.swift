//
//  FlightsCellViewModel.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 28.02.24.
//

import UIKit

class FlightsCellViewModel : CellViewModelProtocol {
    
    let flight : FlightSearchTableCellUIData
    
    init(flight: FlightSearchTableCellUIData) {
        self.flight = flight
    }

}

protocol CellViewModelProtocol {
    
}

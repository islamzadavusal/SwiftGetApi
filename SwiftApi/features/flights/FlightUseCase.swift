//
//  FlightUseCase.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 28.02.24.
//

import UIKit

class FlightUseCase {
    
    var flightResponse : FlightResponse? = nil
    
    var cellViewModels = [FlightSearchTableCellUIData]()
    
    func getList(completion: @escaping (Result<Void, NetworkError>)->Void) {
        
        let url = "https://65a7624794c2c5762da692dd.mockapi.io/api/v1/flights"
        NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<FlightResponse, NetworkError>)  in
            switch result {
                case .success(let flightResponse) :
                    self.flightResponse = flightResponse
                    self.fillUIModel()
                    completion(.success( () ))
                    break
                case .failure(let error) :
                    completion(.failure(error))
                    break
            }
        }
    }
    
    func fillUIModel() {
        cellViewModels.removeAll()
        flightResponse?.data.flights.departure.forEach({ departureItem in
            cellViewModels.append(FlightSearchTableCellUIData.init(flight: departureItem, airlineList: flightResponse?.data.airlines))
        })
    }
}


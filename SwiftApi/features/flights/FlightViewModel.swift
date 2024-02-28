//
//  FlightViewModel.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import Foundation

class FlightViewModel {
    
    var cellViewModels = [FlightsCellViewModel]()
    
    let useCase: FlightUseCase
    
    init() {
        self.useCase = FlightUseCase()
    }
    
    func getList(completion: @escaping (Result<Void, NetworkError>)->Void) {
        
        useCase.getList { (result : Result<Void, NetworkError>)  in
            switch result {
                case .success(let flightResponse) :
                    self.prepareCellViewModels()
                    completion(.success( () ))
                    break
                case .failure(let error) :
                    completion(.failure(error))
                    break
            }
        }
    }
    
    func prepareCellViewModels() {
        useCase.cellViewModels.forEach { uiData in
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            
            // other data
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
            cellViewModels.append(FlightsCellViewModel.init(flight: uiData))
        }
    }
    
    var itemCount : Int {
        return cellViewModels.count
    }
    
    func getViewModel(for index : Int) -> FlightsCellViewModel {
        return cellViewModels[index]
    }
}

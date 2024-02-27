//
//  FlightViewModel.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import Foundation

class FlightViewModel {
    
    // Uçuş yanıtı için bir özellik tanımlar ve varsayılan olarak nil değeri atanır
    var flightResponse : FlightResponse? = nil
    
    // Uçuş listesini almak için bir fonksiyon tanımlar
    // NetworkManager aracılığıyla uçuş listesini alır
    // Sonuç başarılıysa, uçuş yanıtını alır, özellikleri günceller ve geri çağrıyı başarılı olarak tamamlar
    // Başarısızlık durumunda, hata ile geri çağrıyı tamamlar
    func getList(completion: @escaping (Result<Void, NetworkError>)->Void) {
        let url = "https://65a7624794c2c5762da692dd.mockapi.io/api/v1/flights"
        NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<FlightResponse, NetworkError>)  in
            switch result {
                case .success(let flightResponse) :
                    self.flightResponse = flightResponse
                    completion(.success( () ))
                    break
                case .failure(let error) :
                    completion(.failure(error))
                    break
            }
        }
    }
}

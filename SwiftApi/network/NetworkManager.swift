//
//  NetworkManager.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import Foundation


class NetworkManager {

    static let shared = NetworkManager()
    
    // http method
    // application/json
    // header 401
    // error & response
    
    //NSData & Data -> binary array
    
    func fetchData <T : Decodable> (from urlString : String, method : HTTPMethod, body : Data?, completion: @escaping (Result<T, NetworkError>)->Void) {
           
           // Verilen URL'nin geçerli olup olmadığını kontrol eder
           guard let url = URL(string: urlString) else {
               completion(.failure(.invalidURL))
               return
               
           }
           
           // URL için bir URLRequest oluşturur ve gerekli ayarlamaları yapar
           var request = URLRequest(url: url)
           request.httpMethod = method.rawValue
           request.httpBody = body
           
           // URLSession kullanarak veri alışverişi yapar
           URLSession.shared.dataTask(with: request) { data, response, error in
               
               // Hata varsa, bunu network hatası olarak işler ve geri çağrıyı kullanır
               if let error = error {
                   completion(.failure(.unknown(error)))
                   return
               }
               
               // Yanıt alındığında HTTP yanıtını kontrol eder
               guard let httpResponse =  response as? HTTPURLResponse else {
                   let error = NSError(domain: "Invalid response", code: -1)
                   completion(.failure(.unknown(error)))
                   return
               }
               
               // Başarısız HTTP durum kodları (200-299 aralığı dışındaki) için hata işler
               if !(200...299).contains(httpResponse.statusCode) {
                   completion(.failure(.httpResponseError(statusCode: httpResponse.statusCode)))
                   return
               }
               
               // Veri yoksa, noData hatası döndürür
               guard let data = data else {
                   completion(.failure(.noData))
                   return
               }
               
               // Veri alındığında "OKEY" yazdırır
               print("OKEY")
               
               // JSON veriyi belirtilen tipe dönüştürmeye çalışır ve sonucu geri çağrıya iletir
               do {
                   let decodedData = try JSONDecoder().decode(T.self, from: data)
                   completion(Result.success(decodedData))
               } catch {
                   completion(.failure(.decodingError))
               }
           }.resume()
       }
   }

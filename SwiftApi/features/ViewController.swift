//
//  ViewController.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = FlightViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // View yüklendiğinde verileri getirmek için fetchData() fonksiyonunu çağırır
            fetchData()
        }
        
        // Verileri getirmek için viewModel'den getList() fonksiyonunu çağırır
        func fetchData() {
            viewModel.getList { result in
                
                // Geri çağrı sonucunu işler
                switch result {
                case .success:
                    // Başarılıysa handleSuccess() fonksiyonunu çağırır
                    self.handleSuccess()
                    
                case .failure(let error):
                    // Başarısız olduğunda handleFailure() fonksiyonunu çağırır
                    self.handleFailure(error: error)
                }
            }
        }
        
        // Veri alındığında yapılacak işleri işler
        func handleSuccess() {
            // Eğer gerekliyse, başarılı durumda yapılacak işlemleri buraya ekleyebilirsiniz
        }
        
        // Veri alınamadığında yapılacak işleri işler
        func handleFailure(error : NetworkError) {
            // Hata durumunda ekrana hata mesajını yazdırır
            print("network error: \(error)")
        }
    }


/* var str = "Merhaba dünya"
 let data = str.data(using: .utf8)
 print(data)
 
 let imageUri = "https://i0.wp.com/www.sanatbul.org/wp-content/uploads/2022/10/gorsel.jpg"
 if let url = URL(string: imageUri) {
     DispatchQueue.global().async {
         if let imageData = try? Data(contentsOf: url) {
             let image = UIImage(data: imageData)
             print("")
         }
         
     }
 }*/

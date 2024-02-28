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
    
    var cellIdentifier : String = "FlightsTableViewCell"
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // View yüklendiğinde verileri getirmek için fetchData() fonksiyonunu çağırır
            fetchData()
        
        let nib = UINib(nibName: "FlightsTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // Veri alınamadığında yapılacak işleri işler
        func handleFailure(error : NetworkError) {
            // Hata durumunda ekrana hata mesajını yazdırır
            print("network error: \(error)")
        }
    }

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! FlightsTableViewCell
        cell.configure(viewModel: viewModel.getViewModel(for: indexPath.row))
        
    
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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

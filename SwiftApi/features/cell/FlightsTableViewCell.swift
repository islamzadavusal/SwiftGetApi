//
//  FlightsTableViewCell.swift
//  SwiftApi
//
//  Created by Vusal Islamzada on 27.02.24.
//

import UIKit
import Kingfisher

class FlightsTableViewCell: UITableViewCell, FlightCellProtocol {
    @IBOutlet weak var flightContainerView: UIView!
    
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var lblRoute: UILabel!
    @IBOutlet weak var lblDeparture: UILabel!
    @IBOutlet weak var lblLanding: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblBaggage: UILabel!
    
    var viewModel : FlightsCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(viewModel: CellViewModelProtocol) {
        self.viewModel = viewModel as? FlightsCellViewModel
        bindReadyData()
    }
    
    func bindReadyData() {
        
        flightContainerView.layer.cornerRadius = 10
        flightContainerView.layer.borderColor = UIColor.lightGray.cgColor
        flightContainerView.layer.borderWidth = 1
        
        let item = self.viewModel.flight
        companyNameLabel.text = item.companyDisplayName
        lblDeparture.text = item.departureDate
        lblLanding.text = item.landingDate
        lblPrice.text = "\(item.price) TL"
        lblRoute.text = "\(item.origin) > \(item.departure)"
        
        //self.companyImageView.loadImage(urlString: item.companyImageUrl)
        
        self.companyImageView.kf.setImage(with: URL(string: item.companyImageUrl)) { image in
            print("IMAGE")
        }

       
    }
    
}


protocol FlightCellProtocol {
    func configure(viewModel: CellViewModelProtocol)
}

extension UIImageView {
    func loadImage(urlString : String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: url) {
                    let image = UIImage(data: imageData)
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    
                }
            }
        }
    }
}

//
//  FindACarTableViewCell.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import UIKit

class FindACarTableViewCell: UITableViewCell {
    let reuseID = "FindACarCell"
    var typeOfCarText:String?
    var nameOfCarText:String?
    var transmissionTypeText:String?
    var totalCostText:String?
    
   
    @IBOutlet weak var typeOfCarLabel: UILabel!
    @IBOutlet weak var nameOfCarLabel: UILabel!
    
    @IBOutlet weak var transmissionTypeLabel: UILabel!
    
    @IBOutlet weak var totalCostLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func styleCard(){
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowPath = shadowPath.cgPath;
    }
    
    override func draw(_ rect: CGRect) {
        styleCard()
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
        guard let carText = typeOfCarLabel.text else{
            return
        }
        guard let nameOfCar = nameOfCarLabel.text else{
            return
        }
        guard let transmission = transmissionTypeLabel.text else{
            return
        }
        guard  let totalCost = totalCostLabel.text else{
            return
        }
        
        
        typeOfCarText = carText
        nameOfCarText = nameOfCar
        transmissionTypeText = transmission
        totalCostText = totalCost
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    override func prepareForReuse() {
        
        super.prepareForReuse()
         self.setNeedsDisplay()
    
    }

}

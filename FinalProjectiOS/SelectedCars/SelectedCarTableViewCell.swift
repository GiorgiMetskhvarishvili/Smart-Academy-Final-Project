//
//  SelectedCarTableViewCell.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 29.12.21.
//

import UIKit

class SelectedCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carNameLbl: UILabel!
    @IBOutlet weak var carHorsePowerLbl: UILabel!
    @IBOutlet weak var carPriceLbl: UILabel!
    @IBOutlet weak var selectedCarImage: UIImageView!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var carCounterLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



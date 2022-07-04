//
//  CarModelTableViewCell.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 28.12.21.
//

import UIKit

class CarModelTableViewCell: UITableViewCell {
    var carId: Int?
    @IBOutlet weak var carModelNameLabel: UILabel!
    @IBOutlet weak var carModelImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

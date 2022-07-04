//
//  SpecificCarTableViewCell.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 29.12.21.
//

import UIKit

class SpecificCarTableViewCell: UITableViewCell {

    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var removeFromCart: UIButton!
    @IBOutlet weak var carCounter: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carMake: UILabel!
    @IBOutlet weak var carHp: UILabel!
    @IBOutlet weak var carHpCount: UILabel!
    @IBOutlet weak var CarImage: UIImageView!
    
    var car : Cars?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func addToCartBtn(_ sender: Any) {
        car!.increase()
        carCounter.text = String(car!.count)
    }
    @IBAction func removeFromCartBtn(_ sender: Any) {
        car!.decrease()
        carCounter.text = String(car!.count)
    }
    

}

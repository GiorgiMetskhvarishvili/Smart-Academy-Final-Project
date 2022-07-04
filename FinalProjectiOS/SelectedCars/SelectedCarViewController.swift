//
//  SelectedCarViewController.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 29.12.21.
//

import UIKit

class SelectedCarViewController: UIViewController {
    @IBOutlet weak var SelectedCarTableView: UITableView!
    @IBOutlet weak var presentToPurchasePage: UIButton!
    @IBOutlet weak var totalCarPricePayment: UILabel!
    @IBOutlet weak var totalCarPriceLbl: UILabel!
    @IBOutlet weak var carCountLbl: UILabel!
    @IBOutlet weak var totalTaxView: UIView!
    
    var newArrayOfCars = [Cars]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectedCarTableView.dataSource = self
        SelectedCarTableView.delegate = self
    }

    @IBAction func presentPurchasePage(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "SuccessfulPurchaseStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "SuccessfulPurchaseViewController") as? SuccessfulPurchaseViewController
        self.present(vc!, animated: true)
    }
}



extension SelectedCarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newArrayOfCars.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCarTableViewCell", for: indexPath) as! SelectedCarTableViewCell
        let currentCarModel = newArrayOfCars[indexPath.row]
        cell.selectedCarImage.imageFromServerUrl(urlString: currentCarModel.img_url, PlaceHolderImage: UIImage())
        cell.carNameLbl.text = currentCarModel.make + " " + currentCarModel.model
        cell.carHorsePowerLbl.text = String(currentCarModel.horsepower)
        cell.carPriceLbl.text = String(currentCarModel.price) + "$"
        cell.carCounterLbl.text = String(currentCarModel.count) + "x"
        cell.totalPriceLbl.text = "სულ" + String(Double(currentCarModel.price) * Double(currentCarModel.count)) + "$"
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
     1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}

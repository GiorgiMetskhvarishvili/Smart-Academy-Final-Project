//
//  Extensions.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 28.12.21.
//

import Foundation
import UIKit

extension CarModelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarModelTableViewCell", for: indexPath) as! CarModelTableViewCell
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        let currentCarModel = carModelArray[indexPath.row]
        cell.carModelNameLabel.text = currentCarModel
        cell.carModelImageView.image = self.carLogoIcons[currentCarModel] ?? UIImage()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "SpecificCarViewControllerStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "SpecificCarViewController") as? SpecificCarViewController
        vc?.specificCarArray = self.carsArray.filter{$0.make == self.carModelArray[indexPath.row]}
        
        self.navigationController?.pushViewController(vc!, animated: true)
        self.CarModelTableView.reloadData()
    }
}

extension SpecificCarViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.specificCarArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificCarTableViewCell", for: indexPath) as! SpecificCarTableViewCell
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        let currentSpecificCarModel = specificCarArray[indexPath.row]
        cell.carMake.text = currentSpecificCarModel.make + " " + currentSpecificCarModel.model
        cell.carHp.text = "ცხენის ძალა:"
        cell.carPrice.text = "ფასი:" + String(currentSpecificCarModel.price) + "$"
        cell.carHpCount.text = String(currentSpecificCarModel.horsepower)
        cell.CarImage.imageFromServerUrl(urlString: currentSpecificCarModel.img_url, PlaceHolderImage: UIImage())
        cell.carCounter.text = String(currentSpecificCarModel.count)
        cell.car = currentSpecificCarModel
        return cell
    }
    
}

extension UIImageView {
    public func imageFromServerUrl(urlString: String, PlaceHolderImage: UIImage) {
        
        if self.image == nil{
            self.image = PlaceHolderImage
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}

extension UIViewController {
    func showAlert(alertText : String, alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "დახურვა", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
}

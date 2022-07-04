//
//  CarModelsViewController.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 27.12.21.
//

import UIKit

class CarModelsViewController: UIViewController {

    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var totalCarPrice: UILabel!
    @IBOutlet weak var totalCarCount: UILabel!
    @IBOutlet weak var CarModelTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let image = UIImage()
    var carDataArray = [CarRawData]()
    var carsArray = [Cars]()
    var carModelArray = [String]()
    var carLogoIcons = [
        "acura": UIImage(named: "acura"),
        "mercedes-benz": UIImage(named: "mercedes-benz"),
        "bmw": UIImage(named: "bmw"),
        "toyota": UIImage(named: "toyota"),
        "alfa-romeo": UIImage(named: "alfa-romeo"),
        "aston-martin": UIImage(named: "aston-martin"),
        "audi": UIImage(named: "audi"),
        "bentley": UIImage(named: "bentley"),
        "buick": UIImage(named: "buick"),
        "cadillac": UIImage(named: "cadilac"),
        "chevrolet": UIImage(named: "chevrolet"),
        "chrysler": UIImage(named: "chrysler"),
        "dodge": UIImage(named: "dodge"),
        "ferrari": UIImage(named: "ferrari"),
        "fiat": UIImage(named: "fiat"),
        "ford": UIImage(named: "ford"),
        "gmc":UIImage(named: "gmc"),
        "honda": UIImage(named: "honda"),
        "hyundai": UIImage(named: "hyundai"),
        "infiniti": UIImage(named: "infinity"),
        "jaguar": UIImage(named: "jaguar"),
        "jeep": UIImage(named: "jeep"),
        "kia": UIImage(named: "kia"),
        "lamborghini": UIImage(named: "lamborghini"),
        "land-rover": UIImage(named: "land-rover"),
        "lexus": UIImage(named: "lexus"),
        "lincoln": UIImage(named: "lincoln"),
        "mazda": UIImage(named: "mazda"),
        "maserati": UIImage(named: "maserati"),
        "mclaren": UIImage(named: "mclaren"),
        "mini": UIImage(named: "mini"),
        "mitsubishi": UIImage(named: "mitsubishi"),
        "nissan": UIImage(named: "nissan"),
        "porsche": UIImage(named: "porsche"),
        "ram": UIImage(named: "ram"),
        "rolls-royce": UIImage(named:
            "rolls-royce"),
        "scion": UIImage(named: "scion"),
        "subaru": UIImage(named: "subaru"),
        "volkswagen": UIImage(named: "volkswagen"),
        "volvo": UIImage(named: "volvo")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromWeb()
        CarModelTableView.dataSource = self
        CarModelTableView.delegate = self
        activityIndicator.startAnimating()
    }
    
    func selectedCars () -> [Cars]{
    let selectedCarsArray = self.carsArray.filter{$0.count > 0}
    
    var totalCount = 0
    var totalPrice : Double = 0
    
        selectedCarsArray.forEach {
        totalCount += $0.count
        totalPrice += Double($0.count) * $0.price
    }
        self.totalCarPrice.text = String(totalPrice) + "$"
        self.totalCarCount.text = String(totalCount) + "x"
        return selectedCarsArray
}
    override func viewDidAppear(_ animated: Bool) {
        selectedCars()
    }
    

    
    
    @IBAction func onClickCartBtn(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "SelectedCarStoryBoard", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectedCarViewController") as? SelectedCarViewController
        vc?.newArrayOfCars = selectedCars()
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func getDataFromWeb(){
        let urlString = "https://private-anon-a41c950c16-carsapi1.apiary-mock.com/cars?fbclid=IwAR0wRAgw30gahMQTh1CZxZQf2lwSpp2VJRwsvDRDaxf_HGhMydrovMhgZV4"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!){(data, _, _) in
            guard let data = data else {return}
            let result = try? JSONDecoder().decode([CarRawData].self, from: data)
            if result != nil{
               // self.carsArray = result!
               // self.carModelsArrays = Array(Set(self.carsArray.map{$0.make})).sorted()
                
                self.carDataArray = result!
                for i in 0...self.carDataArray.count - 1 {
                    let crd = self.carDataArray[i]
                    
                    self.carsArray.append(Cars(year: crd.year, id: crd.id, horsepower: crd.horsepower, make: crd.make, model: crd.model, price: crd.price, img_url: crd.img_url))
                }
                
                self.carModelArray = Array(Set(self.carsArray.map{$0.make})).sorted()
                
                DispatchQueue.main.async {
                    self.CarModelTableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
        }
    }.resume()
}
    
}

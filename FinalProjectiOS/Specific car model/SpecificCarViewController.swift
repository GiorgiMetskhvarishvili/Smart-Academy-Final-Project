//
//  SpecificCarViewController.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 29.12.21.
//

import UIKit

class SpecificCarViewController: UIViewController {
    @IBOutlet weak var endingBtn: UIButton!

    @IBOutlet weak var priceAsc: UIButton!
    @IBOutlet weak var priceDesc: UIButton!
    @IBOutlet weak var sortAsc: UIButton!
    @IBOutlet weak var sortDesc: UIButton!
    @IBOutlet weak var SpecificCarTableView: UITableView!
    

    var specificCarArray = [Cars]()
    var selectedSpecificCarArray = [Int: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SpecificCarTableView.delegate = self
        SpecificCarTableView.dataSource = self
    }

    func BtnLayers(){
        endingBtn.layer.masksToBounds = true
        endingBtn.layer.cornerRadius = 50
        priceAsc.layer.masksToBounds = true
        priceAsc.layer.cornerRadius = 15.0
        priceDesc.layer.cornerRadius = 15.0
    }
    @IBAction func onClickEndBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickPriceAsc(_ sender: Any) {
        self.specificCarArray = self.specificCarArray.sorted(by: { $0.price < $1.price })
        self.SpecificCarTableView.reloadData()
        }
    
    @IBAction func onClickPriceDesc(_ sender: Any) {
        self.specificCarArray = self.specificCarArray.sorted(by: { $0.price > $1.price })
        self.SpecificCarTableView.reloadData()
    }
    @IBAction func onClickSortAsc(_ sender: Any) {
        self.specificCarArray = self.specificCarArray.sorted(by: { $0.model < $1.model })
        self.SpecificCarTableView.reloadData()
    }
    @IBAction func onClickSortDesc(_ sender: Any) {
        self.specificCarArray = self.specificCarArray.sorted(by: { $0.model > $1.model })
        self.SpecificCarTableView.reloadData()
    }
}


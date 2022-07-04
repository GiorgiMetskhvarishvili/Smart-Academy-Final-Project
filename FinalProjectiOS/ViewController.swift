//
//  ViewController.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 24.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailDismissButton: UIButton!
    @IBOutlet weak var passwordDismissButton: UIButton!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    let password = "iloveios"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailtextField.delegate = self
        self.passwordTextField.delegate = self
        self.setUpScreen()
        self.setUpRadius(textfield: [emailtextField, passwordTextField])
    }
    
    func setUpRadius(textfield: [UITextField]) {
        textfield.forEach { textfield in
            textfield.layer.cornerRadius = 15.0
            textfield.layer.borderColor = UIColor.gray.cgColor
            textfield.layer.borderWidth = 1.0
        }
    }
    
    func setUpScreen() {
        enterButton.layer.masksToBounds = true
        enterButton.layer.cornerRadius = 15.0
        passwordTextField.isSecureTextEntry = true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @IBAction func clickOnEnter(_ sender: UIButton) {
        if let emailText = emailtextField.text, let passwordText = passwordTextField.text {
            if true && (isValidEmail(emailText) && passwordText == password) {
                let vc = UIStoryboard.init(name: "CarModelsStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "CarModelsViewController") as? CarModelsViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            } else {
                showAlert(alertText: "დაფიქსირდა შეცდომა", alertMessage: "გთხოვთ მიუთითოთ სწორი მონაცემები")
            }
        } else {
            showAlert(alertText: "დაფიქსირდა შეცდომა", alertMessage: "გთხოვთ მიუთითოთ სწორი მონაცემები")
        }

    }
    
    @IBAction func clearEmailButton(_ sender: Any) {
        emailtextField.text = ""
    }
    
    @IBAction func clearPassword(_ sender: Any) {
        passwordTextField.text = ""
    }
    
}










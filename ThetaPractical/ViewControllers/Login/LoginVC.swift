//
//  ViewController.swift
//  ThetaPractical
//
//  Created by Rishi Jha on 27/12/21.
//

import UIKit

class LoginVC: UIViewController {

    //   MARK: ---------------------IBOUTLET------------------
    @IBOutlet weak var txtFieldEmail: UITextField!{
        didSet{
            
        }
    }
    @IBOutlet weak var txtFieldPassword: UITextField!{
        didSet{
            
        }
    }
    @IBOutlet weak var btnLogin: UIButton!{
        didSet{
            
        }
    }
    
    //   MARK: ---------------------LocalVariable------------------
    var Udefault = UserDefaults.standard
    
    //   MARK: ---------------------Enum------------------
    enum Keys: String {
        case email, password
    }
    //   MARK: ---------------------Life Cycle------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //   MARK: ---------------------Custom functions------------------
    
    func validation(){
        guard txtFieldEmail.text! != "" else{
           return alert(message: "Please Enter Email")
        }
        guard txtFieldEmail.text!.isValidEmail() else {
            return alert(message: "Please Enter Valid EmailId")
        }
        guard txtFieldPassword.text! != "" else{
            return alert(message: "Please Enter Password")
            
        }
        Udefault.setValue(txtFieldEmail.text, forKey: Keys.email.rawValue)
        Udefault.setValue(txtFieldPassword.text, forKey: Keys.password.rawValue)
        login()
        
    }
    
    func login(){
        print("Login successfully")
    }
    
    //   MARK: ---------------------IBACTION------------------
    @IBAction func btnActionLogin(_ sender: UIButton) {
        
        self.validation()
    }

}

extension String{
    func isValidEmail() -> Bool {
            // here, `try!` will always succeed because the pattern is valid
            let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
}

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}


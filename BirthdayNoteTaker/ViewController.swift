//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Alejandro Guerra Hernandez on 10/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.value(forKey: "name")
        let storedBirthday = UserDefaults.standard.value(forKey: "birthday")
        
        // Cast: as? vs as!
        // Good!
        nameTextField.text = storedName as? String
        birthdayTextField.text = storedBirthday as? String
        
        // very good
        if let myName = storedName as? String {
            nameLabel.text = myName
        }
        if let myBirthday = storedBirthday as? String {
            birthdayLabel.text = myBirthday
        }
        
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.setValue(nameTextField.text!, forKey: "name")
        UserDefaults.standard.setValue(birthdayTextField.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        if let newBirthday = storedBirthday as? String {
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
        
    }
}


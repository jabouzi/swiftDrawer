//
//  NameController.swift
//  NavigationNoStoryBoard
//
//  Created by dev on 4/25/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit

protocol NameControllerDelegate: class {
    func nameController(nameVC: NameController, didSaveName name: String)
}

class NameController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    weak var delegate: NameControllerDelegate?
    var fullName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Name"
        addRighBarButton()
        if let fullName = self.fullName {
            let firstLast = fullName.components(separatedBy: " ")
            firstNameTextField.text = firstLast[0]
            lastNameTextField.text = firstLast[1]
        }
    }
    
    func addRighBarButton() {
        let save = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(NameController.saveButtonTapped))
        self.navigationItem.rightBarButtonItem = save
    }    
    
    @objc func saveButtonTapped() {
        let name = firstNameTextField.text! + " " + lastNameTextField.text!
        delegate?.nameController(nameVC: self, didSaveName: name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

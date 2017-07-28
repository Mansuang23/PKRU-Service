//
//  SignUpViewController.swift
//  PKRU Service
//
//  Created by Com 05 on 7/28/2560 BE.
//  Copyright © 2560 Com 05. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // Implicit
    
    let strBlankAlert = "กรุณากรอกข้อมูลทุกช่อง"
    let strFontPHP = "http://androidthai.in.th/pkru/addDataMansuang.php?isAdd=true&Name="
    
    
    @IBOutlet weak var NameTextField: UITextField!
    
    
    @IBOutlet weak var UserTextFeild: UITextField!
    
    
    @IBOutlet weak var PasswordTextFeild: UITextField!
    
    
    @IBOutlet weak var AlertLabel: UILabel!
    
    
    @IBAction func SaveButton(_ sender: Any) {
        
        
        // Get Value From TextField
        
        let strName: String = NameTextField.text!
        let strUser: String = UserTextFeild.text!
        let strPassword: String = PasswordTextFeild.text!
        
        // Show Log
        print("strName ==> \(strName)")
        print("strUser ==> \(strUser)")
        print("strPassword ==> \(strPassword)")
        
        
        // Check Space
        if (strName == "") || (strUser == "") || (strPassword == "") {
            // Have Space
            AlertLabel.text = strBlankAlert
            
        } else {
            
            // No Space
            uploadToServer(strName: strName, strUser: strUser, strPassword: strPassword)
        }
        
        
    }   // saveButton
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        // viewDidLoad
    }
    
    func uploadToServer(strName: String, strUser: String, strPassword: String) -> Void {
        
        let strPHP: String = strFontPHP + "\(strName)&User=\(strUser)&Password=\(strPassword)"
        print("strPHP ==> \(strPHP)")
        
        let masterPHP = strPHP
        let myURL = URL(string: masterPHP)
        let request = NSMutableURLRequest(url: myURL!)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil {
                
                print("Error ==> \(String(describing: error))")
                
            } else {
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let strResult = dataString as Any
                    print("strResult ==> \(strResult)")
                    
                }   //if
                
            }   // if
            
        }   // task
        task.resume()
        
        
        
        
        
        
    }   // uploadToServer
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

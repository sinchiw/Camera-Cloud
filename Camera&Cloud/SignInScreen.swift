//
//  ViewController.swift
//  Camera&Cloud
//
//  Created by Wilmer sinchi on 7/16/18.
//  Copyright © 2018 Wilmer sinchi. All rights reserved.
//

import UIKit
//import GoogleSignIn
import Firebase

//googlesign in dlegate was remove from here
class SignInScreen: UIViewController{

    
  
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signOnButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
//    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //need to allocate the reference
        //click create real time database in your console from your firebase and copy the link that is provided  in insert in the url

        // Do any additional setup after loading the view, typically from a nib.
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...

        //changing the color of the UI background
//        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
//
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signin(_ sender: Any) {
        guard let email = email.text, let password = password.text else{
            print("form is not valid")
            return
        }
//        //this is a test to get the references!
//        let ref = Database.database().reference()
//        print(ref.description())
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error{
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                return
            }
            else if  self.email.text == "" || self.password.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter an email and password. ", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
                

            else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Memories")
               self.present(vc!, animated: true, completion: nil)
                
                
            }
        
            guard let authResult = authResult else {
                print("User Not Created!")
                return
            }
            //psuh the new user into the firebase database
            let user = authResult.user
            let ref = Database.database().reference()
            //to reference the node
            let userReference = ref.child("user")
            // this constant will be a reference to the new user location of the database
            let uid = user.uid
            let newUserReference = userReference.child(uid)
            newUserReference.setValue(["email": email, "password": password])
//            print(ref.description())
            
            
//            present(success, animated: true, completion: nil)
//            let newuser = User(uid: user.uid, )
            print(user.uid)
            
        }
        
        //            print(User)
        
        //testing if the button works
        //        print(123)
        
    }
  
    
    @IBAction func login(_ sender: Any) {
        guard let email = email.text, let password = password.text else{
            print("form is not valid")
            return
        }
        
        if self.email.text == "" || self.password.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password. ", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error{
                print(error.localizedDescription)
                let alertController2 = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                
                let defaultAction2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController2.addAction(defaultAction2)
                
                self.present(alertController2, animated: true, completion: nil)
                return
            } else{
                print("You have successfully logged in")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Memories")
                self.present(vc!, animated: true, completion: nil)
                
            }
        print("success!")
    }
        }
    
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
//                withError error: NSError!) {
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            // ...
//        } else {
//            println("\(error.localizedDescription)")
//        }
//    }
    }

}

//pices of code to change the color in a simpler way
//extension UIColor {
//
//    convenience init( r: CGFloat, g: CGFloat, b: CGFloat) {
//        self.init(red: r/255, green: g/255, blue: b/255, alpha:1)
//    }
//}
//


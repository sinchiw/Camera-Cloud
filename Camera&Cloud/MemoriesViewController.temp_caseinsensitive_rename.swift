//
//  Memories .swift
//  Camera&Cloud
//
//  Created by Wilmer sinchi on 7/23/18.
//  Copyright © 2018 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class MemeoriesViewController: UIViewController {
    var myViewController = MemeoriesViewController.instantiate()
    override func viewDidLoad() {
        super.viewDidLoad()
          navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        // Do any additional setup after loading the view, typically from a nib.
//        var ref: DatabaseReference!
//        //
//        ref = Database.database().reference(fromURL: "https://camera-cloud-84402.firebaseio.com/")
//        ref.updateChildValues(["somevalue": 123123])
//        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleLogout() {
        //this is how you set you call your class and pull out certain things
//        let loginController = MemeoriesViewController.instantiate()
        present(myViewController, animated: true, completion: nil)
        
    }
    //this is how t
    static func instantiate() -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInScreen") as! SignInScreen
    }
    
    
    
}



//
//  File.swift
//  Camera&Cloud
//
//  Created by Wilmer sinchi on 7/23/18.
//  Copyright © 2018 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit


class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var UploadPhoto: UIButton!
    @IBOutlet var takePicture: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        takePicture.addTarget(self, action: #selector(takePictures), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
//        button.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    @IBAction func takePictures(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        //if the device has a camera, tkae a pciture: otherwiae,
        //just pick from photo library
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            
        }
        else {
//            imagePicker.sourceType = .photoLibrary
            let refreshAlert = UIAlertController(title: "Error", message: "Camera is not presentable", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
//                   present(refreshAlert, animated: true, completion: nil)
            }))
            present(refreshAlert, animated: true, completion: nil)
          }
        imagePicker.delegate = self
     

        
        //Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
        }
    

    @IBAction func uploadPhotoz(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
        
        imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
        
    }
    

//public extension UIButton {
//
//    func alignTextBelow(spacing: CGFloat = 6.0) {
//        if let image = self.imageView?.image {
//            let imageSize: CGSize = image.size
//            self.titleEdgeInsets = UIEdgeInsetsMake(spacing, -imageSize.width, -(imageSize.height), 0.0)
//            let labelString = NSString(string: self.titleLabel!.text!)
//            let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: self.titleLabel!.font])
//            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, -titleSize.width)
//        }
//    }
//
//}





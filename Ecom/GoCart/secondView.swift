//
//  secondView.swift
//  GoCart
//
//  Created by Devasurya on 27/12/23.
//

import UIKit

class secondView: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var selectedIMg:UIImage?
    
    var imagePicker=UIImagePickerController()
    
    @IBAction func uploadImg() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
    }
}
}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



//
//  AddPostVC.swift
//  my-hood
//
//  Created by Pat Butler on 2015-11-10.
//  Copyright © 2015 RPG Ventures. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
    }
    
    @IBAction func makePostButtonPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            var post = Post(imagePath: imgPath, title: title, postDescription: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    @IBAction func addPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
        
    }
}

//
//  NewPhotoViewController.swift
//  InstaSlam
//
//  Created by Abby  Bassie on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class NewPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var pictureTaken: UIImage!
    
    @IBOutlet weak var capturePhoto: UIImageView!
    
    @IBOutlet weak var captionField: UITextField!
  
    let photoSelector = UIImagePickerController()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        photoSelector.delegate = self
        photoSelector.allowsEditing = true
        photoSelector.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.capturePhoto.image = self.pictureTaken
        

        
        //self.presentViewController(photoSelector, animated: true, completion: nil)
    }


        // Do any additional setup after loading the view.
    
    @IBAction func openPhotos(sender: AnyObject) {
        photoSelector.delegate = self
        photoSelector.allowsEditing = false
        photoSelector.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(photoSelector, animated: true, completion: nil)
    }
    
    

    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            
            capturePhoto.image = originalImage
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    func correctImageSize(image: UIImage, newSize: CGSize) -> UIImage {
        let correctImageSize = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        correctImageSize.contentMode = UIViewContentMode.ScaleAspectFill
        UIGraphicsBeginImageContext(correctImageSize.frame.size)
        correctImageSize.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let resizedPhoto = UIGraphicsGetImageFromCurrentImageContext()
        return resizedPhoto
    }
    
    @IBAction func onPost(sender: AnyObject) {
        let resizedPicture = self.correctImageSize(capturePhoto.image!, newSize: CGSize(width: 320, height: 320))
        
        Post.postUserImage(resizedPicture, withCaption: captionField.text) { (success: Bool, error: NSError?) -> Void in
            self.captionField.text = nil
            self.capturePhoto.image = nil
            
            
                  }
        self.dismissViewControllerAnimated(true, completion: {
           NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        })

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

        /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}

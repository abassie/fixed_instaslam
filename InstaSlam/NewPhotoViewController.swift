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
    
    @IBOutlet weak var capturePhoto: UIImageView!
    
  
    let photoSelector = UIImagePickerController()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        photoSelector.delegate = self
        photoSelector.allowsEditing = true
        photoSelector.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        //self.presentViewController(photoSelector, animated: true, completion: nil)
    }


        // Do any additional setup after loading the view.
    
    @IBAction func openPhotos(sender: AnyObject) {
        photoSelector.allowsEditing = false
        photoSelector.sourceType = .PhotoLibrary
        
        presentViewController(photoSelector, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            capturePhoto.contentMode = .ScaleAspectFill
            
            capturePhoto.image = originalImage
            dismissViewControllerAnimated(true, completion: nil)
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

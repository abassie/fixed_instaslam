//
//  LoginViewController.swift
//  InstaSlam
//
//  Created by Abby  Bassie on 3/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //code for adding GIF
        let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("giphy", withExtension: "gif")!)
        let imageGif = UIImage.gifWithData(imageData!)
        let imageView = UIImageView(image: imageGif)
        imageView.frame = CGRect(x: 0.0, y:0.0, width:375.0, height: 700.0)
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) {
            (user: PFUser?, error: NSError?) ->
            Void in
            if user != nil {
                print("you're logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Yay, created user!!")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
                if error?.code == 202 {
                    let accountExists = UIAlertController(title: "Error", message: "Username already exists", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    accountExists.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                        print("Handle Ok logic here")
                    }))
                    
                    self.presentViewController(accountExists, animated: true, completion: nil)
                }
            }
        }
        
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

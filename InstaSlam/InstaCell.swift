//
//  InstaCell.swift
//  InstaSlam
//
//  Created by Abby  Bassie on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse
import AFNetworking

class InstaCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var caption: UILabel!
    
    var post: PFObject! {
        didSet {
            caption.text = post["caption"] as? String
            
            let file = post["media"] as? PFFile
            let url = NSURL(string: (file?.url)!)
            photoView.setImageWithURL(url!)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

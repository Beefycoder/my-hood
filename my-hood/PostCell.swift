//
//  PostCell.swift
//  my-hood
//
//  Created by Pat Butler on 2015-11-10.
//  Copyright © 2015 RPG Ventures. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
        
    }

    func configureCell(post: Post) {
        titleLable.text = post.title
        descLbl.text = post.postDescription
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        
    }
  
}

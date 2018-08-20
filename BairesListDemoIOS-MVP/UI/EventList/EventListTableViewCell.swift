//
//  EventListTableViewCell.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/15/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import UIKit

class EventListTableViewCell: UITableViewCell {

    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var middleText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var like: CheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

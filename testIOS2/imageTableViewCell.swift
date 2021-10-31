//
//  imageTableViewCell.swift
//  testIOS2
//
//  Created by Mauricio Zarate on 08/01/21.
//

import UIKit


protocol segueManda: class {
     // you can add parameters if you want to pass. something to controller
     func llevaOtra()
}

class imageTableViewCell: UITableViewCell {
    
    static let identifier  = "imageTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "imageTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public weak var delegate: segueManda?
 
    @IBAction func camBtn(_ sender: AnyObject) {
        print("btn lleva foto")
        delegate?.llevaOtra()
    }
     
    
    
}



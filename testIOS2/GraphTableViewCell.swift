//
//  GraphTableViewCell.swift
//  testIOS2
//
//  Created by MaurZac on 31/10/21.
//

import UIKit

class GraphTableViewCell: UITableViewCell {
    
    static let identifier  = "GraphTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "GraphTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

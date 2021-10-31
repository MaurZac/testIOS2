//
//  SimpleTableViewCell.swift
//  testIOS2
//
//  Created by Mauricio Zarate on 08/01/21.
//

import UIKit
import Firebase

class SimpleTableViewCell: UITableViewCell {
    
    static let identifier  = "SimpleTableViewCell"
    let inputCell = InputTableViewCell()
    let photoVC = PicksViewController()
    
    static func nib() -> UINib {
        return UINib(nibName: "SimpleTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func sendToFire(_ sender: UIButton) {
        print("::send::")
        let userName = inputCell.textLabel?.text
        let storage  = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data = photoVC.imageView?.image?.jpegData(compressionQuality: 0.5){
            let imageReference = mediaFolder.child("image.jpg")
            imageReference.putData(data, metadata: nil) { (metadadata, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil{
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                }
            }
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

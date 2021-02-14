//
//  PicksViewController.swift
//  testIOS2
//
//  Created by Mauricio Zarate on 16/01/21.
//

import UIKit

class PicksViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{


    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseImage()
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
       
    }
    
    @IBAction func closeModalBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
   @objc func chooseImage() {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.delegate = self
    present(picker, animated: true, completion: nil)
    
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    

}

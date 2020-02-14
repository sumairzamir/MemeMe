//
//  ViewController.swift
//  MemeMe
//
//  Created by Aiman Nabeel on 06/02/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{

    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var textFieldTop: UITextField!
    @IBOutlet weak var textFieldBottom: UITextField!
    
    // Set the ContentMode for the UIImageView!!!***
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 25)!,
        NSAttributedString.Key.strokeWidth: -5
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldTop.defaultTextAttributes = memeTextAttributes
        textFieldBottom.defaultTextAttributes = memeTextAttributes
        textFieldTop.text = "Top"
        textFieldTop.textAlignment = .center
        textFieldBottom.text = "Bottom"
        textFieldBottom.textAlignment = .center

        
        // Create separate delegate!
        self.textFieldTop.delegate = self
        self.textFieldBottom.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if self.textFieldTop.text == "Top" {
            self.textFieldTop.text = ""
        }
        if self.textFieldBottom.text == "Bottom" {
            self.textFieldBottom.text = ""
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
        imagePicked.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImage(_ sender: Any) {
    
        let pickImage = UIImagePickerController()
        pickImage.delegate = self
        pickImage.sourceType = .photoLibrary
        present(pickImage, animated: true, completion: nil)
        
    }
    
    @IBAction func selectCameraImage(_ sender: Any) {
        
        let pickCameraImage = UIImagePickerController()
        pickCameraImage.delegate = self
        pickCameraImage.sourceType = .camera
        present(pickCameraImage, animated: true, completion: nil)
        
    }
}


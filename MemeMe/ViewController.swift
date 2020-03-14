//
//  ViewController.swift
//  MemeMe
//
//  Created by Sumair Zamir on 06/02/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var textFieldTop: UITextField!
    @IBOutlet weak var textFieldBottom: UITextField!
    @IBOutlet weak var toolbarTop: UIToolbar!
    @IBOutlet weak var toolbarBottom: UIToolbar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    // MARK: - Delegate definition
    
    let textFieldDelegate = TextFieldDelegate()
    
    // MARK: - ViewController functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Check whether camera is available on the device
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        // Keyboard adjustment for UITextfield
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        // Keyboard adjustment for UITexfield
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
        
    }
    
    // MARK: - Common method, initialisation of textFields
    
    func initTextField(_ textField: UITextField, text: String, delegate: UITextFieldDelegate) {
        
        textField.defaultTextAttributes = memeTextAttributes
        textField.tintColor = UIColor.clear
        textField.textAlignment = .center
        textField.text = text
        textField.delegate = delegate
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Initialise the top text field
        
        initTextField(textFieldTop, text: "Top", delegate: textFieldDelegate)
        
        // Initialise the bottom text field
        initTextField(textFieldBottom, text: "Bottom", delegate: self)
        
        // Configure the UI elements on initial loading of the view
        configureUI(false)
        
    }
    
    // MARK: - Keyboard adjustment functions
    
    func subscribeToKeyboardNotifications() {
        
        // Keyboard adjustment based on notification call, both when called and dismissed
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func unsubscribeToKeyboardNotifications() {
        
        // Keyboard adjustment on dismiss
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        
        // Adjustment to the frame on entry to the UITextfield and specifically for the bottom UITexfield
        if textFieldBottom.isEditing{
            view.frame.origin.y -= getKeyboardHeight(notification)
            
        }
        
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        
        // Adjustment of the frame back to the original state
        view.frame.origin.y = 0
        
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        // Function which returns the height of the keyboard
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
        
    }
    
    // MARK: - Attributes for the UITextfields
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 25)!,
        NSAttributedString.Key.strokeWidth: -5
    ]
    
    // MARK: - Function to save the generated Meme
    
    func save() {
        
        let meme = MemeInfo(topText: textFieldTop.text!, bottomText: textFieldBottom.text!, originalImage: imagePicked.image!, memedImage: generateMemedImage())
        
        // Add the meme to the instance of the memes array in the AppDelegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
    }
    
    func configureForScreenshot(takeScreenshot: Bool) {
        
        // Hide the navbar and toolbars
        
        // Built-in navbar and toolbars
        
        self.navigationController?.setToolbarHidden(takeScreenshot, animated: false)
        self.navigationController?.setNavigationBarHidden(takeScreenshot, animated: false)
        
        // Created toolbars at the top and bottom
        
        self.toolbarTop.isHidden = takeScreenshot
        self.toolbarBottom.isHidden = takeScreenshot
    }
    
    
    // MARK: - Function to take a screenshot and hide Toolbars/Navbars
    
    func generateMemedImage() -> UIImage {
        
        // Configure UI for screenshot
        
        configureForScreenshot(takeScreenshot: true)
        
        // Save the screenshot as an image
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Re-configure once the screenshot has been taken
        
        configureForScreenshot(takeScreenshot: false)
        
        // Return a memedImage
        
        return memedImage
        
    }
    
    // MARK: - Configure the share/cancel buttons
    
    func configureUI(_ imageSelected:Bool = false) {
        
        shareButton.isEnabled = imageSelected
        cancelButton.isEnabled = imageSelected
        
    }
    
    // MARK: - Self delegates for the bottom UITextField
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.text == "Bottom" {
            textField.text = ""
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true;
        
    }
    
    // MARK: - Image selection function
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            imagePicked.image = image
            configureUI(true)
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Cancel selection of the image
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Select source, common method - code refactoring
    
    func sourceSelect(_ source: UIImagePickerController.SourceType) {
        
        let select = UIImagePickerController()
        select.delegate = self
        select.sourceType = source
        
        select.modalPresentationStyle = .currentContext
        present(select, animated: true, completion: nil)
        
    }
    
    // MARK: IBActions
    
    @IBAction func selectImage(_ sender: Any) {
        
        // Call the common method
        
        sourceSelect(.photoLibrary)
        
    }
    
    @IBAction func selectCameraImage(_ sender: Any) {
        
        // Call the common method
        
        sourceSelect(.camera)
        
    }
    
    @IBAction func shareImage(_sender: Any) {
        
        // Call a view to save and share the generated Meme
        
        let controller = UIActivityViewController(activityItems: [generateMemedImage()], applicationActivities: nil)
        
        present(controller, animated: true, completion: nil)
        
        // Additional code for iPad compatibility
        
        if let popOver = controller.popoverPresentationController {
            popOver.sourceView = self.view
            popOver.barButtonItem = self.shareButton
        }
        
        // Once activity has been completed - run the save function, which saves into the MemoInfo struct
        
        controller.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                self.save()
                
                // One the save method has been called, dismiss the modal view presentation of the MemeViewController. The presentation of the UIActivityViewController is automatically dismissed on completion.
                self.presentingViewController?.dismiss(animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    @IBAction func cancelImage(_sender: Any) {
        
        // Cancel image selection and configure the buttons
        self.imagePicked.image = nil
        configureUI(false)
        
    }
    
    @IBAction func dismissViewController(_sender: Any) {
        self.presentingViewController?.dismiss(animated: (true), completion: nil)
    }
    
}

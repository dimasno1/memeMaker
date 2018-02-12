//
//  ViewController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 06.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: creating Outlets
    
    @IBOutlet weak var imageViewier: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    var shareButton: UIBarButtonItem?
    var bottomToolBar: UIToolbar?
    var topToolBar: UIToolbar?
    let textFieldsDelegate = CustomTextFieldDelegate()
    
    
    //MARK: ImagePicker funcs
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageViewier.image = nil
        picker.dismiss(animated: true, completion:{ print ("Did select")})
        let image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        self.imageViewier.image = image
        DispatchQueue.main.async {
            self.shareButton!.isEnabled = true
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:{ print ("Canceled") })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // MARK: Settting properties for textFields
        textFieldsDelegate.setProperties(for: topTextField)
        textFieldsDelegate.setProperties(for: bottomTextField)
        subscribeForNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unsubscribeFromNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: TopToolBar properties:
        let topToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 75))
        let barShareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareBtnPressed))
        self.shareButton = barShareButton
        
        topToolBar.items = [barShareButton]
        
        // MARK: BottomToolBar properties:
        let bottomToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.height - 75, width: self.view.bounds.width, height: 75))
        let bottomPickImageButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(pickImage))
        let bottomCameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(makePhoto))
        
        bottomToolBar.items = [bottomPickImageButton, bottomCameraButton]
        
        self.bottomToolBar = bottomToolBar
        self.topToolBar = topToolBar
        
        self.view.addSubview(bottomToolBar)
        self.view.addSubview(topToolBar)
        
        shareButton?.isEnabled = false
        //Top text field properties
        topTextField.text = "TOP"
        
        //Bottom text field properties
        bottomTextField.text = "BOTTOM"
        
        self.topTextField.delegate = textFieldsDelegate
        self.bottomTextField.delegate = textFieldsDelegate
    }
    
    //Working with keyboard notifications
    func getNotification(_ notification: NSNotification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyboardHeight = userInfo!["UIKeyboardFrameEndUserInfoKey"] as! CGRect
        return keyboardHeight.height
    }
    
    func subscribeForNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromNotifications(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    //MARK: Hide/show keyboard:
    @objc func keyboardWillHide(){
        self.view.frame.origin.y = 0
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if bottomTextField.isFirstResponder{
            self.view.frame.origin.y -= getNotification(notification)
        }
    }
    
    //MARK: Actions
    func save(){
        if let image = imageViewier.image{
            var meme = MemedPhoto(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: image)
            meme.memedImage = generateMemedImage()
        }
    }
    
    func generateMemedImage() -> UIImage {
        topToolBar?.isHidden = true
        bottomToolBar?.isHidden = true
        
        // MARK: Render view to an image
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let memedImage = image!
        UIGraphicsEndImageContext()
       
        topToolBar?.isHidden = false
        bottomToolBar?.isHidden = false
        return memedImage
    }
    
    @objc func shareBtnPressed() {
        save()
        if self.imageViewier.image != nil{
            let image = generateMemedImage()
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
    }
    
    //Pick image from Photo Library
    @objc func pickImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    //Make photo with camera
    @objc func makePhoto() {
        let cameraImagePicker = UIImagePickerController()
        cameraImagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            cameraImagePicker.sourceType = .camera
        }
        self.present(cameraImagePicker, animated: true, completion: nil)
    }
    
}


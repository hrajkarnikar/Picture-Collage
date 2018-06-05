//
//  PictureViewController.swift
//  Picture Collage
//
//  Created by bjoshi on 6/2/18.
//  Copyright © 2018 hrajkarnikar. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var FirstImageView: UIImageView!
    @IBOutlet weak var SecondImageView: UIImageView!
    @IBOutlet weak var CombinedImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var imagePicked = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        assignTapGesture(imageView: FirstImageView)
        assignTapGesture(imageView: SecondImageView)
        
        imagePicker.delegate = self

    }
    
    func assignTapGesture(imageView: UIImageView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPicture))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc func tapPicture(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imagePicked = imagePicked + 1
            
            if imagePicked == 1 {
                FirstImageView.contentMode = .scaleAspectFit
                FirstImageView.image = pickedImage
            } else if imagePicked == 2 {
                SecondImageView.contentMode = .scaleAspectFit
                SecondImageView.image = pickedImage
            }
            
            
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func joinButtonPressed(_ sender: UIButton) {
        let leftImage = FirstImageView.image // 355 X 200
        let rightImage = SecondImageView.image  // 355 X 60
        
        let size = CGSize(width: (leftImage?.size.width)! + (rightImage?.size.width)!, height: (leftImage?.size.height)!)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        leftImage?.draw(in: CGRect(x:0, y:0, width: (size.width / 2), height: size.height).insetBy(dx: 100, dy: 100))
        rightImage?.draw(in: CGRect(x:(size.width / 2), y:0, width: (size.width / 2),  height: size.height).insetBy(dx: 100, dy: 100))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // I've added an UIImageView, You can change as per your requirement.
        //let mergeImageView = UIImageView(frame: CGRect(x:0, y: 200, width: 355, height: 260))
        
        // Here is your final combined images into a single image view.
        CombinedImageView.image = newImage
        //mergeImageView.image = newImage
        UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil);
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

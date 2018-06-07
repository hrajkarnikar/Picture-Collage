//
//  MultiplePictureViewController.swift
//  Picture Collage
//
//  Created by bjoshi on 6/5/18.
//  Copyright © 2018 hrajkarnikar. All rights reserved.
//

import UIKit
import OpalImagePicker

class MultiplePictureViewController: UIViewController {
    
    let imagePicker = OpalImagePickerController()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.imagePickerDelegate = self
        imagePicker.maximumSelectionsAllowed = 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePicturePressed(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
        
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

extension MultiplePictureViewController: OpalImagePickerControllerDelegate {
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        //Cancel action?
    }
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]) {
        var width : CGFloat = 0
        var height : CGFloat = 0
        var y: CGFloat = 0
        var imageHeight : CGFloat = 0
        
        //Save Images, update UI
        for image in images{
            if width < image.size.width {
                width = image.size.width
            }
            height = height + image.size.height
        }
        
        let size = CGSize(width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        for image in images{
            imageHeight = y + image.size.height
            image.draw(in: CGRect(x:0, y: y, width: width, height: imageHeight))
            y = y + image.size.height
        }
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil)

        
        //Dismiss Controller
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}



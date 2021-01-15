//
//  ViewController.swift
//  COMP8031_Assignment1_Swift
//
//  Created by Bhavuk Gupta on 2021-01-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nextOutlet: UIButton!
    @IBOutlet weak var previousOutlet: UIButton!
    
    @IBOutlet private var tappableView: UIView!
    
    var imageInt = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageInt = 1;
        
        // Initialize Tap Gesture Recognizer
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(doSingleTap))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doDoubleTap))
        
        // Configure Tap Gesture Recognizer
        singleTap.numberOfTapsRequired = 1
        doubleTap.numberOfTapsRequired = 2

        // Add Tap Gesture Recognizer
        tappableView.addGestureRecognizer(singleTap)
        tappableView.addGestureRecognizer(doubleTap)

        singleTap.require(toFail: doubleTap)
    }
    
    @objc func doSingleTap(_ sender: UITapGestureRecognizer) {
        self.nextButton(sender);
    }
    
    @objc func doDoubleTap(_ sender: UITapGestureRecognizer) {
        self.previousButton(sender);
    }
    
    @IBAction func previousButton(_ sender: Any) {
        imageInt -= 1;
        self.imageGallery()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        imageInt += 1;
        self.imageGallery()
    }
    
    func imageGallery(){
        if(imageInt == 1){
            previousOutlet.isEnabled = false;
            imageview.image = UIImage(named: "beach.jpg")
        
        }else if(imageInt == 2){
            previousOutlet.isEnabled = true;
            imageview.image = UIImage(named: "bridge.jpg")
        
        }else if(imageInt == 3){
            nextOutlet.isEnabled = true;
            imageview.image = UIImage(named: "flower.jpg")
        
        }else if(imageInt == 4){
            nextOutlet.isEnabled = false;
            imageview.image = UIImage(named: "mountain.jpg")
        }else{
            
        }
    }
    
}


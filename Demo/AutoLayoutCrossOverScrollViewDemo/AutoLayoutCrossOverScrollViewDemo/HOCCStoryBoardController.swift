//
//  HOCCStoryBoardController.swift
//  AutoLayoutCrossOverScrollViewDemo
//
//  Created by Fasa Mo on 15/9/1.
//  Copyright (c) 2015年 FasaMo. All rights reserved.
//

import UIKit

class HOCCStoryBoardController: UIViewController {

    var didSetupConstraints = false

    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = UIImage(named: "hocc")
            if let image = imageView.image {
                let ratio = image.size.height / image.size.width
                imageView.autoMatchDimension(.Height, toDimension: .Width, ofView: imageView, withMultiplier: ratio)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UpdateViewConstraints
extension HOCCStoryBoardController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            
            // Remove ImageViewHeightConstraint
            if let imageViewHeightConstraint = imageViewHeightConstraint{
                imageView.removeConstraint(imageViewHeightConstraint)
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
}
//
//  HOCCCodeController.swift
//  AutoLayoutCrossOverScrollViewDemo
//
//  Created by Fasa Mo on 15/9/1.
//  Copyright (c) 2015年 FasaMo. All rights reserved.
//

import UIKit

class HOCCCodeController: UIViewController {

    var didSetupConstraints = false

    let scrollView = UIScrollView.newAutoLayoutView()
    
    let container = UIView.newAutoLayoutView()
    
    // MARK: Container Subviews
    let imageView: UIImageView = {
        let imageView = UIImageView.newAutoLayoutView()
        imageView.contentMode = .ScaleAspectFit
        imageView.image = UIImage(named: "hocc")
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let songNameLabel = UILabel.newAutoLayoutView()
        songNameLabel.text = "光荣之家"
        return songNameLabel
    }()
    
    let singerLabel: UILabel = {
        let singerLabel = UILabel.newAutoLayoutView()
        singerLabel.text = "何韵诗"
        return singerLabel
    }()
    
        // ContentView for lyricistLabel and composerLabel
    let contentView: UIView = {
        let contentView = UIView.newAutoLayoutView()
        return contentView
    }()
    
    let lyricistLabel: UILabel = {
        let lyricistLabel = UILabel.newAutoLayoutView()
        lyricistLabel.text = "填词：黄伟文"
        return lyricistLabel
    }()
    
    let composerLabel: UILabel = {
        let composerLabel = UILabel.newAutoLayoutView()
        composerLabel.text = "作曲：蔡一智"
        return composerLabel
    }()

    let lyricLabel: UILabel = {
        let lyricLabel = UILabel.newAutoLayoutView()
        lyricLabel.numberOfLines = 0
        lyricLabel.font = UIFont.systemFontOfSize(20)
        lyricLabel.textColor = .orangeColor()
        lyricLabel.textAlignment = .Center
        lyricLabel.text = "我的家很挤迫\n迫得差点我也放不下\n是我太有爱心吧\n慈善心理太升华\n破的好穿的好\n都需要有个老家吧\n让我每个也收下\n任你笑我还未化\n坏掉旧电视\n尚在希望有天给看上\n床下底的黑胶碟\n默默等点唱\n旧晚报过了气\n仍然静侯废纸商欣赏\nWOW~　件件杂物亦在伴我边等边唱\n全场在\nWHY　YA　YA　YA　YA YEAH~\n垃圾堆之内齐高唱\n全场在\nWHY　YA　YA　YA　YA YEAH~\n问我心等待谁收养\n若果终于只得我\n才能容纳破损\n谁能容纳我的短处"
        return lyricLabel
    }()
}

// MARK: LifeCircle
extension HOCCCodeController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .whiteColor()
        view.addSubview(scrollView)
        
        scrollView.addSubview(container)
        
        let subviews = [imageView, songNameLabel, singerLabel, contentView, lyricLabel]
        for subview in subviews {
            container.addSubview(subview)
        }
        
        contentView.addSubview(lyricistLabel)
        contentView.addSubview(composerLabel)
        
        view.setNeedsUpdateConstraints()
    }
}

// MARK: UpdateViewConstraints
extension HOCCCodeController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            
            // 1. Setup ScrollView constraints
            scrollView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
            
            // 2. Setup Container constraints
            container.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
                /* It is the Key */
            container.autoMatchDimension(.Width, toDimension: .Width, ofView: scrollView)
            
            imageView.autoAlignAxisToSuperviewAxis(.Vertical)
            imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 30)
            imageView.autoMatchDimension(.Width, toDimension: .Width, ofView: container, withMultiplier: 0.7)
            if let image = imageView.image {
                let ratio = image.size.height / image.size.width
                imageView.autoMatchDimension(.Height, toDimension: .Width, ofView: imageView, withMultiplier: ratio)
            }
            
            let views = [songNameLabel, singerLabel, contentView, lyricLabel]
            
            var previousView: UIView?
            for view in views {
                view.autoAlignAxisToSuperviewAxis(.Vertical)
                if let previousView = previousView {
                    view.autoPinEdge(.Top, toEdge: .Bottom, ofView: previousView, withOffset: 15)
                } else {
                    view.autoPinEdge(.Top, toEdge: .Bottom, ofView: imageView, withOffset: 30)
                }
                previousView = view
            }

            lyricLabel.autoSetDimension(.Width, toSize: 230)
            lyricLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 80)
            
            // 3. Setup ContentView constraints
            lyricistLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Right)
            composerLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: lyricistLabel, withOffset: 50)
            composerLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: lyricistLabel)
            composerLabel.autoPinEdgeToSuperviewEdge(.Trailing)
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
}
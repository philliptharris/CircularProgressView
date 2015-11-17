//
//  CircularProgressView.swift
//  CircularProgressExample
//
//  Created by Phillip Harris on 11/17/15.
//  Copyright © 2015 Phillip Harris. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {
    
    @IBInspectable var trackWidth: CGFloat = 6.0
    @IBInspectable var trackTint: UIColor? = UIColor(white: 0.9, alpha: 1.0)
    @IBInspectable var progressTint: UIColor? = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0) {
        didSet {
            self.label.textColor = progressTint
        }
    }
    
    @IBInspectable var progress: Float = 0.0 {
        didSet {
            label.text = String(format: "%.0f%%", progress * 100.0)
            setNeedsDisplay()
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = self.progressTint
        label.text = "0%"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(10.0, weight: UIFontWeightBold)
        return label
    }()
    
    //===============================================
    // MARK: - drawRect
    //===============================================
    
    override func drawRect(rect: CGRect) {
        
        let centerX = CGRectGetWidth(rect)/2.0
        let startAngle = CGFloat(-1.0 * M_PI_2)
        var endAngle = startAngle + CGFloat(2.0 * M_PI)
        
        let trackArc = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerX), radius: centerX - trackWidth/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        trackArc.lineWidth = trackWidth
        trackTint?.setStroke()
        trackArc.stroke()
        
        let progressAngle = CGFloat(progress) * CGFloat(2.0 * M_PI)
        endAngle = startAngle + progressAngle
        let progressArc = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerX), radius: centerX - trackWidth/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        progressArc.lineWidth = trackWidth
        progressTint?.setStroke()
        progressArc.stroke()
    }
    
    //===============================================
    // MARK: - Init
    //===============================================
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        let subview = label
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
        self.addConstraint(NSLayoutConstraint(item: subview, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: subview, attribute: .Right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: subview, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: subview, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
    }
}

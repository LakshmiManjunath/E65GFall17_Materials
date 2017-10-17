//
//  XView.swift
//  Lecture06
//
//  Created by Van Simmons on 10/16/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

@IBDesignable class XView: UIView {

    @IBInspectable var fillColor = UIColor.black
    @IBInspectable var strokeColor = UIColor.lightGray
    @IBInspectable var size = 3
    @IBInspectable var inset = CGFloat(2.0)
    @IBInspectable var lineWidth = CGFloat(2.0)
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let cellSize = CGSize(
            width: rect.size.width / CGFloat(size),
            height: rect.size.height / CGFloat(size)
        )
        (0 ..< size).forEach { row in
            (0 ..< size).forEach { col in
                let subRect = CGRect(
                    x: rect.origin.x + (CGFloat(col) * cellSize.width) + inset + (lineWidth / 2.0),
                    y: rect.origin.y + (CGFloat(row) * cellSize.height) + inset + (lineWidth / 2.0),
                    width: cellSize.width - ((2.0 * inset) + (lineWidth)),
                    height: cellSize.height - ((2.0 * inset) + (lineWidth))
                )
                let path = UIBezierPath(ovalIn: subRect)
                fillColor.setFill()
                path.fill()
            }
        }
            (0 ... size).forEach { col in
                let fromPoint = CGPoint(
                    x: CGFloat(rect.origin.x + (CGFloat(col) * cellSize.width)),
                    y: CGFloat(rect.origin.y)
                )
                let toPoint = CGPoint(
                    x: CGFloat(rect.origin.x + (CGFloat(col) * cellSize.width)),
                    y: CGFloat(rect.origin.y + rect.size.height)
                )
                let verticalPath = UIBezierPath()
                verticalPath.lineWidth = lineWidth
                verticalPath.move(to: fromPoint)
                verticalPath.addLine(to: toPoint)
                strokeColor.setStroke()
                verticalPath.stroke()
            }
        (0 ... size).forEach { row in
            let fromPoint = CGPoint(
                x: CGFloat(rect.origin.x),
                y: CGFloat(rect.origin.y + (CGFloat(row) * cellSize.height))
            )
            let toPoint = CGPoint(
                x: CGFloat(rect.origin.x + rect.size.width),
                y: CGFloat(rect.origin.y + (CGFloat(row) * cellSize.height))
            )
            let horizontalPath = UIBezierPath()
            horizontalPath.lineWidth = lineWidth
            horizontalPath.move(to: fromPoint)
            horizontalPath.addLine(to: toPoint)
            strokeColor.setStroke()
            horizontalPath.stroke()
        }
    }

}

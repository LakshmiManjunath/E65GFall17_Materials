//
//  XView.swift
//  Lecture06
//
//  Created by Van Simmons on 10/16/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

@IBDesignable class XView: UIView {
    
    @IBInspectable var emptyFillColor = UIColor.lightGray
    @IBInspectable var aliveFillColor = UIColor.lightGray
    @IBInspectable var bornFillColor = UIColor.lightGray
    @IBInspectable var diedFillColor = UIColor.lightGray
    @IBInspectable var strokeColor = UIColor.darkGray
    @IBInspectable var size = 3 {
        didSet {
            grid = Grid(size, size) //{ _ -> CellState in
//                return arc4random_uniform(3) == 2 ? .alive : .empty
//            }
        }
    }
    @IBInspectable var inset = CGFloat(2.0)
    @IBInspectable var lineWidth = CGFloat(2.0)
    
    var grid: Grid = Grid(3,3)
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let rect = CGRect(
            x: rect.origin.x + (lineWidth/2.0),
            y: rect.origin.y + (lineWidth/2.0),
            width: rect.size.width - lineWidth,
            height: rect.size.height - lineWidth
        )
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
                var color = emptyFillColor
                switch grid[(row,col)] {
                case .alive: color = aliveFillColor
                case .died: color = diedFillColor
                case .born: color = bornFillColor
                case .empty: color = emptyFillColor
                }
                color.setFill()
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
    
    var lastTouchedPosition: Position? = nil
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else { return }
        let touch = touches.first!
        let pos = convert(touch: touch)
        let state = grid[pos]
        grid[pos] = state.isAlive ? .empty : .alive
        lastTouchedPosition = pos
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else { return }
        guard touches.count == 1 else { return }
        let touch = touches.first!
        let pos = convert(touch: touch)
        guard pos.row != lastTouchedPosition?.row || pos.col != lastTouchedPosition?.col else { return }
        let state = grid[pos]
        grid[pos] = state.isAlive ? .empty : .alive
        lastTouchedPosition = pos
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else { return }
        lastTouchedPosition = nil
    }
    
    func convert(touch: UITouch) -> Position {
        let touchY = touch.location(in: self).y
        let gridHeight = frame.size.height
        let row = touchY / gridHeight * CGFloat(size)
        
        let touchX = touch.location(in: self).x
        let gridWidth = frame.size.width
        let col = touchX / gridWidth * CGFloat(size)
        
        return Position(row: Int(row), col: Int(col))
    }

}


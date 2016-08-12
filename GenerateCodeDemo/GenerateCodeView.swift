//
//  GenerateCodeView.swift
//  GenerateCodeDemo
//
//  Created by 张国荣 on 16/8/12.
//  Copyright © 2016年 BateOrganization. All rights reserved.
//

import UIKit


//extension String {
//    subscript (r: Range<Int>) -> String {
//        get {
//            let subStart = advence(self.startIndex, r.startIndex, self.endIndex)
//            let subEnd = advance(subStart, r.endIndex - r.startIndex, self.endIndex)
//            return self.substringWithRange(Range(start: subStart, end: subEnd))
//        }
//    }
//    func substring(from: Int) -> String {
//        let end = countElements(self)
//        return self[from..<end]
//    }
//    func substring(from: Int, length: Int) -> String {
//        let end = from + length
//        return self[from..<end]
//    }
//}


class GenerateCodeView: UIView {
    //随机产生颜色
    var randomColor = (Float)(arc4random()%255)/100.0
    // 验证码位数
    var codeNumber:Int = 4
    var codeString:String = ""
    //随机验证码数据源
    var dataArray:[String] = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.changeBgColor()
        self.CreateGenerateCodeAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //改变背景颜色
    func changeBgColor() -> Void {
        self.backgroundColor = self.generateColor()
    }
    
    // 随机验证码的view实现
    func CreateGenerateCodeAction() -> Void {
        codeString = ""
        for _ in 0...codeNumber-1 {
            var d = random()%dataArray.count-1
            if (d <= 0) {
                d = 0
            }else if (d >= dataArray.count) {
                d = dataArray.count - 1
            }
            print("---totalcount %d currentCount %d",dataArray.count, d)
            codeString = codeString.stringByAppendingString(dataArray[d])
        }
        self.setNeedsDisplay()
    }
    
    // 随机颜色
    func generateColor() -> UIColor {
        return UIColor.init(colorLiteralRed: (Float)(arc4random()%256)/256.0, green: (Float)(arc4random()%256)/256.0, blue: (Float)(arc4random()%256)/256.0, alpha: 1.0)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.changeBgColor()
        self.CreateGenerateCodeAction()
    }
    
    // 把随机码画上去
    override func drawRect(rect: CGRect) {
        
        if codeString.isEmpty {
            return;
        }
        
        self.backgroundColor = self.generateColor()
        
        let textString:String = codeString
        let charSize = textString.substringToIndex(textString.startIndex).sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(16)])
        
        let width = rect.size.width/CGFloat(codeNumber) - charSize.width - 5;
        let hight = rect.size.height - charSize.height;
        
        var mypoint:CGPoint
        // 计算每个字符
        
        var point_x:CGFloat
        var point_y:CGFloat
        
        let intWidth = UInt32(Float(width))
        let intHight = UInt32(Float(hight))
        
        for i in 0...textString.characters.count-1 {
            let c:CGFloat = CGFloat(i)
            let myIn:Int = Int(i)
            point_x = (CGFloat)(arc4random()%intWidth) + rect.size.width/(CGFloat)(textString.characters.count) * c
            point_y = (CGFloat)(arc4random()%intHight)
            mypoint = CGPointMake(point_x, point_y)
            
            let charStr = textString[textString.startIndex.advancedBy(myIn)]

            let bb:String = ""
             let t = bb.stringByAppendingString(String(charStr))
            t.drawAtPoint(mypoint,withAttributes:([NSFontAttributeName : UIFont.systemFontOfSize(16)]))
        }
        
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 1)
        var px:CGFloat = 0.0
        var py:CGFloat = 0.0
        for _ in 0...5 {
            CGContextSetStrokeColorWithColor(context, self.generateColor().CGColor)
            px = CGFloat(arc4random()%UInt32(Float(rect.size.width)))
            py = CGFloat(arc4random()%UInt32(Float(rect.size.height)))
            CGContextMoveToPoint(context, px, py)
            px = CGFloat(arc4random()%UInt32(Float(rect.size.width)))
            py = CGFloat(arc4random()%UInt32(Float(rect.size.height)))
            CGContextAddLineToPoint(context, px, py)
            CGContextStrokePath(context)
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   
    */

}

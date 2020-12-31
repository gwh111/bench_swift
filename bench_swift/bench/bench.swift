//
//  File.swift
//  bench_swift
//
//  Created by gwh on 2020/12/30.
//

import Foundation

//@_exported import bench_swift
//This import is not friendly, so you can drag this file in your project.

class bench: NSObject {
    static let ui = bench()
    
    static public func currentVC() -> UIViewController {
        return ccs.currentVC()
    }
    
    static public func pushViewController(vc:UIViewController) {
        ccs.pushViewController(vc)
    }
    
    public func borderView() -> UIView {
        let borderView = UIView()
        borderView.frame = CGRect(x: RH(10), y: RH(10), width: WIDTH()-RH(20), height: RH(100))
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.gray.cgColor
        borderView.layer.cornerRadius = RH(4)
        return borderView
    }
}

public func RGBA(_ red:Float, _ green:Float, _ blue:Float, _ alpha:Float) -> UIColor {
    return UIColor.cc_rgbA(red, green: green, blue: blue, alpha: alpha)
}

public func RGB(_ red:Float, _ green:Float, _ blue:Float) -> UIColor {
    return UIColor.cc_rgbA(red, green: green, blue: blue, alpha: 1)
}

public func RH(_ width:CGFloat) -> CGFloat {
    return CGFloat(ccs.coreUI()!.relativeHeight(Float(width)))
}

public func RF(_ size:CGFloat) -> UIFont {
    return ccs.coreUI()!.relativeFont(Float(size))
}

public func WIDTH() -> CGFloat {
    return CGFloat(ccs.coreUI()!.width())
}

public func HEIGHT() -> CGFloat {
    return CGFloat(ccs.coreUI()!.height())
}

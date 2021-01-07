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
    //MARK:Store UIKit objects for display
    static let ui = bench_ui()
    
    //MARK:Store other objects
    static public func currentVC() -> UIViewController {
        ccs.currentVC()
    }
    
    static public func currentTabBarC() -> UIViewController {
        ccs.currentTabBarC()
    }
    
    static public func database() -> CC_DataBaseStore {
        ccs.dataBaseStore()
    }
    
    static public func timer() -> CC_Timer {
        ccs.timer()
    }
    
    //MARK:Function
    static public func pushViewController(vc:UIViewController) {
        ccs.pushViewController(vc)
    }
    
    static public func bundlePlist(path:String) -> NSDictionary {
        if let plist = ccs.bundlePlist(withPath: path) as NSDictionary? {
            return plist
        }
        return [:]
    }
    
    static public func getUserDefault(key:String) -> String {
        if let value = ccs.getDefault(key) as? String {
            return value
        }
        return ""
    }
    
    static public func saveUserDefault(key:String,value:String) {
        ccs.saveDefaultKey(key, value: value)
    }
    
    static public func showNotice(_ content:String) {
        ccs.showNotice(content)
    }
    
    static public func AESEncode(key:String, string:String) -> Data {
        string.cc_convertToUTF8data()
        if let data = string.cc_convertToUTF8data() {
            if let result = CC_AES.encrypt(withKey: key, iv: "1", data: data) {
                return result
            }
        }
        return Data()
    }
    
    static public func AESDecode(key:String, data:Data) -> String {
        if let result = CC_AES.decrypt(withKey: key, iv: "1", data: data) as NSData? {
            if let resultString = result.cc_convertToUTF8String() {
                return resultString
            }
        }
        return ""
    }
}

//MARK:Store UIKit objects
class bench_ui: NSObject {
    
    public func borderView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: RH(10), y: RH(10), width: WIDTH()-RH(20), height: RH(100))
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.cornerRadius = RH(4)
        return view
    }
    
    public func borderButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("大家", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.titleLabel?.font = RF(14)
        button.frame = CGRect(x: RH(10), y: RH(10), width: RH(80), height: RH(40))
//        button.layer.cornerRadius = RH(4)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }
}

//MARK:Macro
public func RGBA(_ red:Float, _ green:Float, _ blue:Float, _ alpha:Float) -> UIColor {
    return UIColor.cc_rgbA(red, green: green, blue: blue, alpha: alpha)
}

public func RGB(_ red:Float, _ green:Float, _ blue:Float) -> UIColor {
    return UIColor.cc_rgbA(red, green: green, blue: blue, alpha: 1)
}

public func HEXA(_ hex:String, _ alpha:Float) -> UIColor {
    return UIColor.cc_hexA(hex, alpha: alpha)
}

public func HEX(_ hex:String) -> UIColor {
    return UIColor.cc_hexA(hex, alpha: 1)
}

public func RH(_ width:CGFloat) -> CGFloat {
    return CGFloat(ccs.coreUI()!.relativeHeight(Float(width)))
}

public func RF(_ size:CGFloat) -> UIFont {
    return ccs.coreUI()!.relativeFont(Float(size))
}

public func BRF(_ size:CGFloat) -> UIFont {
    return ccs.coreUI()!.relativeFont("Helvetica-Bold", fontSize: Float(size))
}

public func WIDTH() -> CGFloat {
    return CGFloat(ccs.coreUI()!.width())
}

public func HEIGHT() -> CGFloat {
    return CGFloat(ccs.coreUI()!.height())
}

public func SAFEBOTTOM() -> CGFloat {
    return CGFloat(ccs.safeBottom())
}

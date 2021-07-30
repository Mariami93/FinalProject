//
//  LocalizedLabeL.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import UIKit

class LocalizedLabeL: UILabel {

    @IBInspectable var key: String?
    @IBInspectable var caps: Bool = false
    @IBInspectable var bold: Bool = false
    @IBInspectable var doubleDots: Bool = false
    override var text: String? {
        didSet {
            setup()
        }
    }
 
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
//        setup()
    }
    func capsed () {
    self.caps = true
    }
    
    
    func setFontByName(_ name: String){
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
                
            case 1136:
                print("iPhone 5 or 5S or 5C")
                self.font = UIFont(name: name, size: ((self.font?.pointSize)!))

            default:
                self.font = UIFont(name: name, size: (self.font?.pointSize)!)

                
            }
            
        }
    }
        
    func setup(){
        
        
        if doubleDots {
            if key != nil {
                if let text = self.text,
                    !text.contains(":") {
                    self.text = text + ":"
                }
            }
            
        }
        
        let currentLang = Utilities.language()
        if currentLang == Language.Geo {
            if( caps ){
                if bold {
                    setFontByName("")

                } else {
                    setFontByName("")
                }

            }else{
                
                if bold {
                    setFontByName("")
                    
                } else {
                    setFontByName("")
                }            }
            
        } else {
            if caps {
                if self.text != self.text?.uppercased() {
                    self.text = self.text?.uppercased()
                }
            }
            if bold {
                
                setFontByName("")
            } else {
                setFontByName("")
            }
        }
     }

}

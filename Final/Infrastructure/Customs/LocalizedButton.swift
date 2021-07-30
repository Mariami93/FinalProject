//
//  LocalizedButton.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import UIKit

class LocalizedButton : UIButton {
   @IBInspectable var key: String?
   @IBInspectable var caps: Bool = false
   
   //    override var titleLabel: String? {
   //        didSet {
   //            setup()
   //        }
   //    }
   
   override init(frame: CGRect) {
       // 1. setup any properties here
       let currentLang = Utilities.language()
       
       // 2. call super.init(frame:)
       super.init(frame: frame)
       setup()

   }
   
   func capsed () {
       self.caps = true
   }
   required init?(coder aDecoder: NSCoder) {
       // 1. setup any properties here
       
       // 2. call super.init(coder:)
       super.init(coder: aDecoder)
       setup()
   }
   
   func setFontByName(_ name: String){
       //        self.font = UIFont(name: name, size: (self.font.pointSize))!
   }
   
   
   func setup(){
    
       let currentLang = Utilities.language()
       if currentLang == Language.Geo {

           if(!caps){
//               self.titleLabel?.font =  UIFont(name: "NotoSansGeorgian-Regular", size: (self.titleLabel?.font.pointSize)!)

           }else{
//               self.titleLabel?.font =  UIFont(name: "NotoSansGeorgian-Regular", size: (self.titleLabel?.font.pointSize)!)
           }
       } else {
//           self.titleLabel?.font =  UIFont(name: "MyriadPro-Regular", size: (self.titleLabel?.font.pointSize)!)
           if caps {
               if self.titleLabel?.text != self.titleLabel?.text!.uppercased() {
                   self.titleLabel?.text = self.titleLabel?.text!.uppercased()
               }
           }
       }
       
   }
   
   
}

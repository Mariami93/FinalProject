//
//  LocalizedTextField.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import UIKit

class LocalizedTextField: UITextField {
    
    
    override var text: String? {
        didSet {
            setup()
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
        setup()
    }
    func hideKeyboard () {
        self.resignFirstResponder()
    }
    
    func setup(){
        
        self.attributedPlaceholder = NSAttributedString(string:
                                                            self.placeholder?.localized ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    func initialize(){
        //        AppUtils.addDoneButton(self, doneTarget: self, doneAction: #selector(self.doneSellTextfield))
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44)); // TODO delete this
        toolbar.barStyle = UIBarStyle.default
        toolbar.barTintColor = UIColor.blue
        toolbar.layer.backgroundColor = UIColor.blue.cgColor
        toolbar.isTranslucent = false
        
        let itemDone  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.resignFirstResponder))
        
        itemDone.tintColor = UIColor.black
        let itemSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action:#selector(self.doneAction))
        
        toolbar.items = [itemSpace, itemDone]
        self.inputAccessoryView = toolbar
        
    }
    
    @objc func doneAction() {
      
        self.resignFirstResponder()
    }

    
}

//
//  CheckBoxButton.swift
//  SwiftCheckBox
//
//  Created by Ian-Andoni Magarzo Fernandez on 25/03/2020.
//

import UIKit

//public protocol CheckBoxButtonDelegate: class {
//
//    func selectedChange(isSelected: Bool)
//
//}

public class CheckBoxButton: UIButton {
    
//    public weak var delegate: CheckBoxButtonDelegate?
    public var selectedBlock: ((Bool)->())?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard buttonType == .custom else {
            fatalError("Requires to set [Type: Custom] from the storyBoard")
        }
        commonInit()
    }
    
    private func commonInit() {
        setTitle("", for: .normal)
        let appBundle = Bundle(for: Self.self)
        print("App bundle: \(appBundle)")
        let assetsBundleURL = appBundle.bundleURL.appendingPathComponent("SwiftCheckBoxImgs.bundle")
        guard let assetsBundle = Bundle(url: assetsBundleURL) else {
            fatalError("nil bundle")
        }
        
//        let uncheckedImg = UIImage(named: "icons8-unchecked_checkbox.pdf",
//                                   in: assetsBundle, compatibleWith: nil)
        let uncheckedImg = UIImage(named: "icons8-unchecked_checkbox.pdf",
                                   in: assetsBundle, compatibleWith: nil)
        
        let image = UIImage(named: "Frameworks/SwiftCheckBox.framework/SwiftCheckBoxImgs.bundle/icons8-facebook_old")
        
        let imageF = UIImage(named: "Frameworks/SwiftCheckBox.framework/SwiftCheckBoxImgs.bundle/icons8-facebook_old 2")
        


        
        let imgsBundle = Bundle(url: Bundle(for: CheckBoxButton.self).bundleURL.appendingPathComponent("SwiftCheckBoxImgs.bundle", isDirectory: true))
        let checkedImgTest = UIImage(named: "icons8-unchecked_checkboxPNG", in: imgsBundle, compatibleWith: nil)
        
        let uncheckedImgPNG = UIImage(named: "icons8-unchecked_checkboxPNG",
                                      in: assetsBundle, compatibleWith: nil)
        setImage(uncheckedImgPNG, for: .normal)
        setTitle("", for: .selected)
        
        let checkedImg = UIImage(podAssetName: "icons8-search-pdf") //FUNCIONA
        setImage(checkedImg, for: .selected)
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc private func touchUpInside() {
        self.isSelected = !self.isSelected
//        delegate?.selectedChange(isSelected: self.isSelected)
        selectedBlock?(self.isSelected)
    }

}

//https://github.com/CocoaPods/CocoaPods/issues/1892
extension UIImage {
    
   convenience init?(podAssetName: String) {
       let podBundle = Bundle(for: CheckBoxButton.self)
      
       /// A given class within your Pod framework
       guard let url = podBundle.url(forResource: "SwiftCheckBoxImgs",
                                     withExtension: "bundle") else {
           return nil
                                       
       }

       self.init(named: podAssetName,
                 in: Bundle(url: url),
                 compatibleWith: nil)
   }
    
}

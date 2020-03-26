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
        let uncheckedImg = UIImage(named: "unchecked_checkbox", in: Bundle(for: CheckBoxButton.self), compatibleWith: nil)
        setImage(uncheckedImg, for: .normal)
        setTitle("", for: .selected)
        let checkedImg = UIImage(named: "checked_checkbox", in: Bundle(for: CheckBoxButton.self), compatibleWith: nil)
        setImage(checkedImg, for: .selected)
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc private func touchUpInside() {
        self.isSelected = !self.isSelected
//        delegate?.selectedChange(isSelected: self.isSelected)
        selectedBlock?(self.isSelected)
    }

}

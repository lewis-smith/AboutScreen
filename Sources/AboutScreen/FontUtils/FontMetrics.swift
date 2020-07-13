//
//  File.swift
//  
//
//  Created by Lewis Smith on 05/05/2020.
//

import UIKit

extension UIFont {
    public var baseline: CGFloat {
        return lineHeight + descender
    }

    public var topline: CGFloat {
        return descender * -1
    }

    public func offsetForBaseline(of font: UIFont) -> CGFloat {
        return font.baseline - self.baseline
    }

    public func offsetForTopline(of font: UIFont) -> CGFloat {
        return font.topline - self.topline
    }
}

//
//  CollapsingHeaderLayoutAttributes.swift
//
//  Created by Manu K on 10/01/18.
//  Copyright © 2018 Manu K. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit

open class CollapsingHeaderLayoutAttributes: UICollectionViewLayoutAttributes {
  open var progressiveness: CGFloat = 1.0
  open override var zIndex: Int{
    didSet{
      self.transform3D = CATransform3DMakeTranslation(0, 0, self.zIndex == 1 ? -1 :0)
    }
  }

  open override func copy(with zone: NSZone? = nil) -> Any {
    let copy = super.copy(with: zone) as! CollapsingHeaderLayoutAttributes
    copy.progressiveness = self.progressiveness
    return copy
  }
}
#endif

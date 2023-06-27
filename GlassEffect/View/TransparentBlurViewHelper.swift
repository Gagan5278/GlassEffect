//
//  TransparentBlurViewHelper.swift
//  GlassEffect
//
//  Created by Gagan Vishal  on 2023/06/27.
//

import SwiftUI

class TransparentBlurViewHelper: UIVisualEffectView {
    init(removeAllFilters: Bool) {
        super.init(effect: UIBlurEffect(style: .systemThinMaterial))
        
        if subviews.indices.contains(1) {
            subviews[1].alpha = 0
        }
        if let backdropLayer = layer.sublayers?.first {
            if removeAllFilters {
                backdropLayer.filters = []
            } else {
                backdropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}

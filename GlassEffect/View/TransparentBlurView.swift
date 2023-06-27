//
//  TransparentBlurView.swift
//  GlassEffect
//
//  Created by Gagan Vishal  on 2023/06/27.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    
    func makeUIView(context: Context) -> some UIView {
        return TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

#Preview {
    TransparentBlurView()
        .padding(15)
}

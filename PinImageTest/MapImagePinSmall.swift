//
//  MapImagePinSmall.swift
//  PinImageToImageTest
//
//  Created by Gakkie Gakkienl on 10/08/2024.
//

import SwiftUI

struct mapImagePinSmall: View {
    var body: some View {
        Button {
            print("Pin tapped!")
        } label: {
            Image(systemName: "arrowtriangle.up.fill")
                .frame(width: 44, height: 44, alignment: .center)
                .allowsHitTesting(true)
                .background(.gray)
        }
    }
}

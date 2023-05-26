//
//  prgsView.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        GeometryReader{view in
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .frame(width: 390, height: 395)
        }
        
    }
}

struct prgsView_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}

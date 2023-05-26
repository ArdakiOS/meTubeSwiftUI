//
//  SearchBar.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search : String
    var body: some View {
        HStack{
            TextField("Search", text: $search)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 15).stroke(.red, lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.top)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

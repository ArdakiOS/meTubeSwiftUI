//
//  SwiftUIView.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import SwiftUI

struct VideoListCell: View {
    @State var vid : VideoModel
    @State var dateString : String = ""
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: vid.thumbnail)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Loading()
                    .frame(width: 395, height: 300)
            }
            
            Text(vid.title)
                
                .font(.title2)
                .padding(.horizontal, 10)
                .multilineTextAlignment(.leading)
            Spacer().frame(height: 9)
            Text(dateString)
                .padding(.horizontal, 10)
                .font(.title3)
            
            
        }
        
        .onAppear{
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "EEEE, MMM dd"
            self.dateString = dateFormater.string(from: vid.published)
        }
        .foregroundColor(.white)
        
    }
}

struct VideoListCell_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

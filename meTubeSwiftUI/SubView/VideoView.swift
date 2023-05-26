//
//  VideoView.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        let web = WKWebView()
        return web
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct VideoView: View {
    @State var vid : VideoModel
    @State var dateString : String = ""
    var body: some View {
        VStack{
            let urlString = "https://www.youtube.com/embed/" + vid.videoId
            let url = URL(string: urlString)
            WebView(url: url!)
                .frame(height: 350)
                .padding(.bottom)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(vid.title)
                        .font(.system(size: 20, weight: .bold))
                    Text(dateString)
                        .font(.system(size: 15, weight: .semibold))
                    Divider().frame(height: 2).background(Color.pink)
                    Text(vid.desc)
                }
            }
            .padding(.horizontal, 10)
            
        }
        .onAppear{
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "EEEE, MMM dd"
            self.dateString = dateFormater.string(from: vid.published)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

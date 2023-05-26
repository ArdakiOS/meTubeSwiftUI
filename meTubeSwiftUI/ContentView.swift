//
//  ContentView.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fetcher = VideoFetcher()
    @State private var path = NavigationPath()
    @State var search = ""
    var body: some View {
        NavigationStack(path: $path){
            SearchBar(search: $search)
            ScrollView {
                ForEach((fetcher.videos), id: \.self){ vid in
                    NavigationLink(value: vid) {
                        VStack{
                            if search.isEmpty{
                                Button {
                                    path.append(vid)
                                } label: {
                                    VideoListCell(vid: vid)
                                }.buttonStyle(.plain)
                            }
                            else if vid.title.lowercased().contains(search.lowercased()){
                                Button {
                                    path.append(vid)
                                } label: {
                                    VideoListCell(vid: vid)
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("meTube")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .bold()
                }
                
            }
            .navigationDestination(for: VideoModel.self, destination: { video in
                VideoView(vid: video)
            })
            .onAppear{
                fetcher.fetch()
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

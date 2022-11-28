//
//  ContentView.swift
//  TravelApp
//
//  Created by Tiara H on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    @State private var isShowingSheet = false
    
    // MARK: -PROPERTIES
    
    // MARK: -BODY
    var body: some View {
        ZStack {
            
            Image("go-to-beach")
                .resizable()
                
                .aspectRatio(contentMode: .fill)
                .overlay {
                    Color .black
                        .opacity(0.4)
                }
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading) {
                headerView
                Spacer()
                
                titleView
                    .padding(.bottom, 250)
                Spacer()
            }
   
            
          
            
        }
    }
}

// MARK: -PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK : - HeaderView
extension ContentView {
    private var headerView: some View {
        HStack(alignment: .center, spacing: 100) {
            Button {
                isShowingAlert.toggle()
            } label: {
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .font(.system(size: 24))
                    .background {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .opacity(0.4)
                    }
            }.alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Not yet available"), message: Text("Currently on active development"), dismissButton: .default(Text("OK")))
            }
            
            Text("Travel")
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 24)
            
            Button {
                isShowingSheet.toggle()
            } label: {
                Image(systemName: "cart.badge.plus")
                    .renderingMode(.original)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .background{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .opacity(0.4)
                    }
            }.sheet(isPresented: $isShowingSheet) {
                HStack {
                    Text("Pink Beach, Flores")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .foregroundColor(.black)
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .foregroundColor(.yellow)
                        .padding(.trailing, 0)
                    
                    Text("4.8")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 20)
                
                HStack {
                    DetailModal(title: "Walk", symbol: "figure.walk.motion", symbolColor: .green)
                    DetailModal(title: "Food", symbol: "fork.knife.circle.fill", symbolColor: .orange)
                    DetailModal(title: "Stays", symbol: "house.fill", symbolColor: .blue)
                    DetailModal(title: "Ride", symbol: "sailboat.fill", symbolColor: .purple)
                }
                .padding(.bottom, 30)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("About Destination")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    Text("Pink Beach, or Pantai Merah, as it aptly named, is one of seven pink beaches on the planet. This was awesome")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                
                
                HStack {
                    Text("$81,39")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.blue)
                    Spacer()
                    Link(destination: URL(string: "https://www.google.com/maps?cid=11470303954556706768")! ) {
                        
                        HStack(alignment: .center) {
                            Image(systemName: "bag")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            
                            Text("Join Tour")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background{
                            LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .cornerRadius(30)
                    }
                }
                .padding(.horizontal, 20)
                .presentationDetents([.medium, .fraction(0.6)])
            }
        }
    }
}

// MARK : - TitleView
extension ContentView {
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Start your\nAdventure\nand\nGo\nTravel Now")
                .font(.system(size: 50, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
               
            
            Text("Discover lcoal destinations beauty with\nBluesky and travel with pride")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

// MARK: - DetailModal
struct DetailModal: View {
    var title: String
    var symbol: String
    var symbolColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundColor(symbolColor)
            
            Text(title)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.black)
                .padding(.top, 8)
        }
        .frame(minWidth: 10, maxWidth: .infinity, maxHeight: 50)
        .padding(.vertical, 25)
        .background(.cyan .opacity(0.1))
    }
}

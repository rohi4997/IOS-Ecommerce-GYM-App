//
//  HomeScreen.swift
//  EcommerceGymApplication
//
//  Created by Rohit Kumar Dhaker on 04/10/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
                Image(systemName: "cart.badge.plus")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text("Hey")
                .font(.title)
                .fontWeight(.bold)
            Text("Find fresh fruit that you want")
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.gray.opacity(0.3))
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search fresh fruits")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }.padding()
                )
                .frame(width: 350, height: 50, alignment: .center)
            
            Text("Top Selling")
                .font(.title)
                .fontWeight(.bold)
            
            HoriZontalScrollView()
            
            Text("Near You")
                .font(.title)
                .fontWeight(.bold)
            
            VerticalScrollView()
            
            Spacer()
            
        }.padding()
        
            .navigationBarTitle("")
//            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

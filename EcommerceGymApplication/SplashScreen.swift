//
//  SplashScreen.swift
//  EcommerceGymApplication
//
//  Created by Rohit Kumar Dhaker on 04/10/22.
//

import SwiftUI
import GoogleSignIn
import Firebase

struct SplashScreen: View {
    @State var isActive :Bool = false
    @State var opacity : CGFloat = 0.1
    
    
    var body: some View {
        if isActive {
            OnBoardingScreenView()
        }else{
            ZStack{
                Image("asq")
                    .opacity(opacity)
                ProgressView()
                    .offset(y:250)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100, alignment: .center)
            }
            .background(.black)
            .onAppear{
                withAnimation(.easeIn(duration: 1.0)){
                    self.opacity = 1.0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

//
//  OnBoradingScreenView.swift
//  EcommerceGymApplication
//
//  Created by Rohit Kumar Dhaker on 04/10/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct OnBoardingScreenView: View {
    @State var isLoading : Bool = false
    @State var isLoggedIn: Bool = false
    
    init(){
        if Auth.auth().currentUser != nil{
            self.isLoggedIn = true
        }
    }
    
    var body: some View {
        
        if isLoggedIn {
            HomeScreen()
        }else{
            ZStack{
                Image("gymbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Button{
                    handleLogin()
                }label: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("6"))
                        .frame(width: 280, height: 60, alignment: .trailing)
                        .overlay(
                            HStack(spacing: 10){
                                Image("google")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .leading)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(15)
                                Text("Continue With Google")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        )
                }
                
            }
            .background(.black)
            .overlay(
                    ZStack{
                        if isLoading{
                            Color.black
                                .opacity(0.25)
                                .ignoresSafeArea()
                            ProgressView()
                                .font(.title2)
                                .frame(width: 60, height: 60)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                )
        }
    }
    
    
    
    // handle login..
    func handleLogin(){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        isLoading = true
        
        if Auth.auth().currentUser != nil{
            isLoggedIn = true
        }else{
            GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {
                user, err in
                
                if let error = err {
                    isLoading = false
                    print(err?.localizedDescription)
                  return
                }

                guard
                  let authentication = user?.authentication,
                  let idToken = authentication.idToken else {
                    isLoading = false
                    return
                }

                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: authentication.accessToken)

                // FireBase Auth..
                
                Auth.auth().signIn(with: credential){result , err in
                    isLoading = false
                    
                    if let error = err {
                        print(err?.localizedDescription)
                      return
                    }
                    
                    // Displaying User Name..
                    guard let user = result?.user else{
                        return
                    }
                    print(user.displayName ?? "Success")
                    isLoggedIn = true
                }
            }
        }
        
        
    }
}



























struct OnBoardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreenView()
    }
}

// Extending View to get Screen Bounds
extension View{
    func getReact()->CGRect{
        return UIScreen.main.bounds
    }
    //Retriving RootView Controller
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return.init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return.init()
        }
        return root
    }
}



































//            VStack(spacing: 30){
//                Spacer()
//                Image("img")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .padding()
//
//                VStack(alignment: .leading, spacing: 10){
//                    Text("Order Your Favourite Fruits")
//                        .fontWeight(.bold)
//                        .font(.system(.title))
//                    Text("Eat fresh fruits and try to be healthy")
//                        .font(.system(.title3))
//                        .foregroundColor(.black.opacity(0.7))
//                }
//                Spacer()
//                NavigationLink(destination: HomeScreen()) {
//                    RoundedRectangle(cornerRadius: 12)
//                        .fill(Color("6"))
//                        .frame(width: 280, height: 60, alignment: .trailing)
//                        .overlay(
//                            HStack(spacing: 10){
//                                Text("Next")
//                                    .font(.title)
//                                    .fontWeight(.bold)
//                                Image(systemName: "chevron.right")
//                            }.foregroundColor(.black)
//                        )
//                }
//                Spacer()
//            }
//            .navigationBarTitle("")
//            .navigationBarHidden(true)









//NavigationView{
//    ZStack{
//        Image("gymbg")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//        NavigationLink(destination: HomeScreen()) {
//            RoundedRectangle(cornerRadius: 12)
//                .fill(Color("6"))
//                .frame(width: 280, height: 60, alignment: .trailing)
//                .overlay(
//                    HStack(spacing: 10){
//                        Image("google")
//                            .resizable()
//                            .frame(width: 50, height: 50, alignment: .leading)
//                            .aspectRatio(contentMode: .fill)
//                            .cornerRadius(15)
//                        Text("Continue With Google")
//                            .font(.title3)
//                            .fontWeight(.bold)
//                    }
//                )
//        }
//        .offset(y:300)
//    }
//    .background(.black)
//
//
//
//}

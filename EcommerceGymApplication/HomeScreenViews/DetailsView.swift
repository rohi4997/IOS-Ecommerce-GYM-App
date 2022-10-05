//
//  DetailsView.swift
//  EcommerceGymApplication
//
//  Created by Rohit Kumar Dhaker on 04/10/22.
//

import SwiftUI

struct RoundedCornerShape : Shape{
    let corners : UIRectCorner
    let radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
         let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Counter : View {
    @State var count = 0
    var body: some View {
        HStack(spacing: 25){
            Button {
                count += 1
            } label: {
                Image(systemName: "plus")
            }
            Text("\(count)")
                .font(.title)
            Button {
                if count != 0{
                    count -= 1
                }
            } label: {
                Image(systemName: "minus")
            }
        }
        .foregroundColor(.black)
        .padding(.horizontal)
        .background(Color("bgColor").opacity(0.1))
        .cornerRadius(10)
        .frame(width: 140, height: 40)
    }
}

struct DetailsView: View {
    @State var fruit: fruitTitle
    var body: some View {
//        Text("\(fruit.rawValue)")
        VStack(alignment: .leading, spacing: 25){
            Image("bg")
                .resizable()
                .clipShape(RoundedCornerShape.init(corners: [.bottomLeft, .bottomRight], radius: 50))
                .frame(width: .infinity, height: .infinity, alignment: .top)
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Image("\(fruit.rawValue)")
                        .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                        .offset(y:20)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                )
            Spacer()
            Text("\(fruit.rawValue) - Medium")
                .fontWeight(.medium)
                .font(.system(.title))
                .padding(.horizontal)
                .textCase(.uppercase)
            
            Text("Each (500g - 700g)")
                .padding(.horizontal)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .padding(.horizontal)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(6)
            
            HStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("bgColor"))
                    .cornerRadius(5)
                    .opacity(0.5)
                    .overlay(Image(systemName: "hourglass"))
                    .font(.system(size: 40))
                    .frame(width: 50, height: 50)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Delivery Time")
                    Text("25-30 mins")
                }
            }
            
            HStack{
                Text("$1.99")
                    .font(.title)
                Spacer()
                Counter()
            }.padding(.horizontal)
  
            
            Image("bg")
                .resizable()
                .frame(width: 350, height: 50, alignment: .center)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Text("Add to Cart")
                        .font(.system(.title3))
                        .fontWeight(.medium)
                )
                .padding(.horizontal)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(fruit: .apple)
    }
}

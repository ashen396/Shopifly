//
//  SearchscreenView.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI

struct SearchscreenView: View {
    
    @State private var search = "Shoes"
    
    var body: some View {
        VStack{
            Spacer()
                .frame(width: Constants.screenWidth, height: 25, alignment: .center)
            
            //Header
            HStack{
                HStack{
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                    
                    Text("Shopifly")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("John Doe")
                            .font(.title2)
                        
                        Text("Colombo")
                            .font(.callout)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                    
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                }
            }.padding(.horizontal, 25)
            .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
            
            HStack{
                TextField("Search", text: $search)
                    .font(.title3)
                    .padding(EdgeInsets(top: 0, leading: 48, bottom: 0, trailing: 15))
                    .frame(width: UIScreen.main.bounds.width - 140, height: 48)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .overlay(HStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 18, height: 18, alignment: .center)
                            .padding(.leading, 15)
                            .foregroundColor(Color(UIColor.systemGray2))
                        Spacer()
                    })
                
                Spacer()
                    .frame(width: 25, height: 48, alignment: .center)
                
                Text("Cancel")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 40, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: true){
                HStack{
                    Text("Items (3)")
                }.font(.title3)
                .foregroundColor(Color(UIColor.systemGray))
                .padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                
                LazyVStack{
                    ProductListView()
                    ProductListView()
                    ProductListView()
                }
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                
                HStack{
                    Text("Shops (0)")
                }.font(.title3)
                .foregroundColor(Color(UIColor.systemGray))
                .padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
            }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct SearchscreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchscreenView()
    }
}

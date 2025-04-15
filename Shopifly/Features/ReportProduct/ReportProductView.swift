//
//  ReportProductView.swift
//  Shopifly
//
//  Created by Mac on 4/15/25.
//

import SwiftUI

struct ReportProductView: View {
    
    @State private var pickerSelection = ""
    @State private var summary = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Report Item")
                    .font(.title)
                    .fontWeight(.bold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            HStack{
                Text("Type of report")
                    .font(.title3)
                    .fontWeight(.semibold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 10, alignment: .center)
            
            Picker("Incorrect Information", selection: $pickerSelection) {
                Text("Incorrect Information")
                Text("Counterfeit Product")
            }.pickerStyle(MenuPickerStyle())
            .padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            HStack{
                Text("Attach images (optional)")
                    .font(.title3)
                    .fontWeight(.semibold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
            
            VStack{
                HStack{
                    Text("Summary")
                        .font(.title3)
                        .fontWeight(.semibold)
                }.padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                
                TextEditor(text: $summary)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .frame(width: Constants.screenWidth, height: 200, alignment: .top)
                    .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .padding(.horizontal, 25)
                            .foregroundColor(Color.gray)
                            .frame(width: Constants.screenWidth, height: 200, alignment: .top)
                    )
            }
            
            CustomButton(title: "Report", foregroundColor: .white, backgroundColor: .blue)
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight - 150, alignment: .top)
    }
}

struct ReportProductView_Previews: PreviewProvider {
    static var previews: some View {
        ReportProductView()
    }
}

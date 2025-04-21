//
//  AddReminderView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var dateSelected: Date = Date()
    
    var body: some View {
        VStack{
            Group{
                Spacer()
                    .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.gray)
                    })
                }.padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 50, alignment: .trailing)
            }
            
            VStack{
                Text("Add to Reminder")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                
                Text("Reminder to checkout the product")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                
                DatePicker("Date", selection: $dateSelected)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(.horizontal, 40)
            }.frame(width: Constants.screenWidth, height: 650, alignment: .center)
            
            CustomButton(title: "Add to Calendar", foregroundColor: .white, backgroundColor: .blue)
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}

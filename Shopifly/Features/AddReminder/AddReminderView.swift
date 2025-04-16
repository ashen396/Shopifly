//
//  AddReminderView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct AddReminderView: View {
    @State private var dateSelected: Date = Date()
    
    var body: some View {
        VStack{
            Text("Add to Reminder")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Reminder to checkout the product")
                .font(.title3)
                .foregroundColor(.gray)
            
            DatePicker("Date", selection: $dateSelected)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.horizontal, 40)
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .center)
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}

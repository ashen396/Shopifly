//
//  ReportProductView.swift
//  Shopifly
//
//  Created by Mac on 4/15/25.
//

import SwiftUI
import FirebaseFirestore

struct ReportProductView: View {
    
    @State private var pickerSelection = ""
    @State private var summary = ""
    @State private var productID: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    private func ReportProduct(){
        let data = ["ProductID": productID, "ReportedByID": UserDefaults.standard.string(forKey: "UserID"), "Date": String(describing: Date()), "ReportType": pickerSelection, "Comment": summary]
            Firestore.firestore().collection("ProductReport").addDocument(data: data as [String : Any]) { (error) in
                if(error != nil){
                    print(error as Any)
                    return
                }else{
                    self.presentationMode.wrappedValue.dismiss()
                }
        }
    }
    
    var body: some View {
        VStack{
            Group{
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                
                HStack{
                    Text("Report Item")
                        .font(.title)
                        .fontWeight(.bold)
                }.padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
            }
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            HStack{
                Text("Type of report")
                    .font(.title3)
                    .fontWeight(.semibold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
            
            Group{
                Spacer()
                    .frame(width: Constants.screenWidth, height: 10, alignment: .center)
                
                Picker("Incorrect Information", selection: $pickerSelection) {
                    Text("Incorrect Information")
                    Text("Counterfeit Product")
                }.pickerStyle(MenuPickerStyle())
                .padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
            }
            
            Group{
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                
                HStack{
                    Text("Attach images (optional)")
                        .font(.title3)
                        .fontWeight(.semibold)
                }.padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
            }
            
            Group{
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                
                HStack{
                    AddImageButton()
                }.padding(.leading, 25)
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .leading)
            }
            
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
                .onTapGesture {
                    ReportProduct()
                }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct ReportProductView_Previews: PreviewProvider {
    static var previews: some View {
        ReportProductView()
    }
}

//
//  ProductscreenView.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI

struct ProductscreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.44, green: 0.03, blue: 0.07, opacity: 1.00), Color(red: 0.84, green: 0.02, blue: 0.12, opacity: 1.00)]), startPoint: .top, endPoint: .bottom)
                .frame(width: Constants.screenWidth, height: Constants.screenWidth / 4.4, alignment: .top)
            ZStack{
                Image("RedShoeLarge")
                    .resizable()
                    .frame(width: Constants.screenWidth / 1.5, height: Constants.screenWidth / 1.5, alignment: .top)
                
                ZStack{
                    VStack{
                        HStack{
                            Text("SHOE MARKETPLACE")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 250, height: 100, alignment: .center)

                        }
                        
                        HStack{
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Group{
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .frame(width: 15, height: 25, alignment: .center)
                                        .foregroundColor(.white)
                                        
                                    Text("Back")
                                        .foregroundColor(.white)
                                }
                            })
                            
                            Spacer()
                            
                            NavigationLink(
                                destination: ReportProductView(),
                                label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 32, height: 32, alignment: .center)
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "exclamationmark.circle")
                                            .resizable()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(.red)
                                    }
                                })
                        }.padding(.horizontal, 25)
                        .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 150, alignment: .top)
                        
                        HStack{
                            RoundedRectangle(cornerRadius: 40.0)
                                .frame(width: 60, height: 60, alignment: .center)
                                .foregroundColor(.white)
                                .shadow(color: Color.init( white: 0, opacity: 0.2), radius: 10, x: 0.0, y: 2.0)
                                .overlay(
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 40, height: 35, alignment: .center)
                                        .font(.system(size: 40, weight: Font.Weight.ultraLight))
                                )
                        }.frame(width: Constants.screenWidth, height: 75, alignment: .topTrailing)
                        .padding(.trailing, 25)
                    }
                }.frame(width: Constants.screenWidth, height: Constants.screenWidth, alignment: .top)
                .padding(.top, 40)
                
                
            }.frame(width: Constants.screenWidth, height: Constants.screenWidth / 1.5, alignment: .center)
            .background(Color(red: 0.81, green: 0.02, blue: 0.12, opacity: 1.00))
            .padding(.top, -10)
            
            Text("Red Shoe")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                .padding(.top, 25)
                .padding(.leading, 40)
            
            HStack{
                Text("Rs. 1199")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor.systemGray))
                    Spacer()
            
                HStack{
                    Text("Compare")
                        .foregroundColor(.blue)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 20, alignment: .center)
                        .font(.system(size: 40, weight: Font.Weight.light))
                        .foregroundColor(.blue)
                }
            }.padding(.top, 5)
            .padding(.horizontal, 20)
            .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            // Ratings
            ScrollView{
                VStack{
                    // Rating 01
                    VStack{
                        HStack{
                            NavigationLink(
                                destination: UserProfileView(),
                                label: {
                                    Image("ProfilePic1")
                                        .resizable()
                                        .frame(width: 60, height: 60, alignment: .topLeading)
                                })
                            
                            VStack{
                                
                                // Username
                                HStack{
                                    Text("@JohnSmith")
                                        .foregroundColor(Color.gray)
                                    
                                    RatingBar()
                                    
                                    Spacer()
                                    
                                    Text("1 day ago")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing, 25)
                                }.frame(width: Constants.screenWidth - 85, height: 20, alignment: .leading)
                                
                                // Comment
                                VStack{
                                    Text("Lorem ipsum dolor sit amet, consectetur adispsicing elit...")
                                        .padding(.trailing, 50)
                                        .frame(width: Constants.screenWidth - 85, height: 50, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                
                            }.frame(width: Constants.screenWidth - 85, height: 50, alignment: .topLeading)
                            
                        }
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                        
                        HStack{
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                        }.padding(.leading, 40)
                        .frame(width: Constants.screenWidth - 85, height: 48, alignment: .leading)
                        
                    }.padding(.horizontal, 15)
                    .frame(width: Constants.screenWidth, height: 150, alignment: .topLeading)
                    
                    
                    //Rating 02
                    VStack{
                        HStack{
                            Image("ProfilePic1")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .topLeading)
                            
                            VStack{
                                
                                // Username
                                HStack{
                                    Text("@JohnSmith")
                                        .foregroundColor(Color.gray)
                                    
                                    RatingBar()
                                    
                                    Spacer()
                                    
                                    Text("1 day ago")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing, 25)
                                }.frame(width: Constants.screenWidth - 85, height: 20, alignment: .leading)
                                
                                // Comment
                                VStack{
                                    Text("Lorem ipsum dolor sit amet, consectetur adispsicing elit...")
                                        .padding(.trailing, 50)
                                        .frame(width: Constants.screenWidth - 85, height: 50, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                
                            }.frame(width: Constants.screenWidth - 85, height: 50, alignment: .topLeading)
                            
                        }
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                        
                        HStack{
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                        }.padding(.leading, 40)
                        .frame(width: Constants.screenWidth - 85, height: 48, alignment: .leading)
                        
                    }.padding(.horizontal, 15)
                    .frame(width: Constants.screenWidth, height: 150, alignment: .topLeading)

                    //Rating 03
                    VStack{
                        HStack{
                            Image("ProfilePic1")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .topLeading)
                            
                            VStack{
                                
                                // Username
                                HStack{
                                    Text("@JohnSmith")
                                        .foregroundColor(Color.gray)
                                    
                                    RatingBar()
                                    
                                    Spacer()
                                    
                                    Text("1 day ago")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing, 25)
                                }.frame(width: Constants.screenWidth - 85, height: 20, alignment: .leading)
                                
                                // Comment
                                VStack{
                                    Text("Lorem ipsum dolor sit amet, consectetur adispsicing elit...")
                                        .padding(.trailing, 50)
                                        .frame(width: Constants.screenWidth - 85, height: 50, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                
                            }.frame(width: Constants.screenWidth - 85, height: 50, alignment: .topLeading)
                            
                        }
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                        
                        HStack{
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                        }.padding(.leading, 40)
                        .frame(width: Constants.screenWidth - 85, height: 48, alignment: .leading)
                        
                    }.padding(.horizontal, 15)
                    .frame(width: Constants.screenWidth, height: 150, alignment: .topLeading)

                    //Rating 04
                    VStack{
                        HStack{
                            Image("ProfilePic1")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .topLeading)
                            
                            VStack{
                                
                                // Username
                                HStack{
                                    Text("@JohnSmith")
                                        .foregroundColor(Color.gray)
                                    
                                    RatingBar()
                                    
                                    Spacer()
                                    
                                    Text("1 day ago")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing, 25)
                                }.frame(width: Constants.screenWidth - 85, height: 20, alignment: .leading)
                                
                                // Comment
                                VStack{
                                    Text("Lorem ipsum dolor sit amet, consectetur adispsicing elit...")
                                        .padding(.trailing, 50)
                                        .frame(width: Constants.screenWidth - 85, height: 50, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                
                            }.frame(width: Constants.screenWidth - 85, height: 50, alignment: .topLeading)
                            
                        }
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                        
                        HStack{
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                            
                            Image("ReviewImage")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .leading)
                        }.padding(.leading, 40)
                        .frame(width: Constants.screenWidth - 85, height: 48, alignment: .leading)
                        
                    }.padding(.horizontal, 15)
                    .frame(width: Constants.screenWidth, height: 120, alignment: .topLeading)

                }
            }.frame(width: Constants.screenWidth, height: 270, alignment: .topLeading)
            
            NavigationButton(title: "Write a Review", foregroundColor: .white, backgroundColor: .blue, destination: WriteReviewView())
        }.frame(width: Constants.screenWidth, height: UIScreen.main.bounds.height, alignment: .top)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture())
    }
}

struct ProductscreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProductscreenView()
    }
}

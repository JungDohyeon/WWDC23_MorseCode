//
//  ARDescription.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/17.
//

import SwiftUI

struct ARDescription: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Text("How to Use")
                    .font(Font.system(size: 50, weight: .bold))
                    .foregroundColor(.black)
                
                
                VStack {
                    VStack (spacing: -5) {
                        HStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.pink)
                                .overlay(Circle().stroke(Color.pink, lineWidth: 2))
                            Text("Dot")
                                .font(.custom(.concertOne, size: 30))
                                .foregroundColor(.pink)
                        }
                       
                        HStack {
                            Text("Close your eyes and open them")
                                .font(.custom(.muktaRegular, size: 20))
                                .foregroundColor(.black)
                            Text("before 0.4 seconds.")
                                .font(.custom(.muktaBold, size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(15)
                    
                    VStack (spacing: -5) {
                        HStack {
                            Capsule()
                                .frame(width: 50, height: 20)
                                .foregroundColor(.pink)
                                .overlay(Capsule().stroke(Color.pink, lineWidth: 2))
                            Text("Dash")
                                .font(.custom(.concertOne, size: 30))
                                .foregroundColor(.pink)
                        }
                       
                        HStack {
                            Text("Close your eyes and open them")
                                .font(.custom(.muktaRegular, size: 20))
                                .foregroundColor(.black)
                            Text("after 0.4 seconds.")
                                .font(.custom(.muktaBold, size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.bottom, 15)
                    
                    VStack {
                        Text("\" \" (Character Separation - Single Space) ")
                            .font(.custom(.concertOne, size: 30))
                            .foregroundColor(.pink)
                          
                        VStack {
                            Text("Keeping the time between eye closing and closing time")
                                .font(.custom(.muktaRegular, size: 20))
                                .foregroundColor(.black)
                            Text("between 0.7 seconds and less than 1.3 seconds")
                                .font(.custom(.muktaBold, size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.bottom, 15)
                    
                    VStack {
                        Text("\"  \" (Word Separation - Double Space) ")
                            .font(.custom(.concertOne, size: 30))
                            .foregroundColor(.pink)
                            
                        HStack {
                            Text("Keep eyes open for at least")
                                .font(.custom(.muktaRegular, size: 20))
                                .foregroundColor(.black)
                            Text("1.3 seconds between eyes closed")
                                .font(.custom(.muktaBold, size: 20))
                                .foregroundColor(.black)
                        }
                    }
                }
                .multilineTextAlignment(.center)
                .padding()
                
                Spacer()
                    .frame(height: 70)
                
                Button {
                    dismiss()
                } label: {
                    Text("Let's experience!")
                        .foregroundColor(.white)
                        .font(.custom(.concertOne, size: 35))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.pink)
                        .cornerRadius(10)
                }
                .padding(.bottom, 15)

            }
        }
    }
}


struct ARDescription_Previews: PreviewProvider {
    static var previews: some View {
        ARDescription()
    }
}

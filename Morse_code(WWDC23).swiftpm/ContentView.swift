import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Image(systemName: "waveform")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .padding(.bottom, 20)
                        .padding(.top, 15)
                        .foregroundColor(.pink)
                    
                    Text("Morse Eye")
                        .font(.system(size: 60).weight(.black))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    
                    // Description
                    Text("This app is an app that allows you to learn about Morse code simply and generate Morse code yourself using the time you close your eyes and open them.")
                        .font(.custom(.muktaRegular, size: 22))
                        .foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255))
                        .multilineTextAlignment(.center)
                        .frame(width: 760)
                        .padding(.horizontal)
                        .padding(.bottom, 60)
                    
                    
                    // Navigation Buttons
                    VStack {
                        NavigationLink(destination: EyeblinkingMorse()) {
                            HStack {
                                Image(systemName: "waveform.and.magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                    .padding(.trailing, 15)
                                
                                Text("AR Eye Blinking to Morse Code")
                                    .font(.custom(.muktaBold, size: 25))
                                
                            }
                            .frame(width: 730, height: 70)
                            .padding(12)
                            .background(.pink)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.pink, lineWidth: 5)
                            )
                            .cornerRadius(30)
                        }
                        .padding(.bottom, 20)
                        
                        HStack (spacing: 15) {
                            NavigationLink(destination: LearnMorse1()) {
                                HStack {
                                    Image(systemName: "book.closed")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .padding(.trailing, 15)
                                    
                                    Text("About Morse Code")
                                        .font(.custom(.muktaBold, size: 23))
                                }
                                .frame(width: 350, height: 50)
                                .padding(10)
                                .foregroundColor(Color("myGray"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color("myGray"), lineWidth: 3)
                                )
                                .cornerRadius(25)
                            }
                            
                            NavigationLink(destination: MorseCodeChart()) {
                                HStack {
                                    Image(systemName: "tablecells")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35)
                                        .padding(.trailing, 10)
                                    
                                    Text("Morse Code Table")
                                        .font(.custom(.muktaBold, size: 23))
                                    
                                }
                                .frame(width: 350, height: 50)
                                .padding(12)
                                .foregroundColor(Color("myGray"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color("myGray"), lineWidth: 3)
                                )
                                .cornerRadius(25)
                            }
                        }.padding(.bottom, 10)
                       
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

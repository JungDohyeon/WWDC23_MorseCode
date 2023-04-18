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
                        .font(.custom(.muktaRegular, size: 27))
                        .foregroundColor(Color("myGray"))
                        .multilineTextAlignment(.center)
                        .frame(width: 760)
                        .padding(.horizontal)
                        .padding(.bottom, 60)
                    
                    
                    // Navigation Buttons
                    HStack (spacing: 15) {
                        NavigationLink(destination: LearnMorse1()) {
                            VStack {
                                Text("Learn about Morse Code")
                                    .font(.custom(.muktaBold, size: 24))
                                    .padding(.bottom, 16)
                                
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                            }
                            .frame(width: 230, height: 180)
                            .padding(12)
                            .background(.black.opacity(0.75))
                            .foregroundColor(.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(.green.opacity(0.5), lineWidth: 4)
                            )
                            .cornerRadius(40)
                            .shadow(color: .green.opacity(0.2), radius: 7)
                        }
                        
                        NavigationLink(destination: MorseCodeChart()) {
                            VStack {
                                Text("Morse Code \n Table")
                                    .font(.custom(.muktaBold, size: 24))
                                    .padding(.bottom, 16)
                                
                                Image(systemName: "tablecells")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                            }
                            .frame(width: 230, height: 180)
                            .padding(12)
                            .background(.black.opacity(0.75))
                            .foregroundColor(.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(.blue.opacity(0.5), lineWidth: 4)
                            )
                            .cornerRadius(40)
                            .shadow(color: .blue.opacity(0.2), radius: 7)
                        }
                        
                        
                        NavigationLink(destination: EyeblinkingMorse()) {
                            VStack {
                                Text("AR Eye Blinking to Morse Code")
                                    .font(.custom(.muktaBold, size: 24))
                                    .padding(.bottom, 16)
                                
                                Image(systemName: "waveform.and.magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                            }
                            .frame(width: 230, height: 180)
                            .padding(12)
                            .background(.black.opacity(0.75))
                            .foregroundColor(.purple)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(.purple.opacity(0.5), lineWidth: 4)
                            )
                            .cornerRadius(40)
                            .shadow(color: .purple.opacity(0.2), radius: 7)
                        }
                    }.padding(.bottom, 24)
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

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "waveform")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.bottom, 20)
                        .foregroundColor(.pink)
                        .shadow(color: .white.opacity(0.3), radius: 7)
                    
                    Text("Morse Code")
                        .font(.system(size: 60).weight(.black))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    // Description
                    Text("This is an app that simply explains Morse code and allows you to practice.")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    
                    
                    // Navigation Buttons
                    VStack {
                        NavigationLink(destination: LearnMorse()) {
                            Text("Learn about Morse Code")
                                .font(.system(size: 24).weight(.semibold))
                                .frame(width: 500, height: 60)
                                .padding(12)
                                .background(.black.opacity(0.6))
                                .foregroundColor(.green)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.green.opacity(0.5), lineWidth: 4)
                                )
                                .cornerRadius(12)
                                .shadow(color: .green.opacity(0.2), radius: 7)
                                .padding(.bottom, 16)
                        }
                        
                        HStack (spacing: 10) {
                            NavigationLink(destination: MorseCodeChart()) {
                                Text("Morse Code Chart")
                                    .font(.system(size: 24).weight(.semibold))
                                    .frame(width: 232, height: 60)
                                    .padding(12)
                                    .background(.black.opacity(0.6))
                                    .foregroundColor(.blue)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.blue.opacity(0.5), lineWidth: 4)
                                    )
                                    .cornerRadius(12)
                                    .shadow(color: .blue.opacity(0.2), radius: 7)
                                    .padding(.bottom, 16)
                            }
                            
                            NavigationLink(destination: LearnMorse()) {
                                Text("Morse Code Tree")
                                    .font(.system(size: 24).weight(.semibold))
                                    .frame(width: 232, height: 60)
                                    .padding(12)
                                    .background(.black.opacity(0.6))
                                    .foregroundColor(.blue)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.blue.opacity(0.5), lineWidth: 4)
                                    )
                                    .cornerRadius(12)
                                    .shadow(color: .blue.opacity(0.2), radius: 7)
                                    .padding(.bottom, 16)
                            }
                            
                        }
                        
                        NavigationLink(destination: GameMorse()) {
                            Text("Game with MorseCode!")
                                .font(.system(size: 24).weight(.semibold))
                                .frame(width: 500, height: 60)
                                .padding(12)
                                .background(.black.opacity(0.6))
                                .foregroundColor(.purple)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.purple.opacity(0.5), lineWidth: 4)
                                )
                                .cornerRadius(12)
                                .shadow(color: .purple.opacity(0.2), radius: 7)
                                .padding(.bottom, 16)
                        }
                    }.padding(.bottom, 24)
                }
                
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

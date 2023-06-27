//
//  HomeView.swift
//  GlassEffect
//
//  Created by Gagan Vishal  on 2023/06/27.
//

import SwiftUI

struct HomeView: View {
    @State private var userName: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            VStack {
                Text("Welcome Back")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                userNamePasswordLoginOptionView
                otherLoginOption
                .padding(.top, 15)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .padding(.bottom, 30)
            .background {
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.white.opacity(0.05))
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            ///Draw Blue line
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.blue, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .shadow(color: .black.opacity(0.2), radius: 10)
            .background {
                transparentTopLeftBottomRightCircles
            }
        }
        .padding(.horizontal, 40)
        /// This will keep login view height 390 in iPad device
        .frame(maxWidth: 390)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Rectangle()
                .fill(Color.backgroundColor)
                .ignoresSafeArea()
        )
    }

}

#Preview {
    ContentView()
}

extension HomeView {
    private var otherLoginOption: some View {
        HStack(spacing: 12) {
            Button(action: {}, label: {
                Label("Email", systemImage:"envelope.fill")
                    .frame(maxWidth: .infinity)
                    .padding(15)
                    .background(
                        TransparentBlurView(removeAllFilters: false)
                            .background(.white.opacity(0.3))
                    )
                    .clipShape(.rect(cornerRadius: 10, style: .continuous))
            })
            Button(action: {}, label: {
                Label("Apple", systemImage:"apple.logo")
                    .frame(maxWidth: .infinity)
                    .padding(15)
                    .background(
                        TransparentBlurView(removeAllFilters: false)
                            .background(.white.opacity(0.3))
                    )
                    .clipShape(.rect(cornerRadius: 10, style: .continuous))
            })
        }
    }
    
    private var userNamePasswordLoginOptionView: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .font(.callout.bold())
            customTextField(placeholder: "Enter user name", value: $userName)
            Text("Password")
                .font(.callout.bold())
                .padding(.top, 15)
            customTextField(placeholder: "Enter user name", value: $password)
            
            Button(action: {}, label: {
                Text("Login")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 10, style: .continuous))
            })
            .padding(.top, 15)
        }
    }
    
    private var transparentTopLeftBottomRightCircles: some View {
        ZStack {
            Circle()
                .fill(
                    .linearGradient(colors: [Color.gradientColor1, Color.gradientColor2], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 140, height: 140)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: -50, y: -50)
            
            Circle()
                .fill(
                    .linearGradient(colors: [Color.gradientColor3, Color.gradientColor4], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 140, height: 140)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .offset(x: 50, y: 50)
        }
    }
    
    private func customTextField(placeholder: String, value: Binding<String>, isPassword: Bool = false) -> some View {
        Group {
            if isPassword {
                SecureField(placeholder, text: value)
            } else {
                TextField(placeholder, text: value)

            }
        }
        .environment(\.colorScheme, .dark)
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(Color.white.opacity(0.1))
        .clipShape(.rect(cornerRadius: 10, style: .continuous))
    }
}

//
//  LogInView.swift
//  Pity
//
//  Created by Can Seyhan on 10.01.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseFirestore

struct LogInView: View {
    
    @State private var email: String = ""
    
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
        VStack{
            
            //pity
            VStack (alignment:.leading){
                
                Text("pity").font(.custom("Pacifico Regular", size: 70)).foregroundColor(Color(#colorLiteral(red: 0.91, green: 0.45, blue: 0.43, alpha: 1))).frame(width: UIScreen.main.bounds.width * 0.30, height: UIScreen.main.bounds.height * 0.1).padding(.bottom,50).padding(.top,20).padding(.leading, 20)
                
                
                
                //yeni nesil sosyal medya!
                Text("yeni nesil sosyal medya!").font(.custom("Poppins Regular", size: 20)).tracking(-0.54).frame(width: UIScreen.main.bounds.width * 0.62, height: UIScreen.main.bounds.height * 0.01).padding(.bottom,20).padding(.leading, 20)
            }.padding(.trailing,120)
            
            
            
            
            //Rectangle 3
            TextField("", text: $email).placeholder(when: email .isEmpty, placeholder: {
                Text("E-posta").font(.custom("Poppins Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.59, alpha: 1))).tracking(-0.48)
            }).padding().padding(.top,5).padding(.bottom,5).background(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)).cornerRadius(16)).padding(.trailing, 20).padding(.leading,20).padding(.top,40).padding(.bottom,10)
            
            
            
            SecureField("", text: $password).placeholder(when: password .isEmpty, placeholder: {
                Text("Parola").font(.custom("Poppins Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.59, alpha: 1))).tracking(-0.48)
            }).padding().padding(.top,5).padding(.bottom,5).background(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)).cornerRadius(16)).padding(.trailing, 20).padding(.leading,20)
            
            Button(action: {
                    print("Sign In been tapped")
                
            }) {
                Text("Giriş").font(.custom("Poppins SemiBold", size: 16)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.48).multilineTextAlignment(.center).padding(.trailing,154).padding(.leading,154).padding(.top,18).padding(.bottom, 18)
            }.background(Color(#colorLiteral(red: 0.9098039269447327, green: 0.45098039507865906, blue: 0.4313725531101227, alpha: 1))).cornerRadius(16).padding(.top, 40)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            HStack {
                Text("___________").foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.87, blue: 0.87, alpha: 1))).tracking(-0.42).padding(.bottom,12)
                
                Text("ya da").font(.custom("Poppins Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.87, blue: 0.87, alpha: 1))).tracking(-0.42)
                
                Text("___________").foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.87, blue: 0.87, alpha: 1))).tracking(-0.42).padding(.bottom,12)
                
                
                
            }.padding(.top,36).padding(.bottom,20)
            
            HStack (spacing: 32){
                Button(action: {
                        print("Google Sign In been tapped")
                    
                }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)))
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.08)
                            Image("google").resizable().frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.048, alignment: .center)
                            
                        }
            }
                Button(action: {
                        print("Facebook Sign In been tapped")
                    
                }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)))
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.08)
                            Image("facebook").resizable().frame(width: UIScreen.main.bounds.width * 0.14, height: UIScreen.main.bounds.height * 0.064, alignment: .center)
                            
                        }
                }
                
                
                
                
                Button(action: {
                        print("Apple Sign In been tapped")
                    
                }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)))
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.08)
                            Image("apple").resizable().frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.height * 0.078, alignment: .center)
                            
                        }
                }

                
            }.padding()
            
            //Bir hesabın yok mu ? Kayıt ol
            HStack (spacing: 2){
                Text("Bir hesabın yok mu ? ").font(.custom("Poppins Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.65, green: 0.65, blue: 0.67, alpha: 1))).tracking(-0.42).padding(.top,22)
                
                NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true).navigationBarHidden(true)) {
                    Text("Kayıt ol").font(.custom("Poppins Bold", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.91, green: 0.45, blue: 0.43, alpha: 1))).tracking(-0.42).padding(.top,22)
                }
                
            }
            
           
            
            
            Spacer()
            }.background(Color.white).navigationBarHidden(true)
    }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}



struct LoginViev_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}


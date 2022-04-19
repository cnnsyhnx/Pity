//
//  SignUpView.swift
//  Pity
//
//  Created by Can Seyhan on 10.01.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore



struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var verifyPassword: String = ""
    @State private var checked = false
    @State private var linkAction = false
  
    
    let db = Firestore.firestore()
    
    var body: some View {
        NavigationView{
        ScrollView {
            VStack {
                HStack {
                    Text("Kayıt Ol").font(.custom("Poppins Bold", size: 38)).tracking(-0.66).padding(.top).frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.06).padding(.top,20).padding(.leading)
                   
                    Spacer()
                }.padding(.bottom,40)
                HStack{
                  
                    Text("E-posta").font(.custom("Poppins Bold", size: 14)).tracking(-0.42).padding(.leading,28)
                    Spacer()
                }
                TextField("", text: $email).placeholder(when: email .isEmpty, placeholder: {
                    Text("E-posta").font(.custom("Poppins Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.59, alpha: 1))).tracking(-0.48)
                }).padding().padding(.top,5).padding(.bottom,5).background(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)).cornerRadius(16)).padding(.trailing, 20).padding(.leading,20).padding(.bottom,20)
                HStack{
                  
                    Text("Kullanıcı Adı").font(.custom("Poppins Bold", size: 14)).tracking(-0.42).padding(.leading,28)
                    Spacer()
                }
                TextField("", text: $username).placeholder(when: username .isEmpty, placeholder: {
                    Text("Kuallanıcı Adı").font(.custom("Poppins Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.59, alpha: 1))).tracking(-0.48)
                }).padding().padding(.top,5).padding(.bottom,5).background(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)).cornerRadius(16)).padding(.trailing, 20).padding(.leading,20).padding(.bottom,20)
                
                HStack{
                
                    Text("Parola").font(.custom("Poppins Bold", size: 14)).tracking(-0.42).padding(.leading,28)
                    Spacer()
                }
                
                SecureField("", text: $password).placeholder(when: password .isEmpty, placeholder: {
                    Text("Parola").font(.custom("Poppins Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.59, alpha: 1))).tracking(-0.48)
                }).padding().padding(.top,5).padding(.bottom,5).background(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)).cornerRadius(16)).padding(.trailing, 20).padding(.leading,20).padding(.bottom,20)
                
                HStack{
                    
                    Text("Parola (Yeniden)").font(.custom("Poppins Bold", size: 14)).tracking(-0.42).padding(.leading,28)
                    Spacer()
                }
                
                SecureField("", text: $verifyPassword).placeholder(when: verifyPassword .isEmpty, placeholder: {
                    Text("Parola").font(.custom("Poppins Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.59, alpha: 1))).tracking(-0.48)
                }).padding().padding(.top,5).padding(.bottom,5).background(Color(#colorLiteral(red: 0.9725490212440491, green: 0.9725490212440491, blue: 0.9725490212440491, alpha: 1)).cornerRadius(16)).padding(.trailing, 20).padding(.leading,20)
                
                HStack{
                    CheckBoxView(checked: $checked)
                    //Üyelik Sözleşmesi, Kişisel...
                    Text("Üyelik Sözleşmesi").font(.custom("Poppins SemiBold", size: 12)).foregroundColor(Color(#colorLiteral(red: 0.91, green: 0.45, blue: 0.43, alpha: 1))).tracking(-0.36) + Text(", ").font(.custom("Poppins SemiBold", size: 12)).foregroundColor(Color(#colorLiteral(red: 0.57, green: 0.57, blue: 0.57, alpha: 1))).tracking(-0.36) + Text("Kişisel Verilerin Korunması ve Gizlilik Politikası").font(.custom("Poppins SemiBold", size: 12)).foregroundColor(Color(#colorLiteral(red: 0.91, green: 0.45, blue: 0.43, alpha: 1))).tracking(-0.36) + Text("’nı okudum, kabul ediyorum.").font(.custom("Poppins SemiBold", size: 12)).foregroundColor(Color(#colorLiteral(red: 0.57, green: 0.57, blue: 0.57, alpha: 1))).tracking(-0.36)
                }.padding().padding(.top).padding(.bottom)
                
            }
            
            Button(action: {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error != nil {
                        print(error?.localizedDescription)
                        
                    } else {
                        
                        var ref: DocumentReference? = nil
                        
                        var userDb: [String : Any] = ["Username": self.username, "E-Mail": self.email, "Password": self.password, "Password Verification": self.verifyPassword, "UserUIDFromFirebase": result!.user.uid]
                        
                        ref = self.db.collection("Users").addDocument(data: userDb, completion: { error in
                            if error != nil {
                               
                            }
                        })
                    }
                }
               
                    print("Signed Up")
                
            }) {
                Text("Devam").font(.custom("Poppins SemiBold", size: 16)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.48).multilineTextAlignment(.center).padding(.trailing,154).padding(.leading,154).padding(.top,18).padding(.bottom, 18)
            }.background(Color(#colorLiteral(red: 0.9098039269447327, green: 0.45098039507865906, blue: 0.4313725531101227, alpha: 1))).cornerRadius(16)
            
        
            
            //Bir hesabın var mı ? Giriş Yap
            HStack (spacing: 2){
                Text("Bir hesabın var mı ? ").font(.custom("Poppins Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.65, green: 0.65, blue: 0.67, alpha: 1))).tracking(-0.42)
                NavigationLink(destination: LogInView().navigationBarBackButtonHidden(true).navigationBarHidden(true)) {
                    Text("Giriş Yap").font(.custom("Poppins Bold", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.91, green: 0.45, blue: 0.43, alpha: 1))).tracking(-0.42)
                }
            }
            
     
            
        }.navigationBarHidden(true)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

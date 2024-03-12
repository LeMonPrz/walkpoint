import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var userid = ""
    
    var body: some View {
        ZStack {
            Color.brown.edgesIgnoringSafeArea(.all)
            VStack{
                Text("USER LOGIN")
                    .bold()
                    .font(.system(size: 44))
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: 330, height: 450)
                    VStack{
                        VStack(alignment: .leading){
                            Text("Username:") // Label
                                .bold()
                                .offset(x:10)
                            TextField("Enter username", text: $username)
                                .frame(width: 250)// Input box
                                .foregroundColor(.brown)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                        VStack(alignment: .leading){
                            Text("User ID:")
                                .bold()
                                .offset(x:10)
                            TextField("Enter User ID", text: $userid)
                                .frame(width: 250)// Input box
                                .foregroundColor(.brown)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                       VStack(alignment: .leading){
                            Text("Password:") // Label
                                .bold()
                                .offset(x:10)
                            TextField("Enter Password", text: $password)
                                .frame(width: 250)// Input box
                                .foregroundColor(.brown)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                        Button(action: login) {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.brown)
                                )
                        }
                        Button(action: signIn) {
                            Text("Sign up")
                                .foregroundColor(.blue)
                                .padding()
                        }
                    }
                }
            }
        }
    }
    
    func login() {
        print("Invalid username or password")
    }
    
    func signIn() {
        print("Sign in button tapped")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

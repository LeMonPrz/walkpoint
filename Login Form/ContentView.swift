import SwiftUI

struct MainView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var userid = ""
    
    @State var showSheet: Bool = false
    @State var swapHistory: Bool = false
    
    let creamBrown = Color(hex: "B0A695")
    let cream = Color(hex: "F3EEEA")
    
    var historyExchanges: [Exchange] = [
        Exchange(place:"Bookstore",discount: "10% OFF"),
        Exchange(place:"BCC Canteen 17th",discount: "20THB"),
        Exchange(place:"Water Shop",discount: "10THB")
    ]
    var historyEarns: [History] = [
        History(place:"Sirinat 3F",cooldown: "cooldown 12Hr"),
        History(place:"150th Building 3F",cooldown: "cooldown 12Hr"),
        History(place:"150th Building 5F",cooldown: "cooldown 12Hr")
    ]
    
    var body: some View {
        TabView{
            HistoryView()
            .tabItem(){
                Label("Menu", systemImage: "list.dash")
            }
            MainView()
                .tabItem{
                    Label("Menu2", systemImage: "list.dash")
                }
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
        }
        func login() {
            print("Invalid username or password")
        }
        
        func signIn() {
            print("Sign in button tapped")
        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}

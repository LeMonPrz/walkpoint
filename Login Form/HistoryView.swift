import SwiftUI


struct HistoryView: View {
    
    @State var hiKim: String = "kimmuie and"
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
        NavigationStack {
            ZStack{
                Color(cream)
                VStack{
                    VStack {
                        ZStack{
                            Rectangle()
                                .fill(creamBrown)
                                .ignoresSafeArea(.all)
                                .frame(height: 50)
                            HStack{
                                Spacer()
                                    .fixedSize()
                                Image("Token")
                                    .resizable()
                                    .frame(width:50 ,height: 50)
                                Text("Token")
                                Spacer()
                                Button(action: ScanNavi){
                                    Text("Name")
                                        .foregroundStyle(Color.black)
                                    ZStack{
                                        Circle()
                                            .fill(Color.white)
                                            .frame(height: 50)
                                        Image(systemName: "person")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundStyle(.black)
                                    }
                                }
                                Spacer()
                                    .fixedSize()
                            }.offset(y:-5)
                        }
                        Spacer()
                            .fixedSize()
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(cream)
                                .frame(width: 220, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(Color.brown, lineWidth: 5)
                                )
                            HStack{
                                Button(action: swapEarn) {
                                    Text("Earn")
                                        .foregroundColor(.black) // Set text color
                                        .padding()
                                        .frame(width: 110, height: 40)
                                        .background( !swapHistory ? nil :
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .fill(creamBrown)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                        .stroke(Color.brown, lineWidth: 5)
                                                )
                                    )
                                }
                                Button(action: swapExchange) {
                                    Text("Exchange")
                                        .foregroundColor(.black) // Set text color
                                        .padding()
                                        .frame(width: 110, height: 40)
                                        .background( swapHistory ? nil :
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .fill(creamBrown)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                        .stroke(Color.brown, lineWidth: 5)
                                                )
                                        )
                                }
                            }
                        }.offset(y:20)
                        Spacer()
                        if swapHistory {
                            List(historyEarns, id: \.place) { history in
                                HStack(alignment: .top){
                                    VStack(alignment: .leading) {
                                        Text(history.place)
                                            .font(.headline)
                                        Text(history.cooldown)
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                    }
                                    
                                    HStack(alignment: .top){
                                        Image("Token")
                                            .resizable()
                                            .frame(width:25 ,height: 25)
                                        Text("+1")
                                    }
                                }
                            }.offset(y: 40)
                                .listStyle(.plain)
                        } else {
                            List(historyExchanges, id: \.place) { exchange in
                                HStack(alignment: .top){
                                    VStack(alignment: .leading) {
                                        Text(exchange.place)
                                            .font(.headline)
                                        Text(exchange.discount)
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                    }
                                    
                                    HStack(alignment: .top){
                                        Image("Token")
                                            .resizable()
                                            .frame(width:25 ,height: 25)
                                        Text("-5")
                                    }
                                }
                            }.offset(y: 40)
                                .listStyle(.plain)
                        }
                        Spacer()
                        Circle()
                            .fill(creamBrown)
                            .frame(height: 100)
                            .offset(x: -110 , y:70)
                        ZStack{
                            Rectangle()
                                .fill(creamBrown)
                                .ignoresSafeArea(.all)
                                .frame(height: 60)
                            HStack{
                                Spacer()
                                Button(action: HistoryNavi){
                                    Image("History")
                                        .resizable()
                                        .frame(width:50 ,height: 50)
                                        .offset(y:-25)
                                }
                                Spacer()
                                Button(action: ScanNavi){
                                    Image("Scan")
                                        .resizable()
                                        .frame(width:50 ,height: 50)
                                        .offset(y:0)
                                }
                                Spacer()
                                Button(action: RewardNavi){
                                    Image("Reward")
                                        .resizable()
                                        .frame(width:50 ,height: 50)
                                        .offset(y:0)
                                }
                                Spacer()
                            }
                            .offset(y:10)
                        }
                    }
                }
            }
        }
    }
    func swapEarn() {
        swapHistory = true
    }
    
    func swapExchange() {
        swapHistory = false
    }
    
    func UserNavi() {
        print("Invalid username or password")
    }
    
    func RewardNavi() {
        print("Invalid username or password")
    }
    
    func ScanNavi() {
        print("Sign in button tapped")
    }
    func HistoryNavi() {
        print("Sign in button tapped")
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff
        )
    }
}

#Preview {
    HistoryView()
}

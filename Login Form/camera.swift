import SwiftUI
import CodeScanner
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State var name: String = "Pranchayut"
    @State var tokenAmount: Int = 0
    @State private var isShowingScanner = false
    
    
    
    private var codeGenerator : String = "011011110001"
    private var tokenOne : Int = 1
    
    
    let creamBrown = Color(hex: "B0A695")
    let creamBright = Color(hex: "F3EEEA")
    
    
    var body: some View {
        ZStack {
            Color(creamBright)
            VStack {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(creamBrown)
                            .ignoresSafeArea(.all)
                            .frame(height: 50)
                        HStack {
                            Spacer()
                                .fixedSize()
                            Image("Token")
                                .resizable()
                                .frame(width:50 ,height: 50)
                            Text("\(tokenAmount) Tokens")
                            Spacer()
                            Text(name)
                            Circle()
                                .fill(Color.white)
                                .frame(height: 50)
                            Spacer()
                                .fixedSize()
                        }.offset(y:-5)
                    }
                    Spacer()
                    Circle()
                        .fill(creamBrown)
                        .frame(height: 100)
                        .offset(y:70)
                    ZStack {
                        Rectangle()
                            .fill(creamBrown)
                            .ignoresSafeArea(.all)
                            .frame(height: 60)
                        HStack {
                            Spacer()
                            Image("Reward")
                                .resizable()
                                .frame(width:50 ,height: 50)
                                .offset(y:0)
                            Spacer()
                            Button(action: {
                                isShowingScanner = true
                            }) {
                                Image("Scan")
                                    .resizable()
                                    .frame(width:50 ,height: 50)
                                    .offset(y:-15)
                            }
                            Spacer()
                            Image("History")
                                .resizable()
                                .frame(width:50 ,height: 50)
                                .offset(y:0)
                            Spacer()
                        }
                        .offset(y:10)
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Some simulated data", completion: handleScan)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        // Handle the scan result here
        switch result {
        case .success(let scanResult):
            checkToken(result: scanResult.string)
        case .failure(let error):
            print("Scanning failed with error: \(error)")
        }
        isShowingScanner = false
        
    }
    func checkToken(result: String) {
        if codeGenerator == result {
            tokenAmount = tokenAmount + 1
        }
    }
}

// https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

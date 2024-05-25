import SwiftUI
import Charts
import Combine

struct DashboardSwiftUIView: View {
    var body: some View {
        VStack {
            BackgrounDashboardUI()
            List {
                HeaderView()
                OverviewChart()
                StatisticsView()
                HStack{
                    Image("Arrows")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("View Analytics")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .frame(width: 360, height: 50)
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#D8D8D8"), lineWidth: 2)
                )
                .padding(.leading, 25)
                LinksView()
                Spacer()
            }
            .listStyle(PlainListStyle())
            .padding(.leading, -30)
            .padding(.trailing, -30)
            CustomNavigationBar()
                .padding(.bottom, 0)
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct BackgrounDashboardUI: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Dashboard")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .padding(.leading, 20)
                    Spacer()
                    
                    Image("Button")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .padding(.trailing, 20)
                }
                
                Spacer()
            }
        }
        .frame(height: 150)
    }
}

//MARK - Header View

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Good morning")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Text("Ajay Manva")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("👋")
                    .font(.title)
            }
        }
        .padding()
        .background(Color.white)
    }
}

//MARK - Chart

struct OverviewChart: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Overview")
                    .font(.headline)
                Spacer()
                
                Button(action: {
                }) {
                    HStack {
                        Text("22 Aug - 23 Sept")
                        Image("Time")
                            .resizable()
                            .frame(width: 20,height: 20)
                    }
                    .frame(width: 180, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#D8D8D8"), lineWidth: 2)
                    )
                    .cornerRadius(10)
                }
            }
            .padding(.bottom, 10)
            .padding(.horizontal)
            
            Chart {
                ForEach(viewModel.chartData) { dataPoint in
                    LineMark(
                        x: .value("Hour", dataPoint.hour),
                        y: .value("Clicks", dataPoint.clicks)
                    )
                    .foregroundStyle(.blue)
                }
            }
            .frame(height: 150)
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.fetchLinks()
        }
    }
}
//MARK - Statistic View

struct StatisticsView: View {
    var body: some View {
        HStack {
            StatView(title: "123", subtitle: "Today's clicks", imageName: "Avatar1")
            StatView(title: "Ahamedab..", subtitle: "Top Location", imageName: "Avatar2")
            StatView(title: "Instagram", subtitle: "Top source", imageName: "Avatar3")
        }
        .padding(.horizontal)
    }
}

struct StatView: View {
    let title: String
    let subtitle: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.leading, -55)
                .padding(.bottom, 2)
                .alignmentGuide(.leading) { _ in -22 }
            Text(title)
                .font(.headline)
                .padding(.leading, -55)
                .padding(.bottom, 2)
                .alignmentGuide(.leading) { _ in -22 }
            Text(subtitle)
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.leading, -55)
                .padding(.bottom, 2)
                .alignmentGuide(.leading) { _ in -22 }
        }
        .frame(width: 100, height: 100)
        .padding(.leading)
        .padding(.trailing, 5)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

//MARK - Link view

struct LinksView: View {
    @StateObject private var viewModel = DashboardViewModel()
    var body: some View {
        VStack {
            HStack {
                    HStack {
                        Text("Top Links")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .cornerRadius(40)
                    .padding(.trailing, 40)
                Text("Recent Links")
                    .foregroundColor(.gray)
                Spacer()
                Image("Input Container")
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)
            .padding(.trailing, 10)
            .padding(.leading, 10)
            .padding(.horizontal)
            
            ForEach(viewModel.links.prefix(3)) { link in
                LinkView(link: link)
            }
            HStack{
                Button(action: {
                }) {
                    HStack{
                        Image("link")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("View all Links")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .frame(width: 360, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#D8D8D8"), lineWidth: 2)
                    )
                }
            }
            Button(action: {
            }) {
                HStack {
                    Image("TalkToUs")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Talk with us")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .frame(width: 360, height: 50)
                .background(Color(hex: "#EAF7EE"))
                .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
            }) {
                HStack {
                    Image("QuestionMark")
                        .resizable()
                        .frame(width: 20,height: 20)
                    Text("Frequently Asked Questions")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .frame(width: 360, height: 50)
                .background(Color(hex: "#E8F1FF"))
                .cornerRadius(10)
            }
            .padding(.top, 10)
        }
        .onAppear {
            viewModel.fetchLinks()
        }
    }
}

//MARK - Particular Link view

struct LinkView: View {
    var link: LinkData
    let backgroundColorHex: String = "#A6C7FF"
    var body: some View {
        VStack {
            HStack {
                if let imageUrl = link.originalImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(5)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(5)
                    }
                    .padding(.trailing, 10)
                } else {
                    Image(systemName: "link")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 10)
                }
                
                VStack(alignment: .leading) {
                    Text(link.title)
                        .lineLimit(1)
                    Text(link.timesAgo)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                VStack{
                    Text("\(link.totalClicks)")
                        .font(.headline)
                    Text("Clicks")
                }
                
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            HStack{
                Text(link.webLink)
                    .lineLimit(1)
                    .foregroundColor(.blue)
                Spacer()
                Button(action: {
                    UIPasteboard.general.string = link.webLink
                }) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom, 5)
        }
    }
}



struct CustomNavigationBar: View {
    var body: some View {
        ZStack {
            HStack {
                NavBarItem(systemName: "link", title: "Links")
                Spacer()
                NavBarItem(systemName: "book", title: "Courses")
                Spacer().frame(width: 80)
                NavBarItem(systemName: "megaphone", title: "Campaigns")
                Spacer()
                NavBarItem(systemName: "person", title: "Profile")
            }
            .padding(.horizontal)
            .frame(height: 80)
            ZStack {
                CurvedRectangleShape()
                    .fill(Color.white)
                    .frame(width: 90, height: 70)
                    .offset(y: -32)
                CentralButton()
                    .offset(y: -30)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct CurvedRectangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let curveHeight: CGFloat = 30
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + curveHeight))
        
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.minY + curveHeight / 50),
            control: CGPoint(x: rect.midX - 20, y: rect.minY)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY + curveHeight),
            control: CGPoint(x: rect.midX + 20, y: rect.minY)
        )
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct NavBarItem: View {
    let systemName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .resizable()
                .frame(width: 25, height: 20)
            Text(title)
                .font(.caption)
        }
        .padding(.horizontal)
    }
}


struct CentralButton: View {
    var body: some View {
        Button(action: {
        }) {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 10)
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}



#Preview {
    DashboardSwiftUIView()
}

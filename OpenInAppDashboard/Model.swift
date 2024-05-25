import Foundation

struct DashboardResponse: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let data: DashboardData
}

struct DashboardData: Codable {
    let recentLinks: [LinkData]
    let overallUrlChart: [String: Int]?
    
    enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case overallUrlChart = "overall_url_chart"
    }
}

struct LinkData: Codable, Identifiable {
    let id = UUID()
    let urlID: Int
    let webLink: String
    let smartLink: String
    let title: String
    let totalClicks: Int
    let originalImage: String?
    let timesAgo: String
    let createdAt: String
    let domainID: String
    let app: String
    
    enum CodingKeys: String, CodingKey {
        case urlID = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainID = "domain_id"
        case app
    }
}
struct ChartDataPoint: Identifiable {
    let id = UUID()
    let hour: String
    let clicks: Int
}

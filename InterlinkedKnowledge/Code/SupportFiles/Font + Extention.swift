import UIKit

extension UIFont {
    enum SF: String {
        case regular = "SF-Pro"
    }
    
    enum SFPro: String {
        case semibold = "SF-Pro-Semibold"
        case bold = "SF-Pro-Bold"
    }
    
    static func customSFFont(_ font: SF, size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: font.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func customSFProFont(_ font: SFPro, size: CGFloat) -> UIFont {
        switch font {
        case .bold:
            return UIFont.systemFont(ofSize: size, weight: .bold)
        default:
            guard let customFont = UIFont(name: font.rawValue, size: size) else {
                return UIFont.systemFont(ofSize: size)
            }
            return customFont
        }
    }
}

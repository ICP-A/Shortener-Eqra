import Foundation

let linksJson = try! String(contentsOf: URL(filePath: "./links.json"), encoding: .utf8)
let links = try! JSONDecoder().decode([String: String].self, from: linksJson.data(using: .utf8)!)
print(links)

for (id, url) in links {
    let html = """
    <script>
        window.location.replace("\(url)")
    </script>
    """
    let filePath = "./root/l/\(id).html"
    FileManager.default.createFile(atPath: filePath, contents: html.data(using: .utf8))
    print("[INFO] created \(filePath) -> \(url)")
}

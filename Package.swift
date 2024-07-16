// swift-tools-version:5.3
import PackageDescription

let package = Package(
   name: "AptosKit",
   platforms: [
     .iOS(.v14),
   ],
   products: [
      .library(name: "AptosKit", targets: ["AptosKit"])
   ],
   targets: [
      .binaryTarget(
         name: "AptosKit",
         url: "",
         checksum:"ba2f201a463a57181508b5e8a1dcac11553d48a4fb3a123015dad0b7babf6814")
   ]
)
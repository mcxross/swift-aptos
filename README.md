# Swift-Aptos

This is a Swift package export for [Kaptos](https://github.com/mcxross/kaptos)
making its iOS binary available as a dependency to iOS developers working on native Swift projects.

The artifact is a binary framework that can be imported into your Xcode project.

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/mcxross/swift-aptos.git", .upToNextMajor(from: "0.1.0-beta"))
]
```

## Usage

Import the module in your Swift file:

```swift
import AptosKit
```

Create the settings object:

```swift
let aptosSettings = AptosSettings(
                        network: .devnet,
                        fullNode: nil,
                        faucet: nil,
                        indexer: nil,
                        client: nil,
                        clientConfig: ClientConfig(
                            followRedirects: true,
                            agent: "AptosClient",
                            likeAgent: nil,
                            requestTimeout: 5000,
                            retryOnServerErrors: 3,
                            maxRetries: 5,
                            cache: false,
                            proxy: nil
                        ),
                        fullNodeConfig: nil,
                        indexerConfig: nil,
                        faucetConfig: nil
                    )
```

Create the configuration object:

```swift
let aptosConfig = AptosConfig(settings: aptosSettings)
```

Create the client object:

```swift
let aptos = Aptos(config: aptosConfig, graceFull: false)
```

### Read on-chain data

```swift
let chainId = try await aptos.getChainId()
```

## License

Copyright 2024 McXross

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
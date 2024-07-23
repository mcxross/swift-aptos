//
//  McXross
//
//  Created in 2024.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI
import AptosKit

struct ContentView: View {
    @State private var chainId: String? = nil
    
    var body: some View {
        VStack {
            if let chainId = chainId {
                Text("Chain ID: \(chainId)")
            } else {
                Text("Fetching Chain ID...")
            }
        }
        .padding()
        .onAppear {
            fetchChainId()
        }
    }
    
    private func fetchChainId() {
        DispatchQueue.main.async {
            Task {
                do {
                    
                    let clientConfig = ClientConfig(
                        followRedirects: true,
                        agent: "AptosClient",
                        likeAgent: nil,
                        requestTimeout: 5000,
                        retryOnServerErrors: 3,
                        maxRetries: 5,
                        cache: false,
                        proxy: nil
                    )
                    
                    let aptosSettings = AptosSettings(
                        network: .devnet,
                        fullNode: nil,
                        faucet: nil,
                        indexer: nil,
                        client: nil,
                        clientConfig: clientConfig,
                        fullNodeConfig: nil,
                        indexerConfig: nil,
                        faucetConfig: nil
                    )

                    let aptosConfig = AptosConfig(settings: aptosSettings)
                    let aptos = Aptos(config: aptosConfig, graceFull: false)
                    
                    let chainId = try await aptos.getChainId()
                    self.chainId = chainId.expect(message: "Failed...")?.stringValue ?? "null"
                } catch {
                    print("Failed to get chain ID: \(error)")
                    self.chainId = "Error"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

# Quickstart

* `flow emulator`
* `flow project deploy`
* `flow accounts create --key e00591c315b218996e6d4372688dd7644d42dc1b80c19551339017a640a88088fa56ec7a5e33475c5284f98b13a2acfc8214631c8ca8ca6aec5f9bb6b665ba1c`
* `flow transactions send transactions/transfer_flow.cdc 100.0 0x01cf0e2f2f715450`
* `flow scripts execute scripts/setup_check.cdc 0x01cf0e2f2f715450`
* `flow transactions send transactions/setup_account.cdc --signer emulator-debug`
* `flow scripts execute scripts/setup_check.cdc 0x01cf0e2f2f715450`

# Useful scripts

* `flow scripts execute scripts/setup_check.cdc 0x5f14b7e68e0bc3c3 --network mainnet`
* `flow scripts execute scripts/read_collections_length.cdc 0x5f14b7e68e0bc3c3 --network mainnet`
* `flow scripts execute scripts/read_collections_length_testnet.cdc 0x22a706cc6b8fe63b --network testnet`

## Storefront

* `flow transactions send transactions/mint_starly_card.cdc 0x01cf0e2f2f715450 12345/1/1`
* `flow transactions send transactions/storefront/sellStarlyCardItem.cdc 0 10.0 "{0xf8d6e0586b0a20c7: 0.1}" --signer emulator-debug`
* `flow transactions send transactions/storefront/buyStarlyCardItem.cdc 92 0x1cf0e2f2f715450 10.0 --signer emulator-debug`

# Contract addresses

| Contract                 | Testnet              | Mainnet              | Notes                           |
| ------------------------ | -------------------- | -------------------- | ------------------------------- |
| Beam                     | `0x6085ae87e78e1433` | `0x86b4a0010a71cfc3` |                                 |
| BlockleteGames_NFT       | `TBD`                | `0x329feb3ab062d289` |                                 |
| CaaArts/CaaPass          | `0xa8b1239250f8d342` | `0x98c9c2e548b84d31` |                                 |
| ChainmonstersMarketplace | `0x75783e3c937304a8` | `0x64f83c60989ce555` |                                 |
| ChainmonstersRewards     | `0x75783e3c937304a8` | `0x93615d25d14fa337` |                                 |
| Collectible (Xtingles)   | `0x85080f371da20cc1` | `0xf5b0eb433389ac3f` |                                 |
| Crave (Niftory)          | `0x6085ae87e78e1433` | `0x6d008a788fc27265` |                                 |
| CricketMoments (Faze)    | `0xb45e7992680a0f7f` | `0xed398881d9bf40fb` |                                 |
| Everbloom                | `0xf30d2f642de8c895` | `0xe703f7fee6400754` |                                 |
| FantastecNFT             | `0x7b4fab78fbddc57e` | `0x2e1ee1e7a96826ce` |                                 |
| FantastecSwapData        | `0x7b4fab78fbddc57e` | `0x2e1ee1e7a96826ce` |                                 |
| FlowStorageFees          | `0x8c5303eaa26202d6` | `0xe467b9dd11fa00df` |                                 |
| FlowToken                | `0x7e60df042a9c0868` | `0x1654653399040a61` |                                 |
| FungibleToken            | `0x9a0766d93b6608b7` | `0xf233dcee88fe0abe` |                                 |
| FUSD                     | `0xe223d8a629e49c68` | `0x3c5959b568896393` |                                 |
| Gaia (Ballers)           | `0xc523a8bbf10fc4a3` | `0x8b148183c28ff88f` |                                 |
| KLKTN                    | `0x336895dbe44c4b44` | `0xabd6e80be7e9682c` |                                 |
| KOTD                     | `0x6085ae87e78e1433` | `0x23dddd854fcc8c6f` |                                 |
| MatrixWorldFlowFestNFT   | `0xe2f1b000e0203c1d` | `0x2d2750f240198f91` |                                 |
| MusicBlock (Melos)       | `0xeb3241ad7d7881db` | `0x5634aefcb76e7d8c` | own NonFungibleToken on Testnet |
| Mynft                    | `0x1eced429f2012ef0` | `0xf6fcbef550d97aa5` |                                 |
| NFTStorefront            | `0x94b06cfca1d8a476` | `0x4eb8a10cb9f87357` |                                 |
| NonFungibleToken         | `0x631e88ae7f1d7c20` | `0x1d7e57aa55817448` |                                 |
| NyatheesOVO              | `0xacf3dfa413e00f9f` | `0x75e0b6de94eb05d0` | own NonFungibleToken on Testnet |
| RaceDay                  | `TBD`                | `0x329feb3ab062d289` |                                 |
| RareRooms (GigLabs)      | `TBD`                | `0x329feb3ab062d289` |                                 |
| RCRDSHPNFT               | `0x95d41a94b49a1ed1` | `0x6c3ff40b90b928ab` | own NonFungibleToken on Testnet |
| Shard (Eternal)          | `0x7ff5f9ac593c3ee0` | `0x82b54037a8f180cf` |                                 |
| SportsIcon               | `0xc2824327396d3a39` | `0x8de96244f54db422` |                                 |
| StarlyCard               | `0x697d72a988a77070` | `0x5b82f21c0edf76e3` |                                 |
| StarlyCardMarket         | `0x697d72a988a77070` | `0x5b82f21c0edf76e3` |                                 |
| TheFabricant             | `0xbc9d692e2617a96e` | `0xa0cbe021821c0965` |                                 |
| TopShot                  | `0x877931736ee77cff` | `0x0b2a3299cc857e29` |                                 |
| TuneGO                   | `0x2b0150231c047a8c` | `0x0d9bc5af3fc0c2e3` |                                 |
| Vouchers (Jambb)         | `0xe94a6e229293f196` | `0x444f5ea22c6ea12c` |                                 |

# Important addresses

| Name                     | Testnet              | Mainnet              |
| ------------------------ | -------------------- | -------------------- |
| Starly FF Admin          | `0x22a706cc6b8fe63b` | `0x5f14b7e68e0bc3c3` |

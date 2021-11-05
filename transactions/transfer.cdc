import Beam from 0x86b4a0010a71cfc3
import BlockleteGames_NFT from 0x329feb3ab062d289
import CaaPass from 0x98c9c2e548b84d31
import ChainmonstersRewards from 0x93615d25d14fa337
import Collectible from 0xf5b0eb433389ac3f
import Crave from 0x6d008a788fc27265
import CricketMoments from 0xed398881d9bf40fb
import Everbloom from 0xe703f7fee6400754
import FantastecNFT from 0x2e1ee1e7a96826ce
import FlowToken from 0x1654653399040a61
import FlowStorageFees from 0xe467b9dd11fa00df
import FungibleToken from 0xf233dcee88fe0abe
import FUSD from 0x3c5959b568896393
import Gaia from 0x8b148183c28ff88f
import KlktnNFT from 0xabd6e80be7e9682c
import KOTD from 0x23dddd854fcc8c6f
import MatrixWorldFlowFestNFT from 0x2d2750f240198f91
import MusicBlock from 0x5634aefcb76e7d8c
import Mynft from 0xf6fcbef550d97aa5
import NonFungibleToken from 0x1d7e57aa55817448
import NyatheesOVO from 0x75e0b6de94eb05d0
import RaceDay_NFT from 0x329feb3ab062d289
import RareRooms_NFT from 0x329feb3ab062d289
import RCRDSHPNFT from 0x6c3ff40b90b928ab
import Shard from 0x82b54037a8f180cf
import SportsIconCollectible from 0x8de96244f54db422
import StarlyCard from 0x5b82f21c0edf76e3
import TheFabricantMysteryBox_FF1 from 0xbc9d692e2617a96e
import TopShot from 0x0b2a3299cc857e29
import TuneGO from 0x0d9bc5af3fc0c2e3
import Vouchers from 0x444f5ea22c6ea12c

transaction(records: {Address: {String: [UInt64]}}) {

    let feeVault: &FlowToken.Vault

    prepare(acct: AuthAccount) {
        self.feeVault = acct.borrow<&FlowToken.Vault>(from: /storage/flowTokenVault)
            ?? panic("failed to borrow reference to admin vault")

        for address in records.keys {
            let recipient = getAccount(address);
            let cards = records[address];
            for projectName in cards!.keys {
                switch projectName {

                    case "beam_fright":
                        let collectionRef = acct.borrow<&Beam.Collection>(from: Beam.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Beam collection")
                        let receiverRef = recipient.getCapability(Beam.CollectionPublicPath)!.borrow<&{Beam.BeamCollectionPublic}>()
                                    ?? panic("Could not borrow Beam receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "blocklete_golf":
                        let collectionRef = acct.borrow<&BlockleteGames_NFT.Collection>(from: BlockleteGames_NFT.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's BlockleteGames_NFT collection")
                        let receiverRef = recipient.getCapability(BlockleteGames_NFT.CollectionPublicPath)!.borrow<&BlockleteGames_NFT.Collection{NonFungibleToken.CollectionPublic,BlockleteGames_NFT.BlockleteGames_NFTCollectionPublic}>()
                                    ?? panic("Could not borrow BlockleteGames_NFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "chainmonsters":
                        let collectionRef = acct.borrow<&ChainmonstersRewards.Collection>(from: /storage/ChainmonstersRewardCollection)
                                    ?? panic("Could not borrow a reference to the owner's ChainmonstersRewards collection")
                        let receiverRef = recipient.getCapability(/public/ChainmonstersRewardCollection)!.borrow<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>()
                                    ?? panic("Could not borrow ChainmonstersRewards receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "crave":
                        let collectionRef = acct.borrow<&Crave.Collection>(from: Crave.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Crave collection")
                        let receiverRef = recipient.getCapability(Crave.CollectionPublicPath)!.borrow<&{Crave.CraveCollectionPublic}>()
                                    ?? panic("Could not borrow Crave receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "eternal":
                        let collectionRef = acct.borrow<&Shard.Collection>(from: /storage/EternalShardCollection)
                                    ?? panic("Could not borrow a reference to the owner's Shard collection")
                        let receiverRef = recipient.getCapability(/public/EternalShardCollection)!.borrow<&{Shard.ShardCollectionPublic}>()
                                    ?? panic("Could not borrow Shard receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "everbloom":
                        let collectionRef = acct.borrow<&Everbloom.Collection>(from: Everbloom.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Everbloom collection")
                        let receiverRef = recipient.getCapability(Everbloom.CollectionPublicPath)!.borrow<&{Everbloom.PrintCollectionPublic}>()
                                    ?? panic("Could not borrow Everbloom receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "fantastec_swap":
                        let collectionRef = acct.borrow<&FantastecNFT.Collection>(from: FantastecNFT.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's FantastecNFT collection")
                        let receiverRef = recipient.getCapability(FantastecNFT.CollectionPublicPath)!.borrow<&FantastecNFT.Collection{NonFungibleToken.CollectionPublic, FantastecNFT.FantastecNFTCollectionPublic}>()
                                    ?? panic("Could not borrow FantastecNFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "faze":
                        let collectionRef = acct.borrow<&CricketMoments.Collection>(from: CricketMoments.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's CricketMoments collection")
                        let receiverRef = recipient.getCapability(CricketMoments.CollectionPublicPath)!.borrow<&CricketMoments.Collection{NonFungibleToken.CollectionPublic, CricketMoments.CricketMomentsCollectionPublic}>()
                                    ?? panic("Could not borrow CricketMoments receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "jambb":
                        let collectionRef = acct.borrow<&Vouchers.Collection>(from: Vouchers.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Vouchers collection")
                        let receiverRef = recipient.getCapability(Vouchers.CollectionPublicPath)!.borrow<&{Vouchers.CollectionPublic}>()
                                    ?? panic("Could not borrow Vouchers receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "king_of_the_dot":
                        let collectionRef = acct.borrow<&KOTD.Collection>(from: KOTD.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's KOTD collection")
                        let receiverRef = recipient.getCapability(KOTD.CollectionPublicPath)!.borrow<&{KOTD.NiftoryCollectibleCollectionPublic}>()
                                    ?? panic("Could not borrow KOTD receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "klktn":
                        let collectionRef = acct.borrow<&KlktnNFT.Collection>(from: KlktnNFT.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's KlktnNFT collection")
                        let receiverRef = recipient.getCapability(KlktnNFT.CollectionPublicPath)!.borrow<&KlktnNFT.Collection{NonFungibleToken.CollectionPublic, KlktnNFT.KlktnNFTCollectionPublic}>()
                                    ?? panic("Could not borrow KlktnNFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "melos_studio":
                        let collectionRef = acct.borrow<&MusicBlock.Collection>(from: MusicBlock.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's MusicBlock collection")
                        let receiverRef = recipient.getCapability(MusicBlock.CollectionPublicPath)!.borrow<&MusicBlock.Collection{NonFungibleToken.CollectionPublic, MusicBlock.MusicBlockCollectionPublic}>()
                                    ?? panic("Could not borrow MusicBlock receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "mugen_art":
                        let collectionRef = acct.borrow<&Mynft.Collection>(from: Mynft.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Mynft collection")
                        let receiverRef = recipient.getCapability(Mynft.CollectionPublicPath)!.borrow<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>()
                                    ?? panic("Could not borrow Mynft receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "mynft":
                        let collectionRef = acct.borrow<&Mynft.Collection>(from: Mynft.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Mynft collection")
                        let receiverRef = recipient.getCapability(Mynft.CollectionPublicPath)!.borrow<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>()
                                    ?? panic("Could not borrow Mynft receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "nft_genius":
                        let collectionRef = acct.borrow<&Gaia.Collection>(from: Gaia.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Gaia collection")
                        let receiverRef = recipient.getCapability(Gaia.CollectionPublicPath)!.borrow<&{Gaia.CollectionPublic}>()
                                    ?? panic("Could not borrow Gaia receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "ovo":
                        let collectionRef = acct.borrow<&NyatheesOVO.Collection>(from: NyatheesOVO.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's NyatheesOVO collection")
                        let receiverRef = recipient.getCapability(NyatheesOVO.CollectionPublicPath)!.borrow<&NyatheesOVO.Collection{NonFungibleToken.CollectionPublic, NyatheesOVO.NFTCollectionPublic}>()
                                    ?? panic("Could not borrow NyatheesOVO receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "raceday_nft":
                        let collectionRef = acct.borrow<&RaceDay_NFT.Collection>(from: RaceDay_NFT.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's RaceDay_NFT collection")
                        let receiverRef = recipient.getCapability(RaceDay_NFT.CollectionPublicPath)!.borrow<&RaceDay_NFT.Collection{NonFungibleToken.CollectionPublic, RaceDay_NFT.RaceDay_NFTCollectionPublic}>()
                                    ?? panic("Could not borrow RaceDay_NFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "racing_time":
                        let collectionRef = acct.borrow<&Mynft.Collection>(from: Mynft.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Mynft collection")
                        let receiverRef = recipient.getCapability(Mynft.CollectionPublicPath)!.borrow<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>()
                                    ?? panic("Could not borrow Mynft receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "rarerooms":
                        let collectionRef = acct.borrow<&RareRooms_NFT.Collection>(from: RareRooms_NFT.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's RareRooms_NFT collection")
                        let receiverRef = recipient.getCapability(RareRooms_NFT.CollectionPublicPath)!.borrow<&RareRooms_NFT.Collection{NonFungibleToken.CollectionPublic, RareRooms_NFT.RareRooms_NFTCollectionPublic}>()
                                    ?? panic("Could not borrow RareRooms_NFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "rcrdshp":
                        let collectionRef = acct.borrow<&RCRDSHPNFT.Collection>(from: RCRDSHPNFT.collectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's RCRDSHPNFT collection")
                        let receiverRef = recipient.getCapability(RCRDSHPNFT.collectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic}>()
                                    ?? panic("Could not borrow RCRDSHPNFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "sportsicon":
                        let collectionRef = acct.borrow<&SportsIconCollectible.Collection>(from: SportsIconCollectible.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's SportsIconCollectible collection")
                        let receiverRef = recipient.getCapability(SportsIconCollectible.CollectionPublicPath)!.borrow<&SportsIconCollectible.Collection{NonFungibleToken.CollectionPublic, SportsIconCollectible.CollectibleCollectionPublic}>()
                                    ?? panic("Could not borrow SportsIconCollectible receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "starly":
                        let collectionRef = acct.borrow<&StarlyCard.Collection>(from: StarlyCard.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's StarlyCard collection")
                        let receiverRef = recipient.getCapability(StarlyCard.CollectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic}>()
                                    ?? panic("Could not borrow StarlyCard receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "the_fabricant":
                        let collectionRef = acct.borrow<&TheFabricantMysteryBox_FF1.Collection>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's TheFabricantMysteryBox_FF1 collection")
                        let receiverRef = recipient.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)!.borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()
                                    ?? panic("Could not borrow TheFabricantMysteryBox_FF1 receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "thing_fund":
                        let collectionRef = acct.borrow<&CaaPass.Collection>(from: CaaPass.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's CaaPass collection")
                        let receiverRef = recipient.getCapability(CaaPass.CollectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic, CaaPass.CollectionPublic}>()
                                    ?? panic("Could not borrow CaaPass receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "topshot":
                        let collectionRef = acct.borrow<&TopShot.Collection>(from: /storage/MomentCollection)
                                    ?? panic("Could not borrow a reference to the owner's TopShot collection")
                        let receiverRef = recipient.getCapability(/public/MomentCollection)!.borrow<&{TopShot.MomentCollectionPublic}>()
                                    ?? panic("Could not borrow TopShot receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "tunego":
                        let collectionRef = acct.borrow<&TuneGO.Collection>(from: TuneGO.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's TuneGO collection")
                        let receiverRef = recipient.getCapability(TuneGO.CollectionPublicPath)!.borrow<&{TuneGO.TuneGOCollectionPublic}>()
                                    ?? panic("Could not borrow TuneGO receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "voxel_knight":
                        let collectionRef = acct.borrow<&Mynft.Collection>(from: Mynft.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Mynft collection")
                        let receiverRef = recipient.getCapability(Mynft.CollectionPublicPath)!.borrow<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>()
                                    ?? panic("Could not borrow Mynft receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "whitematrix":
                        let collectionRef = acct.borrow<&MatrixWorldFlowFestNFT.Collection>(from: MatrixWorldFlowFestNFT.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's MatrixWorldFlowFestNFT collection")
                        let receiverRef = recipient.getCapability(MatrixWorldFlowFestNFT.CollectionPublicPath)!.borrow<&MatrixWorldFlowFestNFT.Collection{NonFungibleToken.CollectionPublic, MatrixWorldFlowFestNFT.MatrixWorldFlowFestNFTCollectionPublic}>()
                                    ?? panic("Could not borrow MatrixWorldFlowFestNFT receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }

                    case "xtingles":
                        let collectionRef = acct.borrow<&Collectible.Collection>(from: Collectible.CollectionStoragePath)
                                    ?? panic("Could not borrow a reference to the owner's Collectible collection")
                        let receiverRef = recipient.getCapability(Collectible.CollectionPublicPath)!.borrow<&{Collectible.CollectionPublic}>()
                                    ?? panic("Could not borrow Collectible receiver reference")
                        for id in cards![projectName]! {
                            let nft <- collectionRef.withdraw(withdrawID: id)
                            receiverRef.deposit(token: <- nft)
                        }
                }
            }
        }
    }

    execute {

        fun returnFlowFromStorage(_ storage: UInt64): UFix64 {
            let f = UFix64(storage % 100000000 as UInt64) * 0.00000001 as UFix64 + UFix64(storage / 100000000 as UInt64)
            let storageMb = f * 100.0 as UFix64
            let storage = FlowStorageFees.storageCapacityToFlow(storageMb)
            return storage
        }

        for address in records.keys {
            let recipientAccount = getAccount(address);
            var storageUsed = returnFlowFromStorage(recipientAccount.storageUsed) + 0.0001
            var storageTotal = returnFlowFromStorage(recipientAccount.storageCapacity)
            if (storageUsed > storageTotal) {
                let difference = storageUsed - storageTotal
                let sentVault <- self.feeVault.withdraw(amount: difference)
                let receiver = recipientAccount.getCapability(/public/flowTokenReceiver)
                    .borrow<&{FungibleToken.Receiver}>()
                        ?? panic("failed to borrow reference to recipient vault")
                receiver.deposit(from: <-sentVault)
            }
        }
    }
}

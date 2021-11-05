import Beam from "../contracts/Beam.cdc"
import BlockleteGames_NFT from "../contracts/BlockleteGames_NFT.cdc"
import CaaPass from "../contracts/CaaPass.cdc"
import ChainmonstersRewards from "../contracts/ChainmonstersRewards.cdc"
import Collectible from "../contracts/Collectible.cdc"
import Crave from "../contracts/Crave.cdc"
import CricketMoments from "../contracts/CricketMoments.cdc"
import Everbloom from "../contracts/Everbloom.cdc"
import FantastecNFT from "../contracts/FantastecNFT.cdc"
import FlowToken from "../contracts/FlowToken.cdc"
import FlowStorageFees from "../contracts/FlowStorageFees.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import FUSD from "../contracts/FUSD.cdc"
import Gaia from "../contracts/Gaia.cdc"
import KlktnNFT from "../contracts/KlktnNFT.cdc"
import KOTD from "../contracts/KOTD.cdc"
import MatrixWorldFlowFestNFT from "../contracts/MatrixWorldFlowFestNFT.cdc"
import MusicBlock from "../contracts/MusicBlock.cdc"
import Mynft from "../contracts/Mynft.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import NyatheesOVO from "../contracts/NyatheesOVO.cdc"
import RaceDay_NFT from "../contracts/RaceDay_NFT.cdc"
import RareRooms_NFT from "../contracts/RareRooms_NFT.cdc"
import RCRDSHPNFT from "../contracts/RCRDSHPNFT.cdc"
import Shard from "../contracts/Shard.cdc"
import SportsIconCollectible from "../contracts/SportsIconCollectible.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"
import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"
import TopShot from "../contracts/TopShot.cdc"
import TuneGO from "../contracts/TuneGO.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

transaction() {

    let feeVault: &FlowToken.Vault

    prepare(acct: AuthAccount) {
        self.feeVault = acct.borrow<&FlowToken.Vault>(from: /storage/flowTokenVault)
            ?? panic("failed to borrow reference to admin vault")

        let records: {Address: {String: [UInt64]}} = {
            Address(0x5f14b7e68e0bc3c3): {
                "mynft": [14397],
                "starly": [13199],
                "faze": [5907]
            }
        }

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
        let records: {Address: {String: [UInt64]}} = {
            Address(0x49bd10fa492edb04): {}
        }

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

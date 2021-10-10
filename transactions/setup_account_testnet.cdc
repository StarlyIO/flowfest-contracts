import Beam from "../contracts/Beam.cdc"
import CaaPass from "../contracts/CaaPass.cdc"
import ChainmonstersRewards from "../contracts/ChainmonstersRewards.cdc"
import Collectible from "../contracts/Collectible.cdc"
import Crave from "../contracts/Crave.cdc"
import Everbloom from "../contracts/Everbloom.cdc"
import FantastecNFT from "../contracts/FantastecNFT.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import FUSD from "../contracts/FUSD.cdc"
import Gaia from "../contracts/Gaia.cdc"
import KlktnNFT from "../contracts/KlktnNFT.cdc"
import KOTD from "../contracts/KOTD.cdc"
import MatrixWorldFlowFestNFT from "../contracts/MatrixWorldFlowFestNFT.cdc"
import Mynft from "../contracts/Mynft.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import Shard from "../contracts/Shard.cdc"
import SportsIconCollectible from "../contracts/SportsIconCollectible.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"
import StarlyCardMarket from "../contracts/StarlyCardMarket.cdc"
import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"
import TuneGO from "../contracts/TuneGO.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

pub fun hasBeam(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Beam.BeamCollectionPublic}>(Beam.CollectionPublicPath)
        .check()
}

pub fun hasCaaPass(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{NonFungibleToken.CollectionPublic, CaaPass.CollectionPublic}>(CaaPass.CollectionPublicPath)
        .check()
}

pub fun hasChainmonstersRewards(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>(/public/ChainmonstersRewardCollection)
        .check()
}

pub fun hasCrave(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Crave.CraveCollectionPublic}>(Crave.CollectionPublicPath)
        .check()
}

pub fun hasEverbloom(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Everbloom.PrintCollectionPublic}>(Everbloom.CollectionPublicPath)
        .check()
}

pub fun hasFantastec(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&FantastecNFT.Collection{NonFungibleToken.CollectionPublic, FantastecNFT.FantastecNFTCollectionPublic}>(FantastecNFT.CollectionPublicPath)
        .check()
}

pub fun hasFUSD(_ address: Address): Bool {
    let receiver: Bool = getAccount(address)
        .getCapability<&FUSD.Vault{FungibleToken.Receiver}>(/public/fusdReceiver)
        .check()
    let balance: Bool = getAccount(address)
        .getCapability<&FUSD.Vault{FungibleToken.Balance}>(/public/fusdBalance)
        .check()
    return receiver && balance
}

pub fun hasGaia(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Gaia.CollectionPublic}>(Gaia.CollectionPublicPath)
        .check()
}

pub fun hasJambb(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Vouchers.CollectionPublic}>(Vouchers.CollectionPublicPath)
        .check()
}

pub fun hasKLKTN(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&KlktnNFT.Collection{NonFungibleToken.CollectionPublic, KlktnNFT.KlktnNFTCollectionPublic}>(KlktnNFT.CollectionPublicPath)
        .check()
}

pub fun hasKOTD(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{KOTD.NiftoryCollectibleCollectionPublic}>(KOTD.CollectionPublicPath)
        .check()
}

pub fun hasMatrixWorldFlowFestNFT(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&MatrixWorldFlowFestNFT.Collection{NonFungibleToken.CollectionPublic, MatrixWorldFlowFestNFT.MatrixWorldFlowFestNFTCollectionPublic}>(MatrixWorldFlowFestNFT.CollectionPublicPath)
        .check()
}

pub fun hasMynft(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&Mynft.Collection{Mynft.MynftCollectionPublic}>(Mynft.CollectionPublicPath)
        .check()
}

pub fun hasShard(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Shard.ShardCollectionPublic}>(/public/EternalShardCollection)
        .check()
}

pub fun hasSportsIcon(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&SportsIconCollectible.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, SportsIconCollectible.CollectibleCollectionPublic}>(SportsIconCollectible.CollectionPublicPath)
        .check()
}

pub fun hasStarlyCard(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&StarlyCard.Collection{NonFungibleToken.CollectionPublic, StarlyCard.StarlyCardCollectionPublic}>(StarlyCard.CollectionPublicPath)
        .check()
}

pub fun hasStarlyCardMarket(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&StarlyCardMarket.Collection{StarlyCardMarket.CollectionPublic}>(StarlyCardMarket.CollectionPublicPath)
        .check()
}

pub fun hasTheFabricant(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
        .check()
}

pub fun hasTuneGO(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{TuneGO.TuneGOCollectionPublic}>(TuneGO.CollectionPublicPath)
        .check()
}

pub fun hasXtingles(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Collectible.CollectionPublic}>(Collectible.CollectionPublicPath)
        .check()
}

transaction {
    prepare(acct: AuthAccount) {
        if !hasBeam(acct.address) {
             if acct.borrow<&Beam.Collection>(from: Beam.CollectionStoragePath) == nil {
                 acct.save(<-Beam.createEmptyCollection(), to: Beam.CollectionStoragePath)
             }
             acct.link<&{Beam.BeamCollectionPublic}>(Beam.CollectionPublicPath, target: Beam.CollectionStoragePath)
        }
        if !hasCaaPass(acct.address) {
             if acct.borrow<&CaaPass.Collection>(from: CaaPass.CollectionStoragePath) == nil {
                 acct.save(<-CaaPass.createEmptyCollection(), to: CaaPass.CollectionStoragePath)
             }
             acct.link<&{NonFungibleToken.CollectionPublic, CaaPass.CollectionPublic}>(CaaPass.CollectionPublicPath, target: CaaPass.CollectionStoragePath)
        }
        if !hasChainmonstersRewards(acct.address) {
             if acct.borrow<&ChainmonstersRewards.Collection>(from: /storage/ChainmonstersRewardCollection) == nil {
                 acct.save(<-ChainmonstersRewards.createEmptyCollection(), to: /storage/ChainmonstersRewardCollection)
             }
             acct.link<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>(/public/ChainmonstersRewardCollection, target: /storage/ChainmonstersRewardCollection)
        }
        if !hasCrave(acct.address) {
             if acct.borrow<&Crave.Collection>(from: Crave.CollectionStoragePath) == nil {
                 acct.save(<-Crave.createEmptyCollection(), to: Crave.CollectionStoragePath)
             }
             acct.link<&{Crave.CraveCollectionPublic}>(Crave.CollectionPublicPath, target: Crave.CollectionStoragePath)
        }
        if !hasEverbloom(acct.address) {
             if acct.borrow<&Everbloom.Collection>(from: Everbloom.CollectionStoragePath) == nil {
                 acct.save(<-Everbloom.createEmptyCollection(), to: Everbloom.CollectionStoragePath)
             }
             acct.link<&{Everbloom.PrintCollectionPublic}>(Everbloom.CollectionPublicPath, target: Everbloom.CollectionStoragePath)
        }
        if !hasFantastec(acct.address) {
             if acct.borrow<&FantastecNFT.Collection>(from: FantastecNFT.CollectionStoragePath) == nil {
                 acct.save(<-FantastecNFT.createEmptyCollection(), to: FantastecNFT.CollectionStoragePath)
             }
             acct.link<&FantastecNFT.Collection{NonFungibleToken.CollectionPublic, FantastecNFT.FantastecNFTCollectionPublic}>(FantastecNFT.CollectionPublicPath, target: FantastecNFT.CollectionStoragePath)
        }
        if !hasFUSD(acct.address) {
            if acct.borrow<&FUSD.Vault>(from: /storage/fusdVault) == nil {
                acct.save(<-FUSD.createEmptyVault(), to: /storage/fusdVault)
            }
            acct.link<&FUSD.Vault{FungibleToken.Receiver}>(/public/fusdReceiver, target: /storage/fusdVault)
            acct.link<&FUSD.Vault{FungibleToken.Balance}>(/public/fusdBalance, target: /storage/fusdVault)
        }
        if !hasGaia(acct.address) {
            if acct.borrow<&Gaia.Collection>(from: Gaia.CollectionStoragePath) == nil {
                acct.save(<-Gaia.createEmptyCollection(), to: Gaia.CollectionStoragePath)
            }
            acct.link<&{Gaia.CollectionPublic}>(Gaia.CollectionPublicPath, target: Gaia.CollectionStoragePath)
        }
        if !hasJambb(acct.address) {
             if acct.borrow<&Vouchers.Collection>(from: Vouchers.CollectionStoragePath) == nil {
                 acct.save(<-Vouchers.createEmptyCollection(), to: Vouchers.CollectionStoragePath)
             }
             acct.link<&{Vouchers.CollectionPublic}>(Vouchers.CollectionPublicPath, target: Vouchers.CollectionStoragePath)
        }
        if !hasKLKTN(acct.address) {
             if acct.borrow<&KlktnNFT.Collection>(from: KlktnNFT.CollectionStoragePath) == nil {
                 acct.save(<-KlktnNFT.createEmptyCollection(), to: KlktnNFT.CollectionStoragePath)
             }
             acct.link<&KlktnNFT.Collection{NonFungibleToken.CollectionPublic, KlktnNFT.KlktnNFTCollectionPublic}>(KlktnNFT.CollectionPublicPath, target: KlktnNFT.CollectionStoragePath)
        }
        if !hasKOTD(acct.address) {
             if acct.borrow<&KOTD.Collection>(from: KOTD.CollectionStoragePath) == nil {
                 acct.save(<-KOTD.createEmptyCollection(), to: KOTD.CollectionStoragePath)
             }
             acct.link<&{KOTD.NiftoryCollectibleCollectionPublic}>(KOTD.CollectionPublicPath, target: KOTD.CollectionStoragePath)
        }
        if !hasMatrixWorldFlowFestNFT(acct.address) {
             if acct.borrow<&MatrixWorldFlowFestNFT.Collection>(from: MatrixWorldFlowFestNFT.CollectionStoragePath) == nil {
                 acct.save(<-MatrixWorldFlowFestNFT.createEmptyCollection(), to: MatrixWorldFlowFestNFT.CollectionStoragePath)
             }
             acct.link<&MatrixWorldFlowFestNFT.Collection{NonFungibleToken.CollectionPublic, MatrixWorldFlowFestNFT.MatrixWorldFlowFestNFTCollectionPublic}>(MatrixWorldFlowFestNFT.CollectionPublicPath, target: MatrixWorldFlowFestNFT.CollectionStoragePath)
        }
        if !hasMynft(acct.address) {
             if acct.borrow<&Mynft.Collection>(from: Mynft.CollectionStoragePath) == nil {
                 acct.save(<-Mynft.createEmptyCollection(), to: Mynft.CollectionStoragePath)
             }
             acct.link<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>(Mynft.CollectionPublicPath, target: Mynft.CollectionStoragePath)
        }
        if !hasShard(acct.address) {
             if acct.borrow<&Shard.Collection>(from: /storage/EternalShardCollection) == nil {
                 acct.save(<-Shard.createEmptyCollection(), to: /storage/EternalShardCollection)
             }
             acct.link<&{Shard.ShardCollectionPublic}>(/public/EternalShardCollection, target: /storage/EternalShardCollection)
        }
        if !hasSportsIcon(acct.address) {
             if acct.borrow<&SportsIconCollectible.Collection>(from: SportsIconCollectible.CollectionStoragePath) == nil {
                 acct.save(<-SportsIconCollectible.createEmptyCollection(), to: SportsIconCollectible.CollectionStoragePath)
             }
             acct.link<&SportsIconCollectible.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, SportsIconCollectible.CollectibleCollectionPublic}>(SportsIconCollectible.CollectionPublicPath, target: SportsIconCollectible.CollectionStoragePath)
        }
        if !hasStarlyCard(acct.address) {
            if acct.borrow<&StarlyCard.Collection>(from: StarlyCard.CollectionStoragePath) == nil {
                acct.save(<-StarlyCard.createEmptyCollection(), to: StarlyCard.CollectionStoragePath)
            }
            acct.link<&StarlyCard.Collection{NonFungibleToken.CollectionPublic, StarlyCard.StarlyCardCollectionPublic}>(StarlyCard.CollectionPublicPath, target: StarlyCard.CollectionStoragePath)
        }
        if !hasStarlyCardMarket(acct.address) {
             if acct.borrow<&StarlyCardMarket.Collection>(from: StarlyCardMarket.CollectionStoragePath) == nil {
                 acct.save(<-StarlyCardMarket.createEmptyCollection(), to: StarlyCardMarket.CollectionStoragePath)
             }
             acct.link<&StarlyCardMarket.Collection{StarlyCardMarket.CollectionPublic}>(StarlyCardMarket.CollectionPublicPath, target: StarlyCardMarket.CollectionStoragePath)
        }
        if !hasTheFabricant(acct.address) {
             if acct.borrow<&TheFabricantMysteryBox_FF1.Collection>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath) == nil {
                 acct.save(<-TheFabricantMysteryBox_FF1.createEmptyCollection(), to: TheFabricantMysteryBox_FF1.CollectionStoragePath)
             }
             acct.link<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath, target: TheFabricantMysteryBox_FF1.CollectionStoragePath)
        }
        if !hasTuneGO(acct.address) {
             if acct.borrow<&TuneGO.Collection>(from: TuneGO.CollectionStoragePath) == nil {
                 acct.save(<-TuneGO.createEmptyCollection(), to: TuneGO.CollectionStoragePath)
             }
             acct.link<&{TuneGO.TuneGOCollectionPublic}>(TuneGO.CollectionPublicPath, target: TuneGO.CollectionStoragePath)
        }
        if !hasXtingles(acct.address) {
             if acct.borrow<&Collectible.Collection>(from: Collectible.CollectionStoragePath) == nil {
                 acct.save(<-Collectible.createEmptyCollection(), to: Collectible.CollectionStoragePath)
             }
             acct.link<&{Collectible.CollectionPublic}>(Collectible.CollectionPublicPath, target: Collectible.CollectionStoragePath)
        }
    }
}

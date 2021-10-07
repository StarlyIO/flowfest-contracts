import Beam from "../contracts/Beam.cdc"
import BlockleteGames_NFT from "../contracts/BlockleteGames_NFT.cdc"
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
import TuneGO from "../contracts/TuneGO.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

pub fun hasBeam(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Beam.BeamCollectionPublic}>(Beam.CollectionPublicPath)
        .check()
}

pub fun hasBlockleteGames(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&BlockleteGames_NFT.Collection{NonFungibleToken.CollectionPublic,BlockleteGames_NFT.BlockleteGames_NFTCollectionPublic}>(BlockleteGames_NFT.CollectionPublicPath)
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

pub fun hasMusicBlock(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&MusicBlock.Collection{NonFungibleToken.CollectionPublic, MusicBlock.MusicBlockCollectionPublic}>(MusicBlock.CollectionPublicPath)
        .check()
}

pub fun hasMynft(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&Mynft.Collection{Mynft.MynftCollectionPublic}>(Mynft.CollectionPublicPath)
        .check()
}

pub fun hasNyatheesOVO(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&NyatheesOVO.Collection{NonFungibleToken.CollectionPublic, NyatheesOVO.NFTCollectionPublic}>(NyatheesOVO.CollectionPublicPath)
        .check()
}

pub fun hasRaceDay(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&RaceDay_NFT.Collection{NonFungibleToken.CollectionPublic, RaceDay_NFT.RaceDay_NFTCollectionPublic}>(RaceDay_NFT.CollectionPublicPath)
        .check()
}

pub fun hasRareRooms(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&RareRooms_NFT.Collection{NonFungibleToken.CollectionPublic, RareRooms_NFT.RareRooms_NFTCollectionPublic}>(RareRooms_NFT.CollectionPublicPath)
        .check()
}

pub fun hasRCRDSHPNFT(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{NonFungibleToken.CollectionPublic}>(RCRDSHPNFT.collectionPublicPath)
        .check()
}

pub fun hasShard(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{NonFungibleToken.CollectionPublic}>(/public/ShardCollection)
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

pub fun main(address: Address): {String: Bool} {
    let ret: {String: Bool} = {}
    ret["Beam"] = hasBeam(address)
    ret["BlockleteGames"] = hasBlockleteGames(address)
    ret["CaaPass"] = hasCaaPass(address)
    ret["ChainmonstersRewards"] = hasChainmonstersRewards(address)
    ret["Crave"] = hasCrave(address)
    ret["Everbloom"] = hasEverbloom(address)
    ret["Fantastec"] = hasFantastec(address)
    ret["FUSD"] = hasFUSD(address)
    ret["Gaia"] = hasGaia(address)
    ret["Jambb"] = hasJambb(address)
    ret["KLKTN"] = hasKLKTN(address)
    ret["KOTD"] = hasKOTD(address)
    ret["MatrixWorldFlowFestNFT"] = hasMatrixWorldFlowFestNFT(address)
    ret["MusicBlock"] = hasMusicBlock(address)
    ret["Mynft"] = hasMynft(address)
    ret["NyatheesOVO"] = hasNyatheesOVO(address)
    ret["RaceDay"] = hasRaceDay(address)
    ret["RareRooms"] = hasRareRooms(address)
    ret["RCRDSHPNFT"] = hasRCRDSHPNFT(address)
    ret["Shard"] = hasShard(address)
    ret["SportsIcon"] = hasSportsIcon(address)
    ret["StarlyCard"] = hasStarlyCard(address)
    ret["TuneGO"] = hasTuneGO(address)
    ret["Xtingles"] = hasXtingles(address)
    return ret
}

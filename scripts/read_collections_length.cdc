import Beam from "../contracts/Beam.cdc"
import BlockleteGames_NFT from "../contracts/BlockleteGames_NFT.cdc"
import CaaArts from "../contracts/CaaArts.cdc"
import CaaPass from "../contracts/CaaPass.cdc"
import ChainmonstersMarketplace from "../contracts/ChainmonstersMarketplace.cdc"
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
import RareRooms_NFT from "../contracts/RareRooms_NFT.cdc"
import RCRDSHPNFT from "../contracts/RCRDSHPNFT.cdc"
import Shard from "../contracts/Shard.cdc"
import SportsIconCollectible from "../contracts/SportsIconCollectible.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"
import StarlyCardMarket from "../contracts/StarlyCardMarket.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

pub fun main(address: Address): {String: Int} {
    let account = getAccount(address)
    let ret: {String: Int} = {}

    let beamCollectionRef = account.getCapability(Beam.CollectionPublicPath)!
                .borrow<&{Beam.BeamCollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Beam"] = beamCollectionRef.getIDs().length;

    let blockleteCollectionRef = account.getCapability(BlockleteGames_NFT.CollectionPublicPath)!
                .borrow<&{NonFungibleToken.CollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Blocklete"] = blockleteCollectionRef.getIDs().length;

    let caaArtsCollectionRef = account.getCapability(CaaArts.CollectionPublicPath)!
                .borrow<&{NonFungibleToken.CollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["CaaArts"] = caaArtsCollectionRef.getIDs().length;

    let caaPassCollectionRef = account.getCapability(CaaPass.CollectionPublicPath)!
                .borrow<&{NonFungibleToken.CollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["CaaPass"] = caaPassCollectionRef.getIDs().length;

    let chainmonstersCollectionRef = account.getCapability(/public/ChainmonstersRewardCollection)!
                .borrow<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["ChainmonstersRewards"] = chainmonstersCollectionRef.getIDs().length;

    let craveCollectionRef = account.getCapability(Crave.CollectionPublicPath)!
                .borrow<&{Crave.CraveCollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Crave"] = craveCollectionRef.getIDs().length;

    let everbloomCollectionRef = account.getCapability(Everbloom.CollectionPublicPath)!
                .borrow<&{Everbloom.PrintCollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Everbloom"] = everbloomCollectionRef.getIDs().length;

    let fantastecCollectionRef = account.getCapability(FantastecNFT.CollectionPublicPath)!
                .borrow<&{NonFungibleToken.CollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Fantastec"] = fantastecCollectionRef.getIDs().length;

    let gaiaCollectionRef = account.getCapability(Gaia.CollectionPublicPath)!
                .borrow<&{Gaia.CollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Gaia"] = gaiaCollectionRef.getIDs().length;

    let jambbCollectionRef = account.getCapability(Vouchers.CollectionPublicPath)!
                .borrow<&{Vouchers.CollectionPublic}>()
                ?? panic("Could not borrow capability from public collection")
    ret["Jambb"] = jambbCollectionRef.getIDs().length;

    let klktnCollectionRef = account.getCapability(KlktnNFT.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["KLKTN"] = klktnCollectionRef.getIDs().length;

    let kotdCollectionRef = account.getCapability(KOTD.CollectionPublicPath)!
            .borrow<&{KOTD.NiftoryCollectibleCollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["KOTD"] = kotdCollectionRef.getIDs().length;

    let matrixWorldFlowFestCollectionRef = account.getCapability(MatrixWorldFlowFestNFT.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["MatrixWorldFlowFest"] = matrixWorldFlowFestCollectionRef.getIDs().length;

    let musicBlockCollectionRef = account.getCapability(MusicBlock.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["MusicBlock"] = musicBlockCollectionRef.getIDs().length;

    let mynftCollectionRef = account.getCapability(Mynft.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["Mynft"] = mynftCollectionRef.getIDs().length;

    let nyatheesOVOCollectionRef = account.getCapability(NyatheesOVO.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["NyatheesOVO"] = nyatheesOVOCollectionRef.getIDs().length;

    let rareRoomsCollectionRef = account.getCapability(RareRooms_NFT.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["RareRooms"] = rareRoomsCollectionRef.getIDs().length;

    let rcrdshpnftCollectionRef = account.getCapability(RCRDSHPNFT.collectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["RCRDSHPNFT"] = rcrdshpnftCollectionRef.getIDs().length;

    let shardCollectionRef = account.getCapability(/public/ShardCollection)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["Shard"] = shardCollectionRef.getIDs().length;

    let sportsIconCollectionRef = account.getCapability(SportsIconCollectible.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["SportsIcon"] = sportsIconCollectionRef.getIDs().length;

    let starlyCollectionRef = account.getCapability(StarlyCard.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["Starly"] = starlyCollectionRef.getIDs().length;

    let xtinglesCollectionRef = account.getCapability(Collectible.CollectionPublicPath)!
            .borrow<&{Collectible.CollectionPublic}>()
            ?? panic("Could not borrow capability from public collection")
    ret["Xtingles"] = xtinglesCollectionRef.getIDs().length;

    return ret
}
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
import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"
import TuneGO from "../contracts/TuneGO.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

// This script returns an array of all the NFT IDs in an account's collection.

pub fun main(address: Address): {String: UInt64} {
    let account = getAccount(address)
    let ret: {String: UInt64} = {}

    let beamCollectionRef = account.getCapability(Beam.CollectionPublicPath)!.borrow<&{Beam.BeamCollectionPublic}>()
        ?? panic("Could not borrow Beam receiver reference")
    ret["Beam"] = beamCollectionRef.getIDs()[0];

    let blockleteCollectionRef = account.getCapability(BlockleteGames_NFT.CollectionPublicPath)!.borrow<&BlockleteGames_NFT.Collection{NonFungibleToken.CollectionPublic,BlockleteGames_NFT.BlockleteGames_NFTCollectionPublic}>()
        ?? panic("Could not borrow BlockleteGames_NFT receiver reference")
    ret["BlockleteGames_NFT"] = blockleteCollectionRef.getIDs()[0];

    let chainmonstersCollectionRef = account.getCapability(/public/ChainmonstersRewardCollection)!.borrow<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>()
        ?? panic("Could not borrow ChainmonstersRewards receiver reference")
    ret["ChainmonstersRewards"] = chainmonstersCollectionRef.getIDs()[0];

    let craveCollectionRef = account.getCapability(Crave.CollectionPublicPath)!.borrow<&{Crave.CraveCollectionPublic}>()
        ?? panic("Could not borrow Crave receiver reference")
    ret["Crave"] = craveCollectionRef.getIDs()[0];

    let shardCollectionRef = account.getCapability(/public/EternalShardCollection)!.borrow<&{Shard.ShardCollectionPublic}>()
        ?? panic("Could not borrow Shard receiver reference")
    ret["Shard"] = shardCollectionRef.getIDs()[0];

    let everbloomCollectionRef = account.getCapability(Everbloom.CollectionPublicPath)!.borrow<&{Everbloom.PrintCollectionPublic}>()
        ?? panic("Could not borrow Everbloom receiver reference")
    ret["Everbloom"] = everbloomCollectionRef.getIDs()[0];

    let fantastecCollectionRef = account.getCapability(FantastecNFT.CollectionPublicPath)!.borrow<&FantastecNFT.Collection{NonFungibleToken.CollectionPublic, FantastecNFT.FantastecNFTCollectionPublic}>()
        ?? panic("Could not borrow FantastecNFT receiver reference")
    ret["FantastecNFT"] = fantastecCollectionRef.getIDs()[0];

    let vouchersCollectionRef = account.getCapability(Vouchers.CollectionPublicPath)!.borrow<&{Vouchers.CollectionPublic}>()
        ?? panic("Could not borrow Vouchers receiver reference")
    ret["Vouchers"] = vouchersCollectionRef.getIDs()[0];

    let kotdCollectionRef = account.getCapability(KOTD.CollectionPublicPath)!.borrow<&{KOTD.NiftoryCollectibleCollectionPublic}>()
        ?? panic("Could not borrow KOTD receiver reference")
    ret["KOTD"] = kotdCollectionRef.getIDs()[0];

    let klktnCollectionRef = account.getCapability(KlktnNFT.CollectionPublicPath)!.borrow<&KlktnNFT.Collection{NonFungibleToken.CollectionPublic, KlktnNFT.KlktnNFTCollectionPublic}>()
        ?? panic("Could not borrow KlktnNFT receiver reference")
    ret["KlktnNFT"] = klktnCollectionRef.getIDs()[0];

    let musicBlockCollectionRef = account.getCapability(MusicBlock.CollectionPublicPath)!.borrow<&MusicBlock.Collection{NonFungibleToken.CollectionPublic, MusicBlock.MusicBlockCollectionPublic}>()
        ?? panic("Could not borrow MusicBlock receiver reference")
    ret["MusicBlock"] = musicBlockCollectionRef.getIDs()[0];

    let mynftCollectionRef = account.getCapability(Mynft.CollectionPublicPath)!.borrow<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>()
        ?? panic("Could not borrow Mynft receiver reference")
    ret["Mynft"] = mynftCollectionRef.getIDs()[0];

    let gaiaCollectionRef = account.getCapability(Gaia.CollectionPublicPath)!.borrow<&{Gaia.CollectionPublic}>()
        ?? panic("Could not borrow Gaia receiver reference")
    ret["Gaia"] = gaiaCollectionRef.getIDs()[0];

    let ovoCollectionRef = account.getCapability(NyatheesOVO.CollectionPublicPath)!.borrow<&NyatheesOVO.Collection{NonFungibleToken.CollectionPublic, NyatheesOVO.NFTCollectionPublic}>()
        ?? panic("Could not borrow NyatheesOVO receiver reference")
    ret["NyatheesOVO"] = ovoCollectionRef.getIDs()[0];

    let raceDayCollectionRef = account.getCapability(RaceDay_NFT.CollectionPublicPath)!.borrow<&RaceDay_NFT.Collection{NonFungibleToken.CollectionPublic, RaceDay_NFT.RaceDay_NFTCollectionPublic}>()
        ?? panic("Could not borrow RaceDay_NFT receiver reference")
    ret["RaceDay_NFT"] = raceDayCollectionRef.getIDs()[0];

    let rareRoomsCollectionRef = account.getCapability(RareRooms_NFT.CollectionPublicPath)!.borrow<&RareRooms_NFT.Collection{NonFungibleToken.CollectionPublic, RareRooms_NFT.RareRooms_NFTCollectionPublic}>()
        ?? panic("Could not borrow RareRooms_NFT receiver reference")
    ret["RareRooms"] = rareRoomsCollectionRef.getIDs()[0];

    let rcrdshpnftCollectionRef = account.getCapability(RCRDSHPNFT.collectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow RCRDSHPNFT receiver reference")
    ret["RCRDSHPNFT"] = rcrdshpnftCollectionRef.getIDs()[0];

    let sportsIconCollectionRef = account.getCapability(SportsIconCollectible.CollectionPublicPath)!.borrow<&SportsIconCollectible.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, SportsIconCollectible.CollectibleCollectionPublic}>()
        ?? panic("Could not borrow SportsIconCollectible receiver reference")
    ret["SportsIcon"] = sportsIconCollectionRef.getIDs()[0];

    let starlyCardCollectionRef = account.getCapability(StarlyCard.CollectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow StarlyCard receiver reference")
    ret["StarlyCard"] = starlyCardCollectionRef.getIDs()[0];

    let theFabricanCollectionRef = account.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)!.borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()
        ?? panic("Could not borrow TheFabricantMysteryBox_FF1 receiver reference")
    ret["TheFabricant"] = theFabricanCollectionRef.getIDs()[0];

    let caaPassCollectionRef = account.getCapability(CaaPass.CollectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic, CaaPass.CollectionPublic}>()
        ?? panic("Could not borrow CaaPass receiver reference")
    ret["CaaPass"] = caaPassCollectionRef.getIDs()[0];

    let tuneGoCollectionRef = account.getCapability(TuneGO.CollectionPublicPath)!.borrow<&{TuneGO.TuneGOCollectionPublic}>()
        ?? panic("Could not borrow TuneGO receiver reference")
    ret["TuneGO"] = tuneGoCollectionRef.getIDs()[0];

    let matrixWorldCollectionRef = account.getCapability(MatrixWorldFlowFestNFT.CollectionPublicPath)!.borrow<&MatrixWorldFlowFestNFT.Collection{NonFungibleToken.CollectionPublic, MatrixWorldFlowFestNFT.MatrixWorldFlowFestNFTCollectionPublic}>()
        ?? panic("Could not borrow MatrixWorldFlowFestNFT receiver reference")
    ret["MatrixWorld"] = matrixWorldCollectionRef.getIDs()[0];

    let xtinglesCollectionRef = account.getCapability(Collectible.CollectionPublicPath)!.borrow<&{Collectible.CollectionPublic}>()
        ?? panic("Could not borrow Collectible receiver reference")
    ret["Xtingles"] = xtinglesCollectionRef.getIDs()[0];

    return ret;
}

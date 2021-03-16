pragma solidity ^0.4.11;

contract TestOOG {
    /// Allowed transaction types mask
    uint32 constant None = 0;
    uint32 constant All = 0xffffffff;
    uint32 constant Basic = 0x01;
    uint32 constant Call = 0x02;
    uint32 constant Create = 0x04;
    uint32 constant Private = 0x08;

    function allowedTxTypes(address sender) public returns (uint32)
    {
        if (sender == 0x919f74bd9684168951c203bc88c6aa7e6ce210fc) return All; // Secret: 0x00..01
        if (sender == 0x972882f993599daf2870f910bae38fafeaa6d210) return Basic | Call; // Secret: 0x00..02
        if (sender == 0xba50e51c5c3e5a3b77dd66ad04d53e3ad6396197) return Basic; // Secret: 0x00..03
        return None;
    }
}
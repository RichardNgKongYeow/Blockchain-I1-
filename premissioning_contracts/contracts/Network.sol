pragma solidity ^0.4.11;

contract PeerManager {
    struct PeerInfo {
        bytes32 public_low;
        bytes32 public_high;
    }

    mapping(uint => PeerInfo) peers;

    bool[5][5] allowedConnections;

    function PeerManager() {
        peers[0] = PeerInfo(0xa48f58f39b6c9b540f8752556b0583e98aa54f584eba0fae98b7131fb6251d7f, 0xea17cf96e03e8ba9dc616c09e2569dff07868df962f66e72bf182b1e279e27ea);
        peers[1] = PeerInfo(0x69f026c473e04dec70a003416a772116b9471e71be255eedd2e5f7dea44033d8, 0xbe0f5919f412aff17416c9c8b29831e264ead25287131017b12c11132602c89a);
        peers[2] = PeerInfo(0xad4abc891debed73584f1ecdc353038486b8c4855d94e0f2bede660d0d606fb9, 0x2d0da47db997bbdbcfaa107bc63deb5325dba0afa5914904fa488b645b6b6aec);
        peers[3] = PeerInfo(0x879d61e120dce78bb57a5d3d280b540bd66c5d9756b60325b25b11698bbb5d5d, 0x124abcfa32792aab9cafe3898d174992e3fe6ae7c86dcefa98edb1e0d9640868);
        peers[4] = PeerInfo(0x83e50951d3e08083df25712385b8a20d77c475fb0468c35b500cfe6634db0a88, 0x3d7917972f72a77231927ec31838361565337a651ca6944fb0a266e38f43eae1);

        allowedConnections[0][0] = true;
        allowedConnections[0][1] = true;
        allowedConnections[0][2] = true;
        allowedConnections[0][3] = true;
        allowedConnections[0][4] = true;
        allowedConnections[1][0] = true;
        allowedConnections[1][1] = true;
        allowedConnections[1][2] = true;
        allowedConnections[1][3] = true;
        allowedConnections[1][4] = true;
        allowedConnections[2][0] = true;
        allowedConnections[2][1] = true;
        allowedConnections[2][2] = true;
        allowedConnections[2][3] = false;
        allowedConnections[2][4] = true;
        allowedConnections[3][0] = true;
        allowedConnections[3][1] = true;
        allowedConnections[3][2] = false;
        allowedConnections[3][3] = true;
        allowedConnections[3][4] = false;
        allowedConnections[4][0] = true;
        allowedConnections[4][1] = true;
        allowedConnections[4][2] = true;
        allowedConnections[4][3] = false;
        allowedConnections[4][4] = true;
    }

    function connectionAllowed(bytes32 sl, bytes32 sh, bytes32 pl, bytes32 ph) constant returns (bool res) {
        uint index1 = 0;
        bool index1_found = false;
        uint index2 = 0;
        bool index2_found = false;
        for (uint i = 0; i < 5; i++) {
            PeerInfo storage peer = peers[i];

            if (sh == peer.public_high && sl == peer.public_low) {
                index1 = i;
                index1_found = true;
            }

            if (ph == peer.public_high && pl == peer.public_low) {
                index2 = i;
                index2_found = true;
            }
        }

        if (!index1_found || !index2_found) {
            return false;
        }

        return allowedConnections[index1][index2];
    }
}

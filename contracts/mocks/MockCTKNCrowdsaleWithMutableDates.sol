// solhint-disable no-empty-blocks
pragma solidity ^0.4.19;

import '../CTKNCrowdsale.sol';


contract MockCTKNCrowdsaleWithMutableDates is CTKNCrowdsale {

    function MockCTKNCrowdsaleWithMutableDates(
        uint256 _openingTime,
        uint256 _closingTime,
        uint256 _rate,
        uint256 _dollarRate,
        uint256 _cap,
        uint256 _goal,
        address _wallet,
        address _refundWallet,
        MintableToken _token
    )
        public
        CTKNCrowdsale(
            _openingTime,
            _closingTime,
            _rate,
            _dollarRate,
            _cap,
            _goal,
            _wallet,
            _refundWallet,
            _token
        )
    {
        // empty by design
    }

    /**
     *  allows tests to wind the clock back
     *  @param secs The number of seconds to wind back the `openingTime` and `closingTime`.
     */
    function turnBackTime(uint256 secs) external {
        uint256 cTime = closingTime;
        openingTime -= secs;
        closingTime -= secs;
    }

    function getNow() external view returns (uint256) {
        return now;
    }
}

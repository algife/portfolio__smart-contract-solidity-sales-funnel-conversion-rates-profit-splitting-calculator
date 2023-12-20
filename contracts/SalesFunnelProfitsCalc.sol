// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

/*
This contract sets a sales funnel with its multiple conversion steps,
calculates how much % of the audience passes through each funnel' step
and it calculates the profitability of the process for the leads converted
to a sale at an average ticket specified (sale value)
*/

contract SalesFunnelProfitsCalc {
    uint16 private NON_FIXED_SCALE_FACTOR = 1000;
    uint32 private baseAudience = 500; // Consideration
    uint32[3] private resultsByStep = [200, 120, 50];
    uint32[3] private conversionRatesByStep = [
        // (numbers scaled by the NON_FIXED_SCALE_FACTOR to bypass the fixed type)
        300, // Intent
        700, // Evaluation
        900 // Purchase
    ];
    // Profitability
    uint16 private saleValue = 300; // Price or LTV (value of the sale)
    uint32 private affiliateFee = 120; // scaled by 1000 to avoid using the fixed type
    uint32 private revenue = 0; // Accumulated profitability (Last step audience X sale value)

    // Setters
    // --------------------------
    function setBaseAudience(uint32 num) external {
        baseAudience = num;
    }

    function setSaleValue(uint16 num) external {
        saleValue = num;
    }

    function setConversionRates(uint8 stepNum, uint32 rate) external {
        require(
            stepNum > 0 && stepNum <= conversionRatesByStep.length,
            "Invalid step number"
        );
        conversionRatesByStep[stepNum - 1] = rate;
    }

    function setStepResult(uint8 stepNum, uint32 stepResult) internal {
        resultsByStep[stepNum - 1] = stepResult;
    }

    function setAffiliateFee(uint32 newFee) external {
        affiliateFee = newFee; // SHOULD BE SCALED BY THE FACTORS STABLISHED.
    }

    // Getters
    // --------------------------
    function getTotalRevenue() external view returns (uint32) {
        return revenue;
    }

    function getMyProfits() external view returns (uint32) {
        return ((((NON_FIXED_SCALE_FACTOR - affiliateFee) * revenue)) /
            NON_FIXED_SCALE_FACTOR);
    }

    function getAffiliateProfits() external view returns (uint32) {
        return (affiliateFee * revenue) / NON_FIXED_SCALE_FACTOR;
    }

    function getAudience() external view returns (uint32) {
        return baseAudience;
    }

    function getConversionTotals() external view returns (uint32[3] memory) {
        return resultsByStep;
    }

    function getConversionRates() external view returns (uint32[3] memory) {
        return conversionRatesByStep;
    }

    function getAffiliateFee() external view returns (uint32) {
        return affiliateFee;
    }

    // Audience
    // --------------------------
    function addBaseAudience(uint32 num) public {
        baseAudience += num;
    }

    function subtractBaseAudience(uint32 num) public {
        baseAudience -= num;
    }

    function multiplyBaseAudienceBy(uint32 num) public {
        baseAudience *= num;
    }

    function divideBaseAudienceBy(uint32 num) public {
        baseAudience /= num;
    }

    // Conversion Calculations
    // --------------------------
    function calculateProfits() internal {
        revenue = resultsByStep[resultsByStep.length - 1] * saleValue;
    }

    function calculateResultsUpToStep(uint8 stepNum) internal {
        // Allows extensibility
        require(
            stepNum > 0 && stepNum <= conversionRatesByStep.length,
            "Invalid step number"
        );

        // Calculate results step by step
        uint32 accumulatedValue = baseAudience;
        for (uint8 i = 0; i < conversionRatesByStep.length; i++) {
            uint8 iStep = i + 1;
            if (i < stepNum) {
                accumulatedValue =
                    (accumulatedValue * conversionRatesByStep[i]) /
                    NON_FIXED_SCALE_FACTOR;
            } else accumulatedValue = 0;

            setStepResult(iStep, accumulatedValue);
        }

        // Re-calculate the total profit at the end
        calculateProfits();
    }

    function calculateResults() external {
        calculateResultsUpToStep(3);
    }
}
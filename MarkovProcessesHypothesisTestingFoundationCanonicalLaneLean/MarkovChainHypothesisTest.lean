import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovChainHypothesisTest where
  stateSpace : Type u
  transitionMatrix : Type v
  initialDistribution : Type w
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testStatistic : Prop
  rejectionRegion : Prop
  testPower : Prop
  significanceLevel : Prop

structure MarkovChainHypothesisTestEvidence (H : MarkovChainHypothesisTest) where
  nullHypothesisClosed : H.nullHypothesis
  alternativeHypothesisClosed : H.alternativeHypothesis
  testStatisticClosed : H.testStatistic
  rejectionRegionClosed : H.rejectionRegion
  testPowerClosed : H.testPower
  significanceLevelClosed : H.significanceLevel

def MarkovChainHypothesisTestClosed (H : MarkovChainHypothesisTest) : Prop :=
  H.nullHypothesis ∧ H.alternativeHypothesis ∧ H.testStatistic ∧
  H.rejectionRegion ∧ H.testPower ∧ H.significanceLevel

theorem markov_chain_hypothesis_test_closed_from_evidence (H : MarkovChainHypothesisTest) (E : MarkovChainHypothesisTestEvidence H) : MarkovChainHypothesisTestClosed H := by
  exact And.intro E.nullHypothesisClosed
    (And.intro E.alternativeHypothesisClosed
      (And.intro E.testStatisticClosed
        (And.intro E.rejectionRegionClosed
          (And.intro E.testPowerClosed E.significanceLevelClosed))))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse
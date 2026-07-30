import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure HypothesisTestPackage where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testStatistic : Type u
  rejectionRegion : Set (testStatistic)
  significanceLevel : ℝ
  power : ℝ
  nullHypothesisDefined : Prop
  alternativeHypothesisDefined : Prop
  testStatisticDefined : nullHypothesisDefined
  rejectionRegionDefined : Prop
  significanceLevelClosed : Prop
  powerClosed : Prop
  significanceLevelInRange : 0 ≤ significanceLevel ∧ significanceLevel ≤ 1
  powerInRange : 0 ≤ power ∧ power ≤ 1

structure HypothesisTestEvidence (H : HypothesisTestPackage) where
  nullHypothesisDefinedClosed : H.nullHypothesisDefined
  alternativeHypothesisDefinedClosed : H.alternativeHypothesisDefined
  rejectionRegionDefinedClosed : H.rejectionRegionDefined
  significanceLevelClosedClosed : H.significanceLevelClosed
  powerClosedClosed : H.powerClosed

def HypothesisTestClosed (H : HypothesisTestPackage) : Prop :=
  H.nullHypothesisDefined ∧ H.alternativeHypothesisDefined ∧
  H.rejectionRegionDefined ∧ H.significanceLevelClosed ∧ H.powerClosed

theorem hypothesis_test_closed_from_evidence
    (H : HypothesisTestPackage) (E : HypothesisTestEvidence H) :
    HypothesisTestClosed H := by
  exact And.intro E.nullHypothesisDefinedClosed
    (And.intro E.alternativeHypothesisDefinedClosed
      (And.intro E.rejectionRegionDefinedClosed
        (And.intro E.significanceLevelClosedClosed E.powerClosedClosed)))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse
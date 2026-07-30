import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure NullHypothesis (S : Type u) [MeasurableSpace S] where
  stationaryDistribution : Measure S
  property : Prop

structure AlternativeHypothesis (S : Type u) [MeasurableSpace S] where
  deviation : Prop
  magnitude : ℝ

structure HypothesisTestPackage (S : Type u) [MeasurableSpace S] where
  null : NullHypothesis S
  alternative : AlternativeHypothesis S
  testStatistic : (S → ℝ) → ℝ
  rejectionRegion : ℝ → Set S
  significanceLevel : ℝ
  power : Prop
  consistency : Prop

structure HypothesisTestEvidence (S : Type u) [MeasurableSpace S] (H : HypothesisTestPackage S) where
  nullHypothesisWellDefined : H.null.property
  alternativeHypothesisWellDefined : H.alternative.deviation
  testStatisticClosed : Prop
  rejectionRegionClosed : Prop
  significanceLevelClosed : H.significanceLevel > 0 ∧ H.significanceLevel < 1
  powerClosed : H.power
  consistencyClosed : H.consistency

def HypothesisTestClosed (S : Type u) [MeasurableSpace S] (H : HypothesisTestPackage S) : Prop :=
  H.null.property ∧ H.alternative.deviation ∧ H.power ∧ H.consistency

theorem hypothesis_test_closed_from_evidence (S : Type u) [MeasurableSpace S] (H : HypothesisTestPackage S) (E : HypothesisTestEvidence S H) : HypothesisTestClosed S H := by
  exact And.intro E.nullHypothesisWellDefined (And.intro E.alternativeHypothesisWellDefined (And.intro E.powerClosed E.consistencyClosed))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse
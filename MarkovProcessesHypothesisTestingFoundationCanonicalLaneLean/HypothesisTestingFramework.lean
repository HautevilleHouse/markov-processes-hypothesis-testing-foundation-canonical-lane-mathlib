import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure HypothesisTestPackage (A : AdmissibleClass) where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testStatistic : Type u
  rejectionRegion : Type v
  significanceLevel : ℝ
  powerFunction : Type w
  nullHypothesisClosed : nullHypothesis
  alternativeHypothesisClosed : alternativeHypothesis
  testStatisticDefined : Prop
  rejectionRegionMeasurable : Prop
  significanceLevelValid : significanceLevel > 0 ∧ significanceLevel < 1
  powerFunctionDefined : Prop

structure HypothesisTestEvidence {A : AdmissibleClass} (P : HypothesisTestPackage A) where
  nullHypothesisEvidence : P.nullHypothesis
  alternativeHypothesisEvidence : P.alternativeHypothesis
  testStatisticDefinedClosed : P.testStatisticDefined
  rejectionRegionMeasurableClosed : P.rejectionRegionMeasurable
  significanceLevelValidClosed : P.significanceLevelValid
  powerFunctionDefinedClosed : P.powerFunctionDefined

def HypothesisTestClosed {A : AdmissibleClass} (P : HypothesisTestPackage A) : Prop :=
  P.nullHypothesis ∧ P.alternativeHypothesis ∧ P.testStatisticDefined ∧
  P.rejectionRegionMeasurable ∧ P.significanceLevelValid ∧ P.powerFunctionDefined

theorem hypothesis_test_closed_from_evidence
    {A : AdmissibleClass} (P : HypothesisTestPackage A) (E : HypothesisTestEvidence P) :
    HypothesisTestClosed P := by
  exact And.intro E.nullHypothesisEvidence
    (And.intro E.alternativeHypothesisEvidence
      (And.intro E.testStatisticDefinedClosed
        (And.intro E.rejectionRegionMeasurableClosed
          (And.intro E.significanceLevelValidClosed E.powerFunctionDefinedClosed))))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse
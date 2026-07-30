import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure AsymptoticTestPackage where
  sampleSize : ℕ
  testStatisticSequence : ℕ → ℝ
  limitingDistribution : Type u
  convergenceRate : ℝ
  testStatisticDefined : Prop
  limitingDistributionDefined : Prop
  convergenceRateDefined : Prop
  sampleSizeFinite : sampleSize ≠ ∞
  convergenceRatePositive : 0 < convergenceRate

structure AsymptoticTestEvidence (A : AsymptoticTestPackage) where
  testStatisticDefinedClosed : A.testStatisticDefined
  limitingDistributionDefinedClosed : A.limitingDistributionDefined
  convergenceRateDefinedClosed : A.convergenceRateDefined

def AsymptoticTestClosed (A : AsymptoticTestPackage) : Prop :=
  A.testStatisticDefined ∧ A.limitingDistributionDefined ∧ A.convergenceRateDefined

theorem asymptotic_test_closed_from_evidence
    (A : AsymptoticTestPackage) (E : AsymptoticTestEvidence A) :
    AsymptoticTestClosed A := by
  exact And.intro E.testStatisticDefinedClosed
    (And.intro E.limitingDistributionDefinedClosed E.convergenceRateDefinedClosed)

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse
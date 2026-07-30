import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MartingaleTestPackage where
  filtration : Type u
  adaptedProcess : filtration → ℝ
  martingaleProperty : Prop
  optionalStopping : Prop
  testStatistic : ℝ
  criticalRegion : Set ℝ
  martingalePropertyDefined : Prop
  optionalStoppingDefined : Prop
  testStatisticDefined : Prop
  criticalRegionDefined : Prop
  testStatisticFinite : testStatistic ≠ ∞
  criticalRegionMeasurable : Prop

structure MartingaleTestEvidence (M : MartingaleTestPackage) where
  martingalePropertyDefinedClosed : M.martingalePropertyDefined
  optionalStoppingDefinedClosed : M.optionalStoppingDefined
  testStatisticDefinedClosed : M.testStatisticDefined
  criticalRegionDefinedClosed : M.criticalRegionDefined

def MartingaleTestClosed (M : MartingaleTestPackage) : Prop :=
  M.martingalePropertyDefined ∧ M.optionalStoppingDefined ∧
  M.testStatisticDefined ∧ M.criticalRegionDefined

theorem martingale_test_closed_from_evidence
    (M : MartingaleTestPackage) (E : MartingaleTestEvidence M) :
    MartingaleTestClosed M := by
  exact And.intro E.martingalePropertyDefinedClosed
    (And.intro E.optionalStoppingDefinedClosed
      (And.intro E.testStatisticDefinedClosed E.criticalRegionDefinedClosed))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse